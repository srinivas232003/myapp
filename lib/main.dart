import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/pages/first.dart';
import 'package:myapp/pages/profile.dart';
import 'package:myapp/pages/transaction.dart';
// import 'package:myapp/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const List<String> items = ["abc", "aak", "apple", "banana", "mango"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.light,
      ),
      home: Scaffold(
        body: login(),
      ),
      routes: {
        '/home': (context) => Home(), // Define the '/home' route
        '/add': (context) => NewTransaction(),
      },
    );
  }
}

class ListItem extends StatelessWidget {
  final List<String> items;
  const ListItem({
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => ListTile(
        title: GestureDetector(
          onTap: () {
            print("userTapped");
          },
          child: Text(
            "${index + 1}. ${items[index]}",
          ),
        ),
      ),
    );
  }
}

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/hero.png',
                  height: 320,
                  // fit: BoxFit.fitHeight,
                ),
              ),
              const SizedBox(height: 20), // Adds 20 pixels of vertical spacing
              Center(
                child: Text(
                  "Budget Tracking",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10), // Adds 20 pixels of vertical spacing
              Center(
                child: Text(
                  "Digitally control and manage you spend automatically",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade500),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10), // Adds 20 pixels of vertical spacing
              ElevatedButton.icon(
                onPressed: () {},
                icon: Image.asset('assets/images/google.png',
                    height: 32, width: 32),
                label: Text(
                  "Sign in with Google",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.black.withOpacity(0.125)),
                  ),
                ),
              ),
              const SizedBox(height: 10), // Adds 20 pixels of vertical spacing
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context,
                      '/home'); // Replace '/home' with your actual route
                },
                child: Text.rich(
                  TextSpan(
                    text: "Want to skip sign up? ",
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: "Click here",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
