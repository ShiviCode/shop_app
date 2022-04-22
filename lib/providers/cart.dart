import 'package:flutter/material.dart';

class CartItem{
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });

}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items={};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int  get itemCount {
      //return _items == null ? 0 :_items.length;
      return  _items.length;
  }

  double get totalAmount {
    var total = 0.0;
      _items.forEach((key, CartItem) {
        total += CartItem.price * CartItem.quantity;
       }); 
    return total;
  }

  void addItem (String productId, double price, String title){
     if(_items.containsKey(productId)){
        _items.update(productId, (oldCartValue) => CartItem(
          id: oldCartValue.id,
           title: oldCartValue.title,
            quantity: oldCartValue.quantity+1,
             price: oldCartValue.price,
             ),
          );
     }
     else{
       _items.putIfAbsent(productId, () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          quantity: 1, 
          price: price),);
     }
 notifyListeners();

  }
 
  void removeItem(String pdid){
      _items.remove(pdid);
      notifyListeners();
  }

  void removeSingalItem(String pd){
    if (!_items.containsKey(pd)){
        return;
    }if(_items[pd]!.quantity > 1){
       _items.update(pd, (existingcartitem) => CartItem(
         id: existingcartitem.id,
          title:existingcartitem.title, 
          quantity: existingcartitem.quantity -1,
           price: existingcartitem.price));
    } else{
      _items.remove(pd); 
    }
    notifyListeners();
  }

  void clearCart(){
    _items = {};
    notifyListeners();
  }

}