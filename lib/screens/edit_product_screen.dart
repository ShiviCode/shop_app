import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/products_provider.dart';

class EditProductScreen extends StatefulWidget {

 static const routeName = '/edit-product';

  const EditProductScreen({ Key? key }) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
    final _priceFocusNode = FocusNode();
    final _descriptionFocusNode = FocusNode();
    final _imagecontroller = TextEditingController();
    final _form = GlobalKey<FormState>();
    var _editedProduct = Product(
      id: '', 
      title: '', 
      description: '',
       price: 0, 
       imageUrl: ''
       );
      var _initValue = {
        'title':'',
        'description':'',
        'price':'',
        'imageUrl':'',
      };
      var _isInit = true;

    @override
    void dispose(){
      _priceFocusNode.dispose();
      _descriptionFocusNode.dispose();
      _imagecontroller.dispose();
      super.dispose();
    }

    void didChangeDependencies(){
     if(_isInit){
       final productId = ModalRoute.of(context)!.settings.arguments as String?;
        
        if(productId!=null){
      _editedProduct = Provider.of<ProductsProvider>(context, listen: false).findById(productId);
       _initValue = {
          'title':_editedProduct.title,
        'description':_editedProduct.description,
        'price':_editedProduct.price.toString(),
        //'imageUrl':_editedProduct.imageUrl,
        'imageUrl':'',
       }; 
       _imagecontroller.text = _editedProduct.imageUrl;
      }
     }
      _isInit = false;
     super.didChangeDependencies();
    }

    void _saveForm(){
      final isValid = _form.currentState!.validate();
      if(!isValid){
        return;
      }
    _form.currentState!.save();
    // print(_editedProduct.title);
    // print(_editedProduct.description);
    // print(_editedProduct.price);
    // print(_editedProduct.imageUrl);

    if(_editedProduct.id!= null){
       Provider.of<ProductsProvider>(context,listen: false).updateProduct(_editedProduct.id,_editedProduct);
    }
     else{
        Provider.of<ProductsProvider>(context,listen: false).addProduct(_editedProduct);
     }
    Navigator.of(context).pop();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Edit product '),
        actions: [
          IconButton(
            onPressed:_saveForm,
            icon: Icon(Icons.save),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key : _form,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _initValue['title'],
                decoration: InputDecoration(
                  labelText: 'title',
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                validator: (value){
                  if(value!.isEmpty){
                    return 'pls provide a title';
                  }
                  return null;
                },
                onSaved: (val){
                  _editedProduct = Product(id:_editedProduct.id,
                                           title: val!,
                                           description:_editedProduct.description,
                                           price: _editedProduct.price, 
                                           imageUrl: _editedProduct.imageUrl,
                                           isFavorite: _editedProduct.isFavorite,
                                           );
                },
                ),

                 TextFormField(
                   initialValue: _initValue['description'],
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                //textInputAction: TextInputAction.next,
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                // onFieldSubmitted: (_){
                //   FocusScope.of(context).requestFocus(_priceFocusNode);
                // },
                focusNode: _descriptionFocusNode,

                validator: (value){
                  if(value!.isEmpty){
                    return 'pls provide a description';
                  }
                  return null;
                },

                onSaved: (val){
                  _editedProduct = Product(id:_editedProduct.id,
                                           title: _editedProduct.title,
                                           description: val!,
                                           price: _editedProduct.price, 
                                           imageUrl: _editedProduct.imageUrl,
                                           isFavorite: _editedProduct.isFavorite,);
                },
                ),

                TextFormField(
                  initialValue: _initValue['price'],
                decoration: InputDecoration(
                  labelText: 'Price',
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,

                validator: (value){
                  if(value!.isEmpty){
                    return 'pls provide a price';
                  }
                  if(double.tryParse(value) == null){
                    return 'Please enter a valid number';
                  }
                  if(double.parse(value) <= 0){
                    return 'please enter a digit greater then 0';
                  }
                  return null;
                },

                onSaved: (val){
                  _editedProduct = Product(id:_editedProduct.id,
                                           title: _editedProduct.title,
                                           description:_editedProduct.description,
                                           price:double.parse(val!), 
                                           imageUrl: _editedProduct.imageUrl,
                                           isFavorite: _editedProduct.isFavorite,
                                           );
                },
                ),

                Row(
                //  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(top: 8, right: 10,),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.blue)
                      ),
                      child: _imagecontroller.text.isEmpty 
                      ? Text('enter a url') 
                      : FittedBox(
                        child: Image.network(_imagecontroller.text),
                        fit: BoxFit.cover,
                        ) ,
                    ),
                    Expanded(

                      child: TextFormField(
                        //initialValue: _initValue['imageUrl'],
                        decoration: InputDecoration(labelText: 'input url'),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imagecontroller,
                        onFieldSubmitted: (_){
                             _saveForm();
                        },

                        validator: (value){
                          if(value!.isEmpty){
                              return 'pls provide a url';
                            }
                            return null;
                          },
                        onSaved: (val){
                  _editedProduct = Product(id:_editedProduct.id,
                                           title: _editedProduct.title,
                                           description:_editedProduct.imageUrl,
                                           price: _editedProduct.price, 
                                           imageUrl: val!,
                                           isFavorite: _editedProduct.isFavorite,
                                           );
                },
                      ),
                    ),
                  ],
                )
            ],
          )),
      ),
    );
  }
}