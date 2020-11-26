import 'package:api_flutter/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  final products = List<String>.generate(10, (index) => 'Product no $index');

  @override
  Widget build(BuildContext context) {
    print('build product list');
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              products[index],
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
            onTap: () {
              Provider.of<CartModel>(context, listen: false)
                  .add(products[index]);

              SnackBar snackBar = SnackBar(
                content: Text('Product no $index is added'),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            },
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: products.length);
  }
}
