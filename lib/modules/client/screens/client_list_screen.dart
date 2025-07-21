import 'package:alug_car/modules/client/utils/client_list.dart';
import 'package:flutter/material.dart';

// Defines the client list screen as a stateful widget.
class ClientListScreen extends StatefulWidget {
  const ClientListScreen({super.key});

  @override
  State<ClientListScreen> createState() => _ClientListScreenState();
}

// Manages the state for the ClientListScreen.
class _ClientListScreenState extends State<ClientListScreen> {

  // This method builds the main widget tree for the screen.
  @override
  Widget build(BuildContext context) {
    // Scaffold provides the basic visual layout structure.
    return Scaffold(
      backgroundColor: Colors.white,
      // Sets the app bar for the screen.
      appBar: _buildAppBar(), 
      // Sets the body of the screen to display the client list.
      body: _buildClientList(), 
    );
  }

  // Component 1: Builds the AppBar for the screen.
  AppBar _buildAppBar() {
    return AppBar(
      // Makes the AppBar background transparent.
      backgroundColor: Colors.transparent,
      // Removes the shadow below the AppBar.
      elevation: 0,
      // Adds a back button to navigate to the previous screen.
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
      // Sets the title of the screen.
      title: const Text(
        'Lista de Clientes',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Component 2: Builds the scrollable list of clients.
  Widget _buildClientList() {
    // ListView.builder efficiently creates list items as they scroll into view.
    return ListView.builder(
      // The total number of items in the list.
      itemCount: clientList.length,
      // The builder function for each item in the list.
      itemBuilder: (BuildContext context, int index) {
        // Gets the client data for the current index.
        final client = clientList[index];
        // Delegates the construction of each client card to another method.
        return _buildClientCard(client);
      },
    );
  }

  // Component 3: Builds a single card for a client.
  // This acts as a template for each item in the list.
  Widget _buildClientCard(Map<String, String> client) {
    // Card provides a container with a shadow and rounded corners.
    return Card(
      color: Colors.white,
      // Defines the shape and border of the card.
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(color: Colors.grey.shade200, width: 1),
      ),
      // Sets the margin around the card.
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      // Adds padding inside the card.
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        // ListTile provides a standard row layout for text and icons.
        child: ListTile(
          // The main title of the list item, displaying the client's name.
          title: Text(client['name']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          // The content below the title, arranged in a column.
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              // Displays the client's email.
              Text('Email: ${client['email']!}'),
              const SizedBox(height: 2),
              // Displays the client's phone number.
              Text('Número: ${client['phone']!}'),
              const SizedBox(height: 2),
              // Displays the client's address.
              Text('Endereço: ${client['address']!}'),
            ],
          ),
          // Widgets displayed at the end of the ListTile.
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // The "edit" action button.
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.blueAccent),
                onPressed: () {},
                tooltip: 'Atualizar',
              ),
              // The "delete" action button.
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.redAccent),
                onPressed: () {},
                tooltip: 'Deletar',
              ),
            ],
          ),
        ),
      ),
    );
  }
}