import 'package:flutter/material.dart';
import 'screens/chat_screen.dart';
import 'screens/find_match_screen.dart';
import 'screens/home_screen.dart';
import 'screens/matches_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(AlignApp());
}

class AlignApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Align App',
      theme: ThemeData.dark().copyWith(
        primaryColor:
            const Color.fromARGB(255, 133, 19, 194), // Neon purple color
        hintColor:
            const Color.fromARGB(255, 139, 17, 210), // Lighter neon purple
        scaffoldBackgroundColor:
            Color(0xFF121212), // Dark background for the app
        appBarTheme: AppBarTheme(
          backgroundColor:
              Color.fromARGB(255, 0, 0, 0), // Dark background for AppBar
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0, // Remove the shadow/elevation of the app bar
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.transparent, // Transparent to allow gradient effect
        ),
      ),
      home: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = [
    HomeScreen(),
    FindMatchScreen(),
    MatchesScreen(),
    ChatScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set a custom AppBar with logo and avatar only, no title bar
      appBar: AppBar(
        automaticallyImplyLeading: false, // Disable the back button
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/logo.png', // Add your logo.png image in the assets folder
              height: 40, // Adjust size as needed
            ),
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                'https://avatar.iran.liara.run/public/1', // Add the profile avatar image URL
              ),
            ),
          ],
        ),
        toolbarHeight: 70, // Adjust the height of the app bar if necessary
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 133, 19, 194), // Neon purple
              Color.fromARGB(255, 98, 37, 252), // Brighter violet for gradient
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.2, 1],
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 3,
              blurRadius: 6,
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor:
              Colors.transparent, // Transparent to let gradient shine
          selectedItemColor: Colors.white, // White for selected items
          unselectedItemColor:
              Colors.white60, // Slightly faded white for unselected
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          elevation: 10,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 28,
                color: _selectedIndex == 0
                    ? Color.fromARGB(255, 115, 15, 182)
                    : Colors.white60,
              ),
              label: 'Home',
              activeIcon: Icon(
                Icons.home,
                size: 28,
                color: Color.fromARGB(255, 115, 15, 182),
                shadows: [
                  BoxShadow(
                    color: Color.fromARGB(255, 115, 15, 182),
                    blurRadius: 8.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 28,
                color: _selectedIndex == 1
                    ? Color.fromARGB(255, 115, 15, 182)
                    : Colors.white60,
              ),
              label: 'Find Match',
              activeIcon: Icon(
                Icons.search,
                size: 28,
                color: Color.fromARGB(255, 115, 15, 182),
                shadows: [
                  BoxShadow(
                    color: Color.fromARGB(255, 115, 15, 182),
                    blurRadius: 8.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 28,
                color: _selectedIndex == 2
                    ? Color.fromARGB(255, 115, 15, 182)
                    : Colors.white60,
              ),
              label: 'Matches',
              activeIcon: Icon(
                Icons.favorite,
                size: 28,
                color: Color.fromARGB(255, 115, 15, 182),
                shadows: [
                  BoxShadow(
                    color: Color.fromARGB(255, 115, 15, 182),
                    blurRadius: 8.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                size: 28,
                color: _selectedIndex == 3
                    ? Color.fromARGB(255, 115, 15, 182)
                    : Colors.white60,
              ),
              label: 'Chat',
              activeIcon: Icon(
                Icons.chat,
                size: 28,
                color: Color.fromARGB(255, 115, 15, 182),
                shadows: [
                  BoxShadow(
                    color: Color.fromARGB(255, 115, 15, 182),
                    blurRadius: 8.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 28,
                color: _selectedIndex == 4
                    ? Color.fromARGB(255, 115, 15, 182)
                    : Colors.white60,
              ),
              label: 'Settings',
              activeIcon: Icon(
                Icons.settings,
                size: 28,
                color: Color.fromARGB(255, 115, 15, 182),
                shadows: [
                  BoxShadow(
                    color: Color.fromARGB(255, 115, 15, 182),
                    blurRadius: 8.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
