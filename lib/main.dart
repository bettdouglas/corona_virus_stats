import 'package:corona/services/provider.dart';
import 'package:corona/utils/utils.dart';
import 'package:corona/widgets/main-page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  Utils.setUp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // final store = CoronaDataStore();
  @override
  Widget build(BuildContext context) {
    // store.fetchLatest();
    return ChangeNotifierProvider(
      create: (_) => DataStore(context),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}