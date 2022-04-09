import 'package:flutter/material.dart';

class drawers extends StatelessWidget {
  const drawers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.all(0), children: <Widget>[
        /*DrawerHeader(
          child: Text('Hello'),
          decoration: BoxDecoration(
            color: Colors.red,
          ),
        ),*/

        UserAccountsDrawerHeader(
          accountName: Text('Oyebayo Oluwafemi'),
          accountEmail: Text('oyebayo@yahoo.com'),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage(
              'lib/assets/account_image.jpg',
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Oyebayo Femi'),
          subtitle: Text('Head developer'),
          trailing: Icon(Icons.edit_sharp),
        ),
        ListTile(
          leading: Icon(Icons.email),
          title: Text('Email'),
          subtitle: Text('oyebayo1000@yahoo.com'),
          trailing: Icon(Icons.edit_sharp),
        )
      ]),
    );
  }
}
