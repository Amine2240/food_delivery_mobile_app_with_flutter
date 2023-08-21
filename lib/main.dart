import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/homescreen.dart';
import 'package:food_delivery_app/providers/categoriebool.dart';
import 'package:food_delivery_app/providers/categoriefetching.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/providers/productslist.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => PorductsList(),
      ),
      ChangeNotifierProvider(
        create: (_) => Categoriebooleen(),
      ),
      ChangeNotifierProvider(create: (_)=> Fetchingcategories())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyhomeScreen(),
    );
  }
}
