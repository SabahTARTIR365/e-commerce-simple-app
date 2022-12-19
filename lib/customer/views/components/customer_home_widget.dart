import 'package:carousel_slider/carousel_slider.dart';
import 'package:firbase_app_test/customer/views/all_products_screen.dart';
import 'package:firbase_app_test/customer/views/components/slider_card.dart';
import 'package:firbase_app_test/data_repositories/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../admin/providers/admin_provider.dart';
import '../../../admin/views/components/discount_widget.dart';
import '../../../app_router/app_router.dart';
import '../../../utils.dart';
import 'custom_app_bar.dart';

class CustomerHomeWidget extends StatefulWidget
{
  const CustomerHomeWidget({super.key});

  @override
  State<CustomerHomeWidget> createState() => _CustomerHomeWidgetState();
}

class _CustomerHomeWidgetState extends State<CustomerHomeWidget> {
  int currentIndex = 0;

  updateIndex(x, v) {
    currentIndex = x;
    setState(() {});
  }

  goToWebsite(String url) async {
    // "whatsapp://send?phone=$number&text=${Uri.encodeFull('message')}"
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
   return Consumer<AdminProvider>(
       builder: (context, provider, index) {
         return Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             provider.allSliders == null
                 ? SizedBox(
               height: 220,
               child: Center(
                 child: CircularProgressIndicator(),
               ),
             )
                 : Column(
               children: [
                   SizedBox(height: 35,),
                   CustomAppBar(),
                   SizedBox(height: 30,),
                   DiscountWidget(),
                   CarouselSlider(
                   options: CarouselOptions(
                       height: 150,
                       onPageChanged: updateIndex,
                       autoPlay: true,
                       viewportFraction: 1),
                    items: provider.allSliders!.map((i) {
                       return Builder(
                           builder: (BuildContext context) {
                             return InkWell(
                             onTap: () {
                             goToWebsite(i.url!);
                             },
                           child:SliderCard(imagePath: i.imageUrl!, title:i.title!,),
                         );
                       },
                     );
                   }).toList(),
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: List.generate(provider.allSliders!.length,
                           (index) {
                         return Container(
                           margin: EdgeInsets.symmetric(horizontal: 3),
                           height: index == currentIndex ? 10 : 8,
                           width: index == currentIndex ? 10 : 8,
                           decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             color: index == currentIndex
                                 ? PrimaryColor
                                 : Colors.grey,
                           ),
                         );
                       }),
                 ),
                 SizedBox(height: 10,)
               ],
             ),
           Expanded(
               child: provider.allCategories == null
                   ? const Center(
                     child: CircularProgressIndicator(),)
                   : Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           SizedBox(
                              width: MediaQuery.of(context).size.width*0.95,
                              child: Text
                                     ( 'All Categories',
                                   style: SafeGoogleFont ('Muli',
                                         fontSize: 23,
                                         fontWeight: FontWeight.w500,
                                          color: Color(0xff000000),),
                                      ),
                                    ),
                           const SizedBox(height: 5,),
                           Expanded(
                               child: GridView.builder(
                                   gridDelegate:
                                 const SliverGridDelegateWithFixedCrossAxisCount(
                                     crossAxisCount: 3,
                                     mainAxisSpacing: 10,
                                     crossAxisSpacing: 10),
                                 itemCount: provider.allCategories!.length,
                                 itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: ()
                                    {
                                   provider.getAllProducts(provider.allCategories![index].id!);
                                     AppRouter.appRouter.goToWidget(
                                       AllProductsScreen(provider.allCategories![index]));
                                     },
                                   child: Column(
                                     children: [
                                       SizedBox(
                                         height: 94,
                                         width: 94,
                                         child: ClipRRect(
                                             borderRadius: BorderRadius.circular(10),
                                           child: Image.network(
                                           provider
                                               .allCategories![index].imageUrl,
                                           fit: BoxFit.cover,
                                       ),
                                         ),
                                 ),

                                       SizedBox(height: 5),
                                       Text(provider.allCategories![index].nameEn,
                                           style: SafeGoogleFont ('Muli',
                                             fontWeight: FontWeight.w500,
                                             color: Color(0xff000000),),
                                           textAlign: TextAlign.center)
                                     ],
                                   ),
                               );
                             }))
                   ],
                 ),
               ),
             )
           ],
         );
       },
     );

  }
}