import 'package:flutter/material.dart';

// Defines the client registration screen as a stateful widget.
class ClientRegisterScreen extends StatefulWidget {
  const ClientRegisterScreen({super.key});

  @override
  State<ClientRegisterScreen> createState() => _ClientRegisterScreenState();
}

// Manages the state and logic for the ClientRegisterScreen.
class _ClientRegisterScreenState extends State<ClientRegisterScreen> {
  // A global key to uniquely identify the Form and allow validation.
  final _formKey = GlobalKey<FormState>();

  // Controllers to manage the text input for each form field.
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  // This function is called when the user taps the register button.
  void _submitForm() {
    // Checks if all form fields have valid input.
    if (_formKey.currentState!.validate()) {
      // If the form is valid, show a success message.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Cliente ${_nameController.text} registrado com sucesso!')),
      );
      // Closes the current screen and returns to the previous one.
      Navigator.pop(context);
    } else {
      // If the form is invalid, show an error message.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, corrija os erros no formulário'),
        ),
      );
    }
  }

  // This lifecycle method is called when the widget is permanently removed.
  @override
  void dispose() {
    // It's important to dispose of controllers to free up resources and prevent memory leaks.
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  // This method builds the UI for the screen.
  @override
  Widget build(BuildContext context) {
    // Use a Container to set the background color and rounded corners for the sheet.
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
      // Allows the content to be scrollable, which is useful on smaller screens.
      child: SingleChildScrollView(
        // Adds padding around the form content.
        child: Padding(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
            // This ensures the content moves up when the keyboard appears.
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          // Arranges the screen widgets in a vertical column.
          child: Column(
            // The column should only be as tall as its children.
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Builds the title widget.
              _titleOfScreen(),
              const SizedBox(height: 24.0),
              // Builds the form widget.
              _form(),
              const SizedBox(height: 24.0),
              // Builds the register button.
              _registerButton(),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build the form.
  Widget _form() {
    return Form(
      // Associates the form key with this Form widget.
      key: _formKey,
      // Arranges the form fields in a vertical column.
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Text field for the client's name.
          TextFormField(
            controller: _nameController,
            validator: (value) =>
                value!.isEmpty ? 'Por favor, insira o nome.' : null,
            decoration: const InputDecoration(
              labelText: 'Nome e Sobrenome',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 16.0),
          // Text field for the client's email.
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) =>
                value!.isEmpty ? 'Por favor, insira o e-mail.' : null,
            decoration: const InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email)),
          ),
          const SizedBox(height: 16.0),
          // Text field for the client's phone number.
          TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            validator: (value) =>
                value!.isEmpty ? 'Por favor, insira o telefone.' : null,
            decoration: const InputDecoration(
              labelText: 'Número de telefone',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.phone),
            ),
          ),
          const SizedBox(height: 16.0),
          // Text field for the client's address.
          TextFormField(
            controller: _addressController,
            validator: (value) =>
                value!.isEmpty ? 'Por favor, insira o endereço.' : null,
            decoration: const InputDecoration(
              labelText: 'Endereço',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.home),
            ),
          )
        ],
      ),
    );
  }

  // Helper method to build the register button.
  Widget _registerButton() {
    return SizedBox(
      // Makes the button take up the full width available.
      width: double.infinity,
      child: ElevatedButton(
        // Defines the function to be called on press.
        onPressed: () {
          _submitForm();
        },
        // Customizes the button's style.
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
        ),
        child: const Text(
          'Cadastrar',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // Helper method to build the screen title.
  Widget _titleOfScreen() {
    return const Text(
      'Registro de Cliente',
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
