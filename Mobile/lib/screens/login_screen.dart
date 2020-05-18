import 'package:flutter/material.dart';
import 'package:ngtv_mobile/providers/user_provider.dart';
import 'package:ngtv_mobile/ui/app_colors.dart' as app_color;
import 'package:ngtv_mobile/components/spinner.dart';
import 'package:ngtv_mobile/ui/ui_helper.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email;
  TextEditingController _password;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: "");
    _password = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    // LOGO
    final logo = Hero(
      tag: 'hero',
      child: Image.asset('assets/images/logo_white.png'),
    );

    // EMAIL Input
    final email = Container(
      decoration: BoxDecoration(
        color: app_color.inputTextColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        controller: _email,
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter your email';
          }
          if (!value.contains('@')) {
            return 'Please enter valid email';
          }
          return null;
        },
        cursorColor: app_color.primaryColor,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Email',
          prefixIcon: Icon(Icons.email),
          border: InputBorder.none,
        ),
      ),
    );

    // PASSWORD Input
    final password = Container(
      decoration: BoxDecoration(
        color: app_color.inputTextColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        controller: _password,
        validator: (value) => (value.isEmpty) ? "Please Enter Password" : null,
        cursorColor: app_color.primaryColor,
        autofocus: false,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          prefixIcon: Icon(Icons.lock),
          border: InputBorder.none,
        ),
      ),
    );

    // BUTTON
    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            if (!await user.login(_email.text, _password.text))
              _key.currentState.showSnackBar(SnackBar(
                content: Text(user.error),
              ));
          }
        },
        padding: EdgeInsets.all(12),
        color: app_color.primaryColor,
        child: Text(
          'Log In',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );

    return Scaffold(
      key: _key,
      backgroundColor: app_color.backgroundColor,
      body: Center(
        child: user.status == Status.Authenticating
            ? spinner
            : Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 24.0, right: 24.0),
                  children: <Widget>[
                    logo,
                    largeSizedBox,
                    email,
                    smallSizedBox,
                    password,
                    mediumSizedBox,
                    loginButton,
                  ],
                ),
              ),
      ),
    );
  }
}
