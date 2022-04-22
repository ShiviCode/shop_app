import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
 //final String title;

 static const routeName = '/product-detail'; 

 // ProductDetailScreen(this.title);

  @override
  Widget build(BuildContext context) {

    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct = Provider.of<ProductsProvider>(context, listen: false).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title,style: TextStyle(),),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
            height: 300,
            child: Image.network(
              loadedProduct.imageUrl,
              fit: BoxFit.cover,
              ),
          ),

          SizedBox(height: 10,),
          Text('\$${loadedProduct.price}'),

          SizedBox(height: 10,),
           Container(
             width: double.infinity,
           padding: EdgeInsets.symmetric(horizontal: 50),
             child: Text(
               loadedProduct.description,
               softWrap: true,
               textAlign: TextAlign.center,
               ),
            ),
          ],
        ),
      ),
    
    );
  }
}