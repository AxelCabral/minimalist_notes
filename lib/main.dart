import 'package:flutter/material.dart';
import 'package:offline_database_notes/models/note_database.dart';
import 'package:offline_database_notes/pages/notes_page.dart';
import 'package:offline_database_notes/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  // initialize note isar database
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();

  runApp(
    MultiProvider(
      providers: [
        // Theme Provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),

        // Note Provider
        ChangeNotifierProvider(create: (context) => NoteDatabase()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NotesPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
