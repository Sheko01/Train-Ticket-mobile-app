import 'package:flutter/material.dart';
import 'Ticket.dart';
import 'home.dart';
import '../Const.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:train_ticket/Screen/Settings.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  final int currentIndex;
  MyHomePage({required this.currentIndex, super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  List<Widget> bottomPages = [Home(), Ticket(), Settings()];
  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      body: bottomPages[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Scolor,
        buttonBackgroundColor: Pcolor,
        color: Color.fromARGB(250, 42, 46, 54),
        animationDuration: Duration(milliseconds: 300),
        items: [
          Padding(
            padding: const EdgeInsets.all(2),
            child: Icon(
              Icons.home,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Icon(
              Icons.add,
              size: 40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Icon(
              Icons.settings,
              size: 30,
            ),
          ),
        ],
        index: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
