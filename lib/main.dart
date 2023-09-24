import 'package:first_steps/config/theme/app_theme.dart';
import 'package:first_steps/presentation/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  int clickCounter = 0;

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 6).theme(),
        title: 'Yes No App',
        home: const ChatScreen());
  }
}
/*import 'package:first_steps/presentation/screens/counter_functions_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.purple),
        home: const CounterFunctionsScreen());
  }
}*/
