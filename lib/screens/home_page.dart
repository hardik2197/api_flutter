import 'dart:convert';

import 'package:api_flutter/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<UserData> getUserData() async {
    http.Response response =
        await http.get('https://reqres.in/api/users?page=2');

    // var data = UserData.fromJson(jsonDecode(response.body));
    // print(data);
    // return data;
    return UserData.fromJson(jsonDecode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
      ),
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<UserData> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var _userData = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                var user = _userData.data[index];
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                      title: Text('${user.firstName} ${user.lastName}'),
                      subtitle: Text(user.email),
                    ),
                    Divider(
                      height: 0,
                    )
                  ],
                );
              },
              itemCount: _userData.data.length,
            );
          } else {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }
        },
        future: getUserData(),
      ),
    );
  }
}
