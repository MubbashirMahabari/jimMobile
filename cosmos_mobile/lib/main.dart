import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'leads.dart';
import 'leads_appbar.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dashboard',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Dashboard'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    DashboardPage(),
    LeadsPage(),
    Center(child: Text('Schedule Page')),
    Center(child: Text('Jobs Page')),
    Center(child: Text('Menu Page')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 1
          ? AppBar(
              toolbarHeight: 85,
              backgroundColor: const Color(0xff0157C8),
              title: Container(
                child: LeadsAppBar(),
              ))
          : AppBar(
              toolbarHeight: 85,
              backgroundColor: const Color(0xff0157C8),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 36, top: 36),
                child: Container(
                  padding: const EdgeInsets.only(left: 2, right: 2, top: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/dashboard_icon.png',
                            width: 38,
                            height: 38,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            widget.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            'assets/icons/search_icon.png',
                            width: 18,
                            height: 18,
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/icons/add.png',
                      ),
                    ],
                  ),
                ),
              ),
            ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF0157C8),
        fixedColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(1),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/home.png',
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/leads.png',
              ),
              label: 'Leads'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/schedule.png',
              ),
              label: 'Schedule'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/jobs.png',
              ),
              label: 'Jobs'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/menu.png',
              ),
              label: 'Menu'),
        ],
      ),
    );
  }
}
