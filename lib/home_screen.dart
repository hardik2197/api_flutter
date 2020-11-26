import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) => Column(
          children: [
            ListTile(
              title: Text('Username'),
              subtitle: Text('email'),
              leading: Icon(Icons.add),
            )
          ],
        ),
        itemCount: 10,
      ),
    );
  }
}
