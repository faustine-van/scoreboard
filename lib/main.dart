import 'package:material_ui/material_ui.dart';
import 'package:scoreboard/screens/scoreboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Score Board',
      home: ScoreboardScreen(),
    );
  }
}