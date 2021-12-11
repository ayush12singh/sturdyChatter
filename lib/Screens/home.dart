//Packages
import 'package:flutter/material.dart';

//Screens
import '../Screens/chats_page.dart';
import '../Screens/users_page.dart';

// ignore_for_file: non_constant_identifier_names

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int current_page = 0;
  // ignore: prefer_const_constructors
  final List<Widget> pages = [chats_Page(), Users_page()];
  @override
  Widget build(BuildContext context) {
    return buildUI();
  }

  Widget buildUI() {
    return Scaffold(
      body: pages[current_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current_page,
        onTap: (index) {
          setState(() {
            current_page = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              label: "Chats", icon: Icon(Icons.chat_bubble_sharp)),
          BottomNavigationBarItem(
              label: "Users", icon: Icon(Icons.supervised_user_circle_sharp))
        ],
      ),
    );
  }
}
