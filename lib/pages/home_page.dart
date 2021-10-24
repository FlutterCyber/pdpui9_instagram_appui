import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pdpui9_instagram_appui/pages/feed_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  var pages = [
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        //telni zaryadi, antennasi, ko'rinib
        // turishi un kk
        brightness: Brightness.light,
        title: Text(
          "Instagram",
          style: TextStyle(
              color: Colors.grey, fontFamily: "Billabong", fontSize: 35),
        ),
        centerTitle: true,
        // leading o'zi avtomatik appbarni
        // chap tomonidan iconni chiqarib beradi
        leading: IconButton(
          icon: Icon(Feather.camera),
          color: Colors.grey,
          onPressed: () {},
        ),
        // actions o'zi avtomatik appbarni
        // chap tomonidan iconni chiqarib beradi
        actions: [
          IconButton(
            icon: Icon(Feather.tv),
            color: Colors.grey,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(FontAwesome.send_o),
            color: Colors.grey,
            onPressed: () {},
          ),
        ],
      ),

      // bu biz xohlagan pageni o'rtadan chiqarib beradi
      body: pages[currentPage],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        currentIndex: currentPage,
        onTap: (i) {
          setState(() {
            currentPage = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Foundation.home),
            title: Text("Feed"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.search),
            title: Text("Feed"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.plus_square),
            title: Text("Feed"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.heart),
            title: Text("Feed"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.user),
            title: Text("Feed"),
          ),
        ],

        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        //buttomNavigationdagi iconlarni rangi
        selectedItemColor: Colors.black,
      ),
    );
  }
}
