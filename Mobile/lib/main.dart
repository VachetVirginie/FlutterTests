import 'package:flutter/material.dart';
import 'package:ngtv_mobile/providers/user_provider.dart';
import 'package:ngtv_mobile/service_container.dart';
import 'package:provider/provider.dart';
import 'package:ngtv_mobile/services/api.dart';
import 'package:ngtv_mobile/screens/index.dart';
import 'package:ngtv_mobile/screens/login_screen.dart';
import 'package:ngtv_mobile/router.dart';
import 'package:ngtv_mobile/ui/app_colors.dart';

void main() {
  // Using our service container we create sigleton UserProvider & Api classes.
  // This give us the oppportunity to get the same instance of UserProvider in all of our class calling:
  // final UserProvider myPropertie = serviceContainer<UserProvider>();
  // Api _api = serviceContainer<Api>();
  serviceContainer.registerLazySingleton<Api>(() => Api());
  serviceContainer.registerSingleton<UserProvider>(UserProvider.instance());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: serviceContainer<UserProvider>(),
      child: MaterialApp(
        title: 'NGTV Mobile',
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Avenir',
          primaryColor: primaryColor,
        ),
        home: Auth(),
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}

// Act as middleware.
// Every time that the status of our instance of UserProvider will get update
// flutter will rebuild this widget and so redirect the client.
class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, UserProvider user, _) {
        switch (user.status) {
          case Status.Authenticated:
            return Index();
          default:
            return LoginScreen();
        }
      },
    );
  }
}
