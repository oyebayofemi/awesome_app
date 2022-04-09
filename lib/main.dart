import 'package:awesome_app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'testing.dart';
import 'homepage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ConstantPreferences.prefs = await SharedPreferences.getInstance();

  runApp(MaterialApp(
    //home: HomePage(),
    initialRoute: ConstantPreferences.prefs.getBool('LoggedIn') == true
        ? '/testing'
        : '/h',
    routes: {
      '/testing': (context) => Testing(),
      '/h': (context) => Homepage(),
    },
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
    );
  }
}
