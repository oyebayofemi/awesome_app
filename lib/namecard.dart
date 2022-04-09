import 'package:flutter/material.dart';

class NameCardWidget extends StatelessWidget {
  const NameCardWidget({
    Key? key,
    required this.name,
    required TextEditingController name2,
  })  : _name = name2,
        super(key: key);

  final String name;
  final TextEditingController _name;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(
            'lib/assets/bg.jpg',
            height: 300,
            //width: 500,
            /*width: 100,
            height: 100,
            fit: BoxFit.contain,*/
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "$name",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _name,
              decoration: InputDecoration(
                hintText: 'Enter some text',
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
