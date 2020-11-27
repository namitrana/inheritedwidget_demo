import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF02BB9F),
        primaryColorDark: const Color(0xFF167F67),
        accentColor: const Color(0xFF167F67),
      ),
      title: "Inherited Widget",
      home: RootWidget(),
    );
  }

}

class RootWidget extends StatefulWidget{
    @override
    _RootWidgetState createState(){
      _RootWidgetState();
    }
}

class _RootWidgetState extends State{
  Widget build(BuildContext){
    return null;
  }
}