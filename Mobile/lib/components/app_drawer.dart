import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ngtv_mobile/ui/app_colors.dart';
import 'package:provider/provider.dart';

import 'package:ngtv_mobile/providers/user_provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text(Provider.of<UserProvider>(context).email),
            accountName: Text(Provider.of<UserProvider>(context).name),
            currentAccountPicture: CircleAvatar(
              backgroundColor: primaryColor,
              backgroundImage: NetworkImage(
                  "https://avatars3.githubusercontent.com/u/36102963?s=200&v=4"),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.home),
            title: Text("Home"),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.networkWired),
            title: Text("Monitoring"),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.user),
            title: Text("Joueur"),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.warehouse),
            title: Text("Session Ec1"),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.warehouse),
            title: Text("Sessions"),
            onTap: () => Navigator.pushNamed(context, '/token'),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.building),
            title: Text("Centres sportifs"),
            onTap: () => Navigator.pushNamed(context, '/token'),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.trophy),
            title: Text("Ligues"),
            onTap: () => Navigator.pushNamed(context, '/token'),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.userAstronaut),
            title: Text("Vision"),
            onTap: () => Navigator.pushNamed(context, '/token'),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.eye),
            title: Text("Logs"),
            onTap: () => Navigator.pushNamed(context, '/token'),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.calendar),
            title: Text("Calendrier"),
            onTap: () => Navigator.pushNamed(context, '/token'),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.cog),
            title: Text("Settings"),
            onTap: () => Navigator.pushNamed(context, '/token'),
          ),
        ],
      ),
    );
  }
}
