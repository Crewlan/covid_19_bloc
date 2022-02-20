import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/navigations/router.dart';
import 'core/navigations/routes.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      themeMode: ThemeMode.light,
      onGenerateRoute: _router.generateRoutes,
      initialRoute: Routes.homeScreen,
      navigatorObservers: [HeroController()],
    );
  }
}
