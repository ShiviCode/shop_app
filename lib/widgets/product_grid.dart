import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../widgets/product__item.dart';
//import '../models/product.dart';
class ProductGrid extends StatelessWidget {
  final bool showfav;

  ProductGrid(this.showfav);
  
  //ProductGrid(this.loadedProducts);
  //final List<Product> loadedProducts;

  @override
  Widget build(BuildContext context) {

   final productData = Provider.of<ProductsProvider>(context,listen: false);
   final products = showfav? productData.favoritesItem : productData.items;

    return  GridView.builder(
         padding: const EdgeInsets.all(10),
         itemCount: products.length,
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      //  itemBuilder: (ctx, i) => ProductItem(
      //    products[i].id,
      //    products[i].title,
      //    products[i].imageUrl,
      //    ),
         itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
            // builder: (c) => products[i],
            value: products[i],
            child: ProductItem(),
       ),
      // itemBuilder
       );
  }
  
}