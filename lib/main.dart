import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front_developer_test/pages/feed_page.dart';
import 'package:front_developer_test/providers/feed_provider.dart';
import 'package:provider/provider.dart';

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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme:
              const AppBarTheme(
            centerTitle: true,
            color: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 16,
            ),
          ),
          textTheme: TextTheme(
              headline1: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              subtitle1: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              subtitle2: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade400,
              ),
              bodyText2: const TextStyle(color: Colors.black))),
      home: ChangeNotifierProvider(
        create: (context) => FeedProvider(),
        child: FeedPage(),
      ),
    );
  }
}
