import 'package:flutter/material.dart';
import 'todo_page.dart';

void main() {
  runApp(const TODOApp());
}

class TODOApp extends StatelessWidget {
  const TODOApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        fontFamily: "Jost",
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF380565),
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: "Jost",
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),

      routes: {
        '/': (context) => const TodoPage(),
      },
      initialRoute: '/',
    );
  }
}
