//import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import '../providers/cart.dart';

class OderItems with ChangeNotifier {
  final String id;
  final double amount;
   final List<CartItem> products ;
  final DateTime dateTime;

  OderItems({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,


  });

  double get getamount {
     return amount;}
}

class Oders with ChangeNotifier{

   //OderItems am =OderItems(id: id, amount: amount, products: products, dateTime: dateTime)

   List<OderItems> _oders = [];

   List<OderItems> get oders {
    return [..._oders];
   }
   
   addOder (List<CartItem> cartproducts, double total){
     _oders.insert(0, OderItems(
       id: DateTime.now().toString(), 
       amount: total, 
       products: cartproducts, 
       dateTime: DateTime.now(),
       ),
      );
      notifyListeners();
   }
}