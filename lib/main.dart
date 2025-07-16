import 'package:alug_car/screens/home_screen.dart';
import 'package:flutter/material.dart';

// The main function, which is the entry point for the application.
void main() {
  // Run the app by passing the root widget.
  runApp(const MyApp());
}

// Define the root widget of the application.
class MyApp extends StatelessWidget {
  // Define the constructor for the MyApp widget.
  const MyApp({super.key});
  // Override the build method to create the widget's UI.
  @override
  Widget build(BuildContext context) {
    // Return a MaterialApp, which is the root of the app's widget tree.
    return MaterialApp(
      // Set the title of the application, used by the operating system.
      title: 'Alug Car',
      // Define the theme data for the application.
      theme: ThemeData(
        // Create a color scheme from a single seed color.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // Enable the Material 3 design system.
        useMaterial3: true,
      ),
      // Set the default screen to be displayed when the app starts.
      home: const HomeScreen(),
    );
  }
}