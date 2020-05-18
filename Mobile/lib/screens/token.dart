import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ngtv_mobile/providers/user_provider.dart';
import 'package:ngtv_mobile/ui/app_colors.dart' as app_color;

class Token extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_color.backgroundColor,
      appBar: AppBar(
        backgroundColor: app_color.cardsColor,
        title: Text('JWT Token'),
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(10),
        child: Text(Provider.of<UserProvider>(context, listen: false).token),
      )),
    );
  }
}
