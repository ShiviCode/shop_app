import 'package:flutter/material.dart';

import '../screens/oders_screen.dart';
import '../screens/product_detail_screen.dart';
import '../screens/products_overview_screen.dart';
import '../screens/user_product_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(title: Text('hello Frind'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: (){
               Navigator.of(context).pushReplacementNamed(ProductsOverviewScreen.routeName);
            },
          ),

          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Oders'),
            onTap: (){
               Navigator.of(context).pushNamed(OdersScreen.routeName);
            },
          ),

          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage product'),
            onTap: (){
               Navigator.of(context).pushNamed(UserProductScreen.routeName);
            },
          ),


        ],
      ),
    );
  }
}