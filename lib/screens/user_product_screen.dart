import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../widgets/app_drawer.dart';
import '../widgets/user_product_item.dart';
import '../providers/products_provider.dart';
import 'edit_product_screen.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({ Key? key }) : super(key: key);

  static const routeName = '/user-product-screen';

  @override
  Widget build(BuildContext context) {
  final productdata = Provider.of<ProductsProvider>(context);

    return Scaffold(
         appBar: AppBar(
        title: Text('Your product'),
        actions: [
          IconButton(onPressed: (){
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
           icon: Icon(Icons.add),
          ),
        ],
        ),    
        drawer: AppDrawer(),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: productdata.items.length,
            itemBuilder: (ctx, i) => 
            UserProductItem(
              id:productdata.items[i].id,
              title: productdata.items[i].title,
              imageUrl: productdata.items[i].imageUrl,
            ),
                ),
            
           ),
       
    );
  }
}