import 'package:flutter/material.dart';
import 'package:sy_theme/sy_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sy_theme Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  String currentLocation = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SyColors.palletsColor,
      appBar: AppBar(
        title: const Text('sy_theme Example'),
        backgroundColor: SyColors.mainColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Colors:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: SyColors.mainColor,
                  margin: const EdgeInsets.only(right: 8),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: SyColors.supportingColor,
                  margin: const EdgeInsets.only(right: 8),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: SyColors.mainDarkColor,
                  margin: const EdgeInsets.only(right: 8),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Curved Button:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            CurvedButton(
              text: 'Sample Button',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Button pressed!')),
                );
              },
              buttonColor: SyColors.mainColor,
              textColor: Colors.white,
              width: 150,
              height: 50,
            ),
            const Spacer(),
            Container(
              color: SyColors.mainDarkColor,
              padding: const EdgeInsets.all(16),
              child: const SygenFooter(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SyBottomNavBar(
        currentLocation: currentLocation,
        items: [
          SyBottomNavItem(
            icon: Icons.home,
            label: "Home",
            location: 'home',
            onTap: () => setState(() => currentLocation = 'home'),
          ),
          SyBottomNavItem(
            icon: Icons.shopping_bag,
            label: "Orders",
            location: 'orders',
            onTap: () => setState(() => currentLocation = 'orders'),
          ),
          SyBottomNavItem(
            icon: Icons.person,
            label: "Profile",
            location: 'profile',
            onTap: () => setState(() => currentLocation = 'profile'),
          ),
        ],
      ),
    );
  }
}