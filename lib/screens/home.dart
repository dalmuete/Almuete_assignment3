import 'package:assignment_3/components/questions.dart';
import 'package:assignment_3/components/titlehome.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool toPlay = false;

  void startplay(){
    setState((){
    toPlay = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      body: toPlay ? Questions() : TitleHome(startplay),
    );
  }
}
