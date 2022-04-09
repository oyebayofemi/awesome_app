import 'dart:convert';

import 'package:awesome_app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'namecard.dart';
import 'package:http/http.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String name = 'Change my name';
  //using underscore means its a private key word..
  TextEditingController _name = TextEditingController();

  String url = 'https://jsonplaceholder.typicode.com/photos';
  var data;

  void getData() async {
    Response responseData = await get(Uri.parse(url));
    //print(responseData.body);
    setState(() {
      data = jsonDecode(responseData.body);
      print(data);
      //Map datas = jsonDecode(data);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'lib/assets/bg.jpg',
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.7),
            colorBlendMode: BlendMode.colorBurn,
          ),
          Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            CircleAvatar(
                              radius: 45,
                              backgroundColor: Colors.grey,
                              child: Icon(
                                Icons.person_outline_outlined,
                                size: 45,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _usernameController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text('Username'),
                                  hintText: 'Enter your username'),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                label: Text('Password'),
                                hintText: 'Enter password',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            FlatButton(
                              onPressed: () {
                                ConstantPreferences.prefs
                                    .setBool('LoggedIn', true);
                                Navigator.pushNamed(context, '/testing');
                              },
                              child: Text('LogIn'),
                              color: Colors.yellow,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
