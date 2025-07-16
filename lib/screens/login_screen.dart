import 'package:flutter/material.dart';

// Define a stateful widget for the Login Screen.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// Define the state class for the LoginScreen.
class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set the background color of the screen.
      backgroundColor: Colors.white,
      // The body of the scaffold is a Padding widget.
      body: Padding(
        // Apply horizontal padding to the content.
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        // Center the content on the screen.
        child: Center(
          // Use a SingleChildScrollView to prevent overflow on smaller screens.
          child: SingleChildScrollView(
            // Use a Column to arrange widgets vertically.
            child: Column(
              // Stretch the children to fill the horizontal space.
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // Center the children vertically within the column.
              mainAxisAlignment: MainAxisAlignment.center,
              // Define the list of widgets in the column.
              children: [
                // Display the logo image.
                _logoImage(),
                // Add some vertical space.
                SizedBox(height: 32.0),
                // Display the text field components for email and password.
                _textFieldComponentes(),
                // Add some vertical space.
                SizedBox(height: 16.0),
                // Display the login button.
                _loginButton(),
                // Add some vertical space.
                SizedBox(height: 16.0),
                // Display the "forgot password" button.
                _forgotPasswordButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  // A method that builds and returns the text field widgets.
  Widget _textFieldComponentes() {
    // Return a Column to arrange the text fields vertically.
    return Column(
      // Center the text fields.
      mainAxisAlignment: MainAxisAlignment.center,
      // Define the list of child widgets.
      children: [
        // A text field for the user's email.
        TextField(
          // Define the decoration for the text field.
          decoration: InputDecoration(
            // Set the label text.
            labelText: 'E-mail',
            // Set the border style.
            border: OutlineInputBorder(
              // Set the border radius.
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        // Add some vertical space between the text fields.
        SizedBox(height: 16.0),
        // A text field for the user's password.
        TextField(
          // Define the decoration for the text field.
          decoration: InputDecoration(
              // Set the border style.
              border: OutlineInputBorder(
                // Set the border radius.
                borderRadius: BorderRadius.circular(8.0),
              ),
              // Add a suffix icon to toggle password visibility.
              suffixIcon: IconButton(
                // Set the icon.
                icon: Icon(Icons.visibility),
                // The action to perform on press (currently empty).
                onPressed: () {},
              ),
              // Set the label text.
              labelText: 'Senha'),
        ),
      ],
    );
  }

  // A method that builds and returns the login button widget.
  Widget _loginButton() {
    // Return an ElevatedButton.
    return ElevatedButton(
      // The action to perform on press (currently empty).
      onPressed: () {},
      // Define the style of the button.
      style: ElevatedButton.styleFrom(
        // Set the background color.
        backgroundColor: Colors.amber,
        // Set the shape of the button with rounded corners.
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        // Set the vertical padding inside the button.
        padding: EdgeInsets.symmetric(vertical: 16.0),
      ),
      // The child of the button is a Text widget.
      child: Text(
        'Entrar',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );
  }

  // A method that builds and returns the "forgot password" button.
  Widget _forgotPasswordButton() {
    return TextButton(
      // The action to perform on press (currently empty).
      onPressed: () {},
      // The child of the button is a Text widget.
      child: Text(
        'Esqueci minha Senha',
        style: TextStyle(fontSize: 16.0, color: Colors.black),
      ),
    );
  }

  // A method that builds and returns the logo image widget.
  Widget _logoImage() {
    // Return an Image widget loaded from the project's assets.
    return Image.asset(
      'assets/logo.png',
      height: 250,
      width: 100,
    );
  }
}
