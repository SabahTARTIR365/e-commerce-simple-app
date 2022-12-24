import 'dart:developer';
import 'dart:io';

import 'package:firbase_app_test/admin/models/category.dart';
import 'package:firbase_app_test/admin/models/product.dart';
import 'package:firbase_app_test/admin/models/slider.dart';
import 'package:firbase_app_test/admin/views/screens/add_new_slider.dart';
import 'package:firbase_app_test/admin/views/screens/edit_category.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/cart.dart';
import '../views/screens/edit_product_screen.dart';
import '/app_router/app_router.dart';
import '/data_repositories/firestore_helper.dart';
import '/data_repositories/storage_helper.dart';
import 'package:flutter/material.dart' hide Slider;
import 'package:image_picker/image_picker.dart';

class AdminProvider extends ChangeNotifier {
  AdminProvider() {
    getAllCategories();
    getAllSliders();
    getCart();
  }
  String? requiredValidation(String? content) {
    if (content == null || content.isEmpty) {
      return "Required field";
    }
  }

  // add new category
  File? imageFile;
  TextEditingController catNameArController = TextEditingController();
  TextEditingController catNameEnController = TextEditingController();
  GlobalKey<FormState> categoryFormKey = GlobalKey<FormState>();
  pickImageForCategory() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  addProductToCart(Product product) async{
    //Cart cart=Cart(product: product);
    String? id =await FirestoreHelper.firestoreHelper.addProductToCart(product);
    if (id != null) {
      product.id = id;
      cart?.add(product);
      AppRouter.appRouter
          .showCustomDialoug('Success', 'Your product added to cart');
      log(product.name);
      notifyListeners();
    }

  }


  addNewCategory() async {
    if (imageFile != null) {
      if (categoryFormKey.currentState!.validate()) {
        // add category process
        AppRouter.appRouter.showLoadingDialoug();
        String imageUrl = await StorageHelper.storageHelper
            .uploadNewImage("cats_images", imageFile!);
        Category category = Category(
            imageUrl: imageUrl,
            nameAr: catNameArController.text,
            nameEn: catNameEnController.text);

        String? id =
            await FirestoreHelper.firestoreHelper.addNewCategory(category);

        AppRouter.appRouter.hideDialoug();
        if (id != null) {
          category.id = id;
          allCategories!.add(category);
          notifyListeners();
          catNameArController.clear();
          catNameEnController.clear();
          imageFile = null;
          notifyListeners();
          AppRouter.appRouter
              .showCustomDialoug('Success', 'Your category has been added');
        }
      }
    } else {
      AppRouter.appRouter
          .showCustomDialoug('Error', 'You have to pick image first');
    }
  }

  // get cateogies
  List<Category>? allCategories;
  List<Product>? allProducts;
  List<Product>? cart;
  List<Slider>? allSliders;
  double cost =0;

  getCart()async{
    cart = await FirestoreHelper.firestoreHelper.getCatrsProducts();
    notifyListeners();
  }
   double getTotalCash()
   {
     cost=0;
     cart?.forEach((e) {
       print(e.price);
       cost += double.parse(e.price);});
     print(cost);
     return cost;

   }
  getAllCategories() async {
    allCategories = await FirestoreHelper.firestoreHelper.getAllCategories();
    notifyListeners();
  }

  // delete category
  deleteCategory(Category category) async {
    AppRouter.appRouter.showLoadingDialoug();
    bool deleteSuccess =
        await FirestoreHelper.firestoreHelper.deleteCategoey(category.id!);
    if (deleteSuccess) {
      allCategories!.remove(category);
      notifyListeners();
    }
    AppRouter.appRouter.hideDialoug();
  }
  deleteProduct(Product product) async {
    AppRouter.appRouter.showLoadingDialoug();
    bool deleteSuccess =
    await FirestoreHelper.firestoreHelper.deleteProduct(product);
    if (deleteSuccess) {
      allProducts!.remove(product);
      notifyListeners();
    }
    AppRouter.appRouter.hideDialoug();
  }
  
  
  

  deleteProductFromCart(Product product) async {
    AppRouter.appRouter.showLoadingDialoug();
    bool deleteSuccess =
    await FirestoreHelper.firestoreHelper.deleteProductFromCart(product.id!);
    if (deleteSuccess) {
      cart!.remove(product);
      notifyListeners();
    }
    AppRouter.appRouter.hideDialoug();
  }


  goToEditCategoryPage(Category category) {
    catNameArController.text = category.nameAr;
    catNameEnController.text = category.nameEn;
    AppRouter.appRouter.goToWidget(EditCategory(category));
  }

  goToEditProductPage(Product product){
    productNameController.text=product.name;
    productDescriptionController.text=product.description;
    productPriceController.text=product.price;
    AppRouter.appRouter.goToWidget(EditProductScreen(product));

  }

  updateProduct(Product product)async
  {
    AppRouter.appRouter.showLoadingDialoug();
    if (imageFile != null) {
      String imageUrl = await StorageHelper.storageHelper
          .uploadNewImage("products_images", imageFile!);
      product.imageUrl = imageUrl;
    }
    Product newProduct  = Product(
        id: product.id,
        imageUrl: product.imageUrl,
        name: productNameController.text.isEmpty
            ? product.name
            : productNameController.text,
        catId: product.catId,
        description: productDescriptionController.text.isEmpty
                   ? product.description
                   : productDescriptionController.text,

        price: productPriceController.text.isEmpty
             ? product.price
             : productPriceController.text,
    );

    bool? isUpdated =
    await FirestoreHelper.firestoreHelper.updateProduct(newProduct);
         print("reach here");
    if (isUpdated != null && isUpdated) {
      int index = allProducts!.indexOf(product);
      allProducts![index] = newProduct;
      //for cart
      getCart();
      try {
        if(cart!.contains(product))
        {
          int index2= cart!.indexOf(product);
        cart![index2] = newProduct;}
      } on Exception catch (e) {
        log(e.toString());
      }

      imageFile = null;
      productNameController.clear();
      productDescriptionController.clear();
      productPriceController.clear();
      notifyListeners();
      AppRouter.appRouter.hideDialoug();
      AppRouter.appRouter.hideDialoug();
    }




  }








  updateCategory(Category category) async {
    AppRouter.appRouter.showLoadingDialoug();
    if (imageFile != null) {
      String imageUrl = await StorageHelper.storageHelper
          .uploadNewImage("cats_images", imageFile!);
      category.imageUrl = imageUrl;
    }
    Category newCategory = Category(
        id: category.id,
        imageUrl: category.imageUrl,
        nameAr: catNameArController.text.isEmpty
            ? category.nameAr
            : catNameArController.text,
        nameEn: catNameEnController.text.isEmpty
            ? category.nameEn
            : catNameEnController.text);

    bool? isUpdated =
        await FirestoreHelper.firestoreHelper.updateCategory(newCategory);

    if (isUpdated != null && isUpdated) {
      int index = allCategories!.indexOf(category);
      allCategories![index] = newCategory;
      imageFile = null;
      catNameEnController.clear();
      catNameArController.clear();
      notifyListeners();
      AppRouter.appRouter.hideDialoug();
      AppRouter.appRouter.hideDialoug();
    }
  }

  TextEditingController sliderTitleController = TextEditingController();
  TextEditingController sliderUrlController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  GlobalKey<FormState> addProductKey = GlobalKey();
  addNewProduct(String catId) async {
    if (imageFile != null) {
      if (addProductKey.currentState!.validate()) {
        AppRouter.appRouter.showLoadingDialoug();
        String imageUrl = await StorageHelper.storageHelper
            .uploadNewImage("products_images", imageFile!);
        Product product = Product(
            imageUrl: imageUrl,
            name: productNameController.text,
            description: productDescriptionController.text,
            price: productPriceController.text,
            catId: catId);

        String? id =
            await FirestoreHelper.firestoreHelper.addNewProduct(product);

        AppRouter.appRouter.hideDialoug();
        if (id != null) {
          product.id = id;
          allProducts?.add(product);
          notifyListeners();
          productNameController.clear();
          productDescriptionController.clear();
          productPriceController.clear();
          imageFile = null;
          notifyListeners();
          AppRouter.appRouter
              .showCustomDialoug('Success', 'Your Product has been added');
        }
      }
    } else {
      AppRouter.appRouter
          .showCustomDialoug('Error', 'You have to pick image first');
    }
  }

  getAllProducts(String catId) async {
    allProducts = null;
    notifyListeners();
    List<Product>? products =
        await FirestoreHelper.firestoreHelper.getAllProducts(catId);

    allProducts = products;
    notifyListeners();
  }

  getAllSliders() async {
    allSliders = await FirestoreHelper.firestoreHelper.getAllSliders();
  }

  AddNewSlider() async {
    if (imageFile != null) {
      AppRouter.appRouter.showLoadingDialoug();
      String imageUrl = await StorageHelper.storageHelper
          .uploadNewImage("Slider_images", imageFile!);
      Slider slider = Slider(
          imageUrl: imageUrl,
          title: sliderTitleController.text,
          url: sliderUrlController.text);

      String? id = await FirestoreHelper.firestoreHelper.addNewSlider(slider);

      AppRouter.appRouter.hideDialoug();
      if (id != null) {
        slider.id = id;
        allSliders?.add(slider);
        notifyListeners();
        sliderTitleController.clear();
        sliderUrlController.clear();

        imageFile = null;
        notifyListeners();
        AppRouter.appRouter
            .showCustomDialoug('Success', 'Your Slider has been added');
      }
    } else {
      AppRouter.appRouter
          .showCustomDialoug('Error', 'You have to pick image first');
    }
  }
  //--------for map

  late GoogleMapController mapController;
  Set <Marker> markers={};
  LatLng center = const LatLng(31.768319, 35.213710);
  TextEditingController addressController = TextEditingController();
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  addMarker(LatLng value)
  {
    markers.add(Marker(markerId: MarkerId('Jersusalem'),position: value));
    notifyListeners();
  }



}
