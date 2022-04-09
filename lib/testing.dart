import 'package:awesome_app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'namecard.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  String name = 'Change my name';
  //using underscore means its a private key word..
  TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Awesome App'),
        actions: [
          IconButton(
              onPressed: () {
                ConstantPreferences.prefs.setBool('LoggedIN', false);
                Navigator.pushReplacementNamed(context, '/h');
              },
              icon: Icon(Icons.exit_to_app)),
        ],

        //backgroundColor: Colors.purple,
      ),
      body: Center(
        /*child: Container(
          alignment: Alignment.center,
          height: 100,
          padding: EdgeInsets.all(5),
          width: 100,
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text('datas'),
        ),*/

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: NameCardWidget(name: name, name2: _name),
          ),
        ),
      ),
      drawer: drawers(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            name = _name.text;
          });
        },
        child: Icon(Icons.send),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
