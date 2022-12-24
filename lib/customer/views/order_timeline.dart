import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../../utils.dart';
class OrderTimeLine extends StatefulWidget
{
  final String title;
  const OrderTimeLine({super.key, required this.title});

  @override
  State<OrderTimeLine> createState() => _OrderTimeLineState();
}

class _OrderTimeLineState extends State<OrderTimeLine> {


  Set<String> state={'Ordered','on progress','ready to deliver','delivered'} ;

  Widget build(BuildContext context) {
    return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30,),
          Text('Order Tracking',
              style: SafeGoogleFont ('Muli',
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: Colors.grey,)),
           Expanded(
             child: Timeline.tileBuilder(
                builder: TimelineTileBuilder.fromStyle(
                  contentsAlign: ContentsAlign.alternating,
                  contentsBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text('${state.elementAt(index)}'),
                  ),
                  itemCount: 4,
                ),
          ),
           ),
        ],

    );
  }

}



