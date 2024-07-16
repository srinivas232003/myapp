// import 'package:flutter/material.dart';
// import 'package:myapp/pages/profile.dart';
// import 'package:myapp/pages/home.dart';
// import 'package:myapp/pages/settings.dart';

// class FirstPage extends StatefulWidget {
//   const FirstPage({super.key});
//   static const List<Widget> _pages = [
//     HomePage(),
//     SecondPage(),
//     Settings(),
//   ];

//   @override
//   State<FirstPage> createState() => _FirstPageState();
// }

// class _FirstPageState extends State<FirstPage> {
//   int _selectedIndex = 0;
//   void _indexChanged(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('First Page'),
//       ),
//       drawer: Drawer(
//           backgroundColor: Color.fromARGB(255, 108, 65, 143),
//           child: Column(
//             children: [
//               DrawerHeader(
//                 child: Icon(
//                   Icons.favorite,
//                   size: 48,
//                 ),
//               ),
//               ListTile(
//                 leading: Icon(Icons.home),
//                 title: Text("HOME"),
//                 onTap: () {
//                   // Handle item 1 tap
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.settings),
//                 title: Text("SETTINGS"),
//                 onTap: () {
//                   // Handle item 1 tap
//                 },
//               ),
//             ],
//           )),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _indexChanged,
//         selectedItemColor: Colors.purpleAccent,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: "profile",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: "Settings",
//           ),
//         ],
//       ),
//       body: FirstPage._pages[_selectedIndex],
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:bottom_tab_app/pages/profile.dart';
// import 'package:bottom_tab_app/pages/settings.dart';
// import 'chat.dart';
// import 'dashboard.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/profile.dart';
import 'package:myapp/pages/home.dart';
import 'package:myapp/pages/settings.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    HomePage(),
    SecondPage(),
    Settings(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Home(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 108, 65, 143),
          child: Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.favorite,
                  size: 48,
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("HOME"),
                onTap: () {
                  // Handle item 1 tap
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("SETTINGS"),
                onTap: () {
                  // Handle item 1 tap
                },
              ),
            ],
          )),
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildTabIcon(0, Icons.dashboard, 'Dashboard'),
                  buildTabIcon(1, Icons.chat, 'Chats'),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildTabIcon(2, Icons.person, 'Profile'),
                  buildTabIcon(3, Icons.settings, 'Settings'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabIcon(int index, IconData icon, String label) {
    return MaterialButton(
      minWidth: 40,
      onPressed: () {
        setState(() {
          currentScreen = screens[index];
          currentTab = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: currentTab == index
                ? Theme.of(context).colorScheme.primary
                : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              color: currentTab == index
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
