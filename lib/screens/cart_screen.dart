import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/oders.dart';

import '../providers/cart.dart' show Cart; 
import '../widgets/cart_item.dart'; //as ci;




class CartScreen extends StatelessWidget {
  const CartScreen({ Key? key }) : super(key: key);

  static const routeName = '/cart_screen';

  @override
  Widget build(BuildContext context) {
     final cart = Provider.of<Cart>(context,listen: true);

    return Scaffold(
      appBar: AppBar(title: Text('cartttttt')),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('total',
                  style: TextStyle(
                    fontSize: 20),
                    ),

                   // SizedBox(width: 20,),
                   Spacer(),

                    Chip(
                      label: Text(
                        '\$${cart.totalAmount}',
                        // style: TextStyle(color: Theme.of(context).primaryTextTheme.titleMedium.color,),
                       // cart.totalAmount.toString(),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  FlatButton(onPressed: (){
                    Provider.of<Oders>(context, listen: false).addOder(
                      cart.items.values.toList(),
                      cart.totalAmount
                      );
                      cart.clearCart();
                  }, child: Text('Oder Now!!!'),),

                ],
              ),
            ),
          ),
        
          SizedBox(height: 20,),
          
          Expanded(  // consumer at stack rednotification counter // cartitem null ! ? late   //dart:html, show,as
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (ctx, i) =>
                  CartItem(
                    pdid: cart.items.keys.toList()[i],
                  id: cart.items.values.toList()[i].id,
                  title: cart.items.values.toList()[i].title,
                  quantity: cart.items.values.toList()[i].quantity,
                   price: cart.items.values.toList()[i].price),
              
              ),
          ),
        ],
      ),
      
    );
  }
}