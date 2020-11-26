import 'dart:convert';
import 'package:api_flutter/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailTextEditingController = TextEditingController();

  TextEditingController _passwordTextEditingController =
      TextEditingController();

  bool progress = false;

  Future<Map> isValidate(String email, String password) async {
    Map reqBody = {'email': email, 'password': password};
    http.Response response =
        await http.post('https://reqres.in/api/login', body: reqBody);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return {'message': 'done!', 'token': data['token'], 'isLogin': true};
    } else {
      var data = jsonDecode(response.body);
      return {'message': data['error'], 'token': '', 'isLogin': false};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Demo'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              TextField(
                controller: _emailTextEditingController,
                decoration: InputDecoration(hintText: 'UserName'),
              ),
              TextField(
                controller: _passwordTextEditingController,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              Builder(
                builder: (BuildContext context) => RaisedButton(
                  onPressed: () async {
                    setState(() {
                      progress = true;
                    });
                    Map result = await isValidate(
                        _emailTextEditingController.text,
                        _passwordTextEditingController.text);
                    if (result['isLogin'] == false) {
                      Scaffold.of(context)
                          .showSnackBar(
                              SnackBar(content: Text(result['message'])))
                          .closed
                          .then((value) {
                        setState(() {
                          progress = false;
                        });
                      });
                    } else {
                      setState(() {
                        progress = false;
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }
                  },
                  child: Text('LogIn'),
                ),
              )
            ],
          ),
          progress
              ? Container(
                  color: Colors.black.withOpacity(0.5),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: CupertinoActivityIndicator(
                      radius: 20,
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
