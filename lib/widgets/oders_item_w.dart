import 'package:flutter/material.dart';
import 'package:shop_app/providers/oders.dart';

class OdersItemW extends StatelessWidget {
 //final OderItems orderAmount;

// OdersItemW(this.orderAmount);

  @override
  Widget build(BuildContext context) {
    return Card(
           margin: EdgeInsets.all(10),
           child: Column(
             children: [
               ListTile(
                //  title: Text('\$${orderAmount}'),
  //              title: Text('\$${orderAmount}'),
                 subtitle: Text('date'),
                 trailing: IconButton(
                   icon: Icon(Icons.expand_more),
                   onPressed: (){

                   },
                   ),
               )
             ],
           ),
         );
  }
}