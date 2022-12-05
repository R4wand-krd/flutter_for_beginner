import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyAppBody(),
    );
  }
}

class MyAppBody extends StatefulWidget {
  const MyAppBody({super.key});

  @override
  State<MyAppBody> createState() => _MyAppBodyState();
}

class _MyAppBodyState extends State<MyAppBody> {
  int _couter = 0;

  final Uri _url =
      Uri.parse('https://github.com/R4wand-krd/flutter_for_beginner');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  void _incrementCounter() {
    _launchUrl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: const Text('Test App For Beginner'),
        actions: [
          IconButton(
              onPressed: _incrementCounter,
              icon: const Icon(
                Icons.help_outline_outlined,
                color: Colors.white,
              )),
        ],
      ),
      body: Center(
        child: Text(
          '$_couter',
          style: const TextStyle(color: Color(0xFF212121), fontSize: 33),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => _couter++);
        },
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
