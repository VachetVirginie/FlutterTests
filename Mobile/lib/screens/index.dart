import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ngtv_mobile/providers/user_provider.dart';

import 'package:ngtv_mobile/ui/app_colors.dart' as app_color;

import 'package:ngtv_mobile/components/app_drawer.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_color.backgroundColor,
      appBar: AppBar(
        backgroundColor: app_color.cardsColor,
        title: Text('Home'),
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Hi ' +
                          Provider.of<UserProvider>(context, listen: false)
                              .user
                              .name +
                          ' !',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text("SIGN OUT"),
                    onPressed: () =>
                        Provider.of<UserProvider>(context, listen: false)
                            .signOut(),
                  ),
                  RaisedButton(
                    child: Text('SHOW TOKEN'),
                    onPressed: () => Navigator.pushNamed(context, '/token'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
