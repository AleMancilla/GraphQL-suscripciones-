import 'package:flutter/material.dart';
import 'package:practica_graphql/Pages/HomePage.dart';
import 'package:practica_graphql/Provider/DatosProvider.dart';
import 'package:provider/provider.dart';
 
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => new DatosProvider()),
      ],
      child: MyApp(),
    )
  
  );
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}