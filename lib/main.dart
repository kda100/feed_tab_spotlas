import 'package:feed_tab_spotlas/pages/feed_page.dart';
import 'package:feed_tab_spotlas/providers/feed_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      title: 'Feed tab spotlas app',
      cupertino: (_, __) => CupertinoAppData(
        theme: const CupertinoThemeData(
          barBackgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          textTheme: CupertinoTextThemeData(
            primaryColor: Colors.black,
            navTitleTextStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 17,
            ),
          ),
        ),
      ),
      material: (_, __) => MaterialAppData(
        theme: ThemeData(
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ),
          ),
        ),
      ),
      home: ChangeNotifierProvider<FeedProvider>(
        create: (context) => FeedProvider(),
        child: FeedPage(),
      ),
    );
  }
}
