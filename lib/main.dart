import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/oders_screen.dart';
import '../providers/cart.dart';
import '../providers/oders.dart';
import './screens/cart_screen.dart';

import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';
import './providers/products_provider.dart';
import 'screens/edit_product_screen.dart';
import 'screens/user_product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
       ChangeNotifierProvider(create: (ctx) => ProductsProvider(), ),
       
       ChangeNotifierProvider(create: (ctx) => Cart(), ),

       ChangeNotifierProvider(create: (ctx) => Oders(), ),
       
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
         
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
    
        home:  ProductsOverviewScreen(),
        routes: {
          ProductsOverviewScreen.routeName : (context) => ProductsOverviewScreen(),
          ProductDetailScreen.routeName : (context) => ProductDetailScreen(),
          CartScreen.routeName : (context) => CartScreen(),
          OdersScreen.routeName : (context) => OdersScreen(), 
          UserProductScreen.routeName : (context) =>  UserProductScreen(),
          EditProductScreen.routeName : (context) =>  EditProductScreen(),

        },
      ),
    );
  }
}

