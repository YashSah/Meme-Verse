import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meme_verse/views/home_view.dart';

import '../themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meme Verse",
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: MyThemes.lightColorScheme,
        fontFamily: GoogleFonts.dmSans().fontFamily,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: MyThemes.darkColorScheme,
        fontFamily: GoogleFonts.dmSans().fontFamily,
      ),
      home: const HomeView(),
    );
  }
}
