import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem  extends StatelessWidget {
 // const CartItem ({ Key? key }) : super(key: key);
   final String pdid;
  final  String id;
  final String title;
  final double price;
  final int quantity;

  CartItem({
    required this.pdid,
   required this.id,
   required this.title,
   required this.price,
   required this.quantity,
    });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color:Colors.red,
        child: Icon(Icons.delete,color: Colors.white,),
        alignment:Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        ),
        direction: DismissDirection.endToStart,

        confirmDismiss: (direction){
          return showDialog(
            context: context, 
          builder: (ctx) => AlertDialog(
            title: Text('are you sure?'),
            content: Text('Do you want to delet the cart item from the cart!'),
            actions: [
              FlatButton(onPressed: (){
                Navigator.of(ctx).pop(true);
              }, child: Text('YES')),

              FlatButton(onPressed: (){
                Navigator.of(ctx).pop(false);
              }, child: Text('NO')),
            ],
          ));
        },
      
        onDismissed: (direction){
          Provider.of<Cart>(context, listen: false).removeItem(pdid);
        },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
           leading: CircleAvatar(child: Text('\$$price'),), 
           title: Text(title),
           subtitle: Text('total : \$${price * quantity}'),
           trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}