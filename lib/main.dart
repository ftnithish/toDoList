import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/notes_screen.dart';
import 'styles/app_theme.dart';
import 'package:provider/provider.dart';
import 'providers/task_provider.dart';
import 'providers/note_provider.dart';
import 'screens/main_page.dart'; // Import MainPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
        ChangeNotifierProvider(create: (_) => NoteProvider()),
      ],
      child: MaterialApp(
        title: 'To-Do App',
        debugShowCheckedModeBanner: false,
        // theme: AppTheme.lightTheme, // Use the light theme
        // darkTheme: AppTheme.darkTheme, // Use the dark theme
        //themeMode: ThemeMode.system,
        initialRoute: '/',
        routes: {
          '/': (context) => MainPage(), // Set MainPage as the initial route
          '/notes': (context) => NotesScreen(),
        },
      ),
    );
  }
}
