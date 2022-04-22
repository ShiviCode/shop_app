import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String id;

  UserProductItem({
    required this.title,
    required this.imageUrl,
    required this.id,
    });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(onPressed: (){
              Navigator.of(context).pushNamed(EditProductScreen.routeName, arguments: id);
            }, icon: Icon(Icons.edit),),
             IconButton(
               onPressed: (){
               Provider.of<ProductsProvider>(context, listen: false).deleteProduct(id);
             }, icon: Icon(Icons.delete),),
              //IconButton(onPressed: (){}, icon: Icon(Icons.edit),),
          ],
        ),
      ),
    );
  }
}