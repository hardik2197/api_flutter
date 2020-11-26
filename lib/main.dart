import 'package:api_flutter/screens/home_page.dart';
import 'package:api_flutter/screens/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}




/*import 'package:api_flutter/model/cart_model.dart';
import 'package:api_flutter/screens/cart.dart';
import 'package:api_flutter/screens/product_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<CartModel>(
      create: (BuildContext context) => CartModel(),
      child: MaterialApp(home: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build myapp');
    return Scaffold(
        appBar: AppBar(
          title: Text('Shopping'),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
            )
          ],
        ),
        body: ProductList());
  }
}*/
