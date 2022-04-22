import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/oders.dart';


class OdersScreen extends StatelessWidget {

static const routeName = '/Oders_Screen';
//  final OderItems orderAmount; ////// how to acces with provoder

//  OdersScreen(this.orderAmount);


  @override
  Widget build(BuildContext context) {
   final odersData = Provider.of<Oders>(context,listen: false);
   
   //final od = Provider.of<OderItems>(context,listen: false);

    return Scaffold(
      appBar: AppBar(title: Text('Your Oders'),),
      body: ListView.builder(
        itemCount: odersData.oders.length,
        itemBuilder:
         (ctx, i) => Card(
           margin: EdgeInsets.all(10),
           child: Column(
             children: [
               ListTile(
                //  title: Text('\$${orderAmount}'),
                //title: Text('\$${od.amount}'),
                title: Text("${odersData.oders[i].amount}"),
                 subtitle: Text('date'),
                 trailing: IconButton(
                   icon: Icon(Icons.expand_more),
                   onPressed: (){

                   },
                   ),
               )
             ],
           ),
         )) ,
    );
  }
}