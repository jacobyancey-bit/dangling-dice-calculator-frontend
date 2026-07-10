import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

// Import your public state and app
import 'core/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize SharedPreferences for local storage
  await SharedPreferences.getInstance();
  
  // Load Google Fonts
  try {
    GoogleFonts.inter();
    GoogleFonts.caveat();
    GoogleFonts.cairo();
  } catch (e) {
    debugPrint('Failed to load Google Fonts: $e');
  }
  
  runApp(const AiCalculatorApp());
}
