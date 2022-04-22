import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/cart_screen.dart';

import '../widgets/app_drawer.dart';
import '../providers/products_provider.dart';
import '../widgets/product_grid.dart';
import '../providers/cart.dart';

enum FilterOption{
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  static const routeName = '/Product-overview-Screen';

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showFavoritesOnly = false;
  

  @override
  Widget build(BuildContext context) {
final productContainer = Provider.of<ProductsProvider>(context, listen: false);
//final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOption value) => {
              setState((){
               if(value == FilterOption.Favorites){
               _showFavoritesOnly = true;
               }
               else{
                _showFavoritesOnly = false;
             }
              }),
             
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_)=>[
             PopupMenuItem(child: Text('Only Favorites'),value: FilterOption.Favorites,),
              PopupMenuItem(child: Text('Show all'),value: FilterOption.All,),
            ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                IconButton(icon: Icon(Icons.shopping_cart),
              onPressed: (){
                
                Navigator.of(context).pushNamed(CartScreen.routeName);
              }, ),
            
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Theme.of(context).accentColor,
                    ),
                    constraints:BoxConstraints(
                      maxWidth: 16,
                      minHeight: 16,
                    ) ,
                  // Consumer<Cart>(
                     //builder: (_, cart, ) =>
                   child: Consumer<Cart>(
                     builder: (contxt, cart,_) =>
                      Text(
                        cart.itemCount.toString(),
                        textAlign: TextAlign.center,
                         style: TextStyle(fontSize: 10,)
                         ,),
                   )
                      ),
                    //),
                ),
                
              ],
            ),
        ],
      ),
      drawer: AppDrawer(),
      body:  ProductGrid(_showFavoritesOnly),
      
    );
  }
}