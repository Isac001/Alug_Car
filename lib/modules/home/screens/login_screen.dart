import 'package:alug_car/modules/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

// Defines a stateful widget for the Login Screen.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// Defines the state class for the LoginScreen.
class _LoginScreenState extends State<LoginScreen> {
  // Global key to uniquely identify the Form widget and allow validation.
  final _formKey = GlobalKey<FormState>();

  // Controller for the email text field.
  final TextEditingController _emailController = TextEditingController();
  // Controller for the password text field.
  final TextEditingController _passwordController = TextEditingController();

  // Validates and submits the login form.
  void submitForm() {
    // Checks if the form's current state is valid.
    if (_formKey.currentState!.validate()) {
      // If valid, navigates to the HomeScreen, replacing the current screen.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      // If there are errors, displays a feedback message.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, corrija os erros no formulário.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Sets the background color of the screen.
      backgroundColor: Colors.white,
      // The Scaffold's body is a Padding widget for spacing.
      body: Padding(
        // Applies horizontal padding to the content.
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        // Centers the content on the screen.
        child: Center(
          // Uses a SingleChildScrollView to prevent overflow on smaller screens.
          child: SingleChildScrollView(
            // Uses a Form to group and validate input fields.
            child: Form(
              // Associates the global key with the Form widget.
              key: _formKey,
              // Arranges widgets vertically in a column.
              child: Column(
                // Stretches the children to fill the horizontal space.
                crossAxisAlignment: CrossAxisAlignment.stretch,
                // Centers the children vertically within the column.
                mainAxisAlignment: MainAxisAlignment.center,
                // Defines the list of widgets within the column.
                children: [
                  // Displays the logo image.
                  _logoImage(),
                  // Adds some vertical space.
                  const SizedBox(height: 32.0),
                  // Displays the text field components for email and password.
                  _textFieldComponentes(),
                  // Adds some vertical space.
                  const SizedBox(height: 16.0),
                  // Displays the login button.
                  _loginButton(),
                  // Adds some vertical space.
                  const SizedBox(height: 16.0),
                  // Displays the "forgot password" button.
                  _forgotPasswordButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Builds and returns the text field widgets.
  Widget _textFieldComponentes() {
    // Returns a Column to arrange the text fields vertically.
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Text field for the user's email.
        TextFormField(
          controller: _emailController,
          // Validator to ensure the field is not empty.
          validator: (value) =>
              value!.isEmpty ? 'Por favor, insira o e-mail.' : null,
          // Defines the decoration for the text field.
          decoration: InputDecoration(
            labelText: 'E-mail',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        // Adds some vertical space between the text fields.
        const SizedBox(height: 16.0),
        // Text field for the user's password.
        TextFormField(
          controller: _passwordController,
          // Obscures the text for password fields.
          obscureText: true,
          // Validator to ensure the field is not empty.
          validator: (value) =>
              value!.isEmpty ? 'Por favor, insira a senha.' : null,
          // Defines the decoration for the text field.
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              // Adds a suffix icon to toggle password visibility.
              suffixIcon: IconButton(
                icon: const Icon(Icons.visibility),
                // TODO: Implement password visibility toggle logic.
                onPressed: () {},
              ),
              labelText: 'Senha'),
        ),
      ],
    );
  }

  // Builds and returns the login button widget.
  Widget _loginButton() {
    // Returns an ElevatedButton.
    return ElevatedButton(
      // Sets the function to be called when the button is pressed.
      onPressed: submitForm,
      // Defines the style of the button.
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
      ),
      // The child of the button is a Text widget.
      child: const Text(
        'Entrar',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );
  }

  // Builds and returns the "forgot password" button.
  Widget _forgotPasswordButton() {
    return TextButton(
      // TODO: Implement navigation to the password recovery screen.
      onPressed: () {},
      // The child of the button is a Text widget.
      child: const Text(
        'Esqueci minha Senha',
        style: TextStyle(fontSize: 16.0, color: Colors.black),
      ),
    );
  }

  // Builds and returns the logo image widget.
  Widget _logoImage() {
    // Returns an Image widget loaded from the project's assets.
    return Image.asset(
      'assets/logo.png',
      height: 250,
      width: 100,
    );
  }
}