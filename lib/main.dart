import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment APP UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const HomePage(),
        bottomNavigationBar: Container(
            height: 100,
            decoration: const BoxDecoration(
                color: Color(0XFF1b2d65),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                elevation: 20,
                backgroundColor: const Color(0XFF1b2d65),
                fixedColor: Colors.white,
                unselectedIconTheme: const IconThemeData(color: Colors.white),
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.file_upload_outlined), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.attach_file_outlined), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle_rounded), label: ''),
                ],
              ),
            )));
  }
}
