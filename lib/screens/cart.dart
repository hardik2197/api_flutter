import 'package:api_flutter/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build cart');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Container(
              child: Text(
                'Cart Items',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Consumer<CartModel>(
              builder: (context, cart, child) {
                return Expanded (
                  child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                            cart.selectedProducts[index],
                            style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: cart.selectedProducts.length),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
