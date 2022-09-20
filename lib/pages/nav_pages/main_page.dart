import 'package:flutter/material.dart';
import 'package:travel_app/pages/nav_pages/search_page.dart';

import 'bar_item_page.dart';
import 'home_page.dart';
import 'my_page.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  var pageList=[HomePage(),BarItemPage(),SearchPage(),MyPage()];
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, //background color verebilmek için burası fixed olmalı.
        backgroundColor: Colors.white,
        elevation: 0,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(title: Text("Home"),icon: Icon(Icons.apps)),
            BottomNavigationBarItem(title: Text("Bar"),icon: Icon(Icons.bar_chart_sharp)),
            BottomNavigationBarItem(title: Text("Search"),icon: Icon(Icons.search)),
            BottomNavigationBarItem(title: Text("My"),icon: Icon(Icons.person)),
          ],
        onTap: (index){
            setState(() {
              currentIndex=index;
            });
        },

      ),
    );
  }
}
