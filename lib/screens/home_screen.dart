import 'package:flutter/material.dart';
import 'package:alug_car/utils/list_cars.dart';

// Define a stateful widget for the home screen.
class HomeScreen extends StatefulWidget {
  // Define the constructor for the HomeScreen widget.
  const HomeScreen({super.key});

  // Override the createState method to return an instance of the state class.
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// Define the state class for the HomeScreen widget.
class _HomeScreenState extends State<HomeScreen> {
  // Create a GlobalKey to control the Scaffold, mainly for opening the drawer.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Override the build method to create the widget's UI.
  @override
  Widget build(BuildContext context) {
    // Return a Scaffold, which implements the basic material design visual layout structure.
    return Scaffold(
      // Assign the global key to the Scaffold.
      key: _scaffoldKey,
      // Set the background color of the main screen.
      backgroundColor: Colors.white,
      // Set the side menu (drawer) for the Scaffold.
      drawer: _buildSideMenu(),
      // Set the app bar at the top of the screen.
      appBar: AppBar(
        // Set the background color of the app bar.
        backgroundColor: Colors.white,
        // Remove the shadow from the app bar.
        elevation: 0,
        // Set the title of the app bar.
        title: Text(
          'Home',
          // Style the title text.
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
        ),
        // Set the leading widget (on the left side of the app bar).
        leading: IconButton(
          // Define the icon for the button.
          icon: Icon(Icons.menu, color: Colors.black),
          // Define the action when the button is pressed.
          onPressed: () {
            // Use the scaffold key to open the drawer.
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      // Set the floating action button.
      floatingActionButton: _rentButton(),
      // Set the location of the floating action button to be docked in the center.
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // Set the bottom navigation bar.
      bottomNavigationBar: _bottomBar(),
      // Set the primary content of the scaffold.
      body: SingleChildScrollView(
        // The body contains the last registers widget, wrapped in a scroll view.
        child: _lastRegisters(),
      ),
    );
  }

  // A method that returns the floating action button widget.
  Widget _rentButton() {
    // Return a FloatingActionButton.
    return FloatingActionButton(
      // The action to perform on press (currently empty).
      onPressed: () {},
      // Set the background color of the button.
      backgroundColor: Colors.amber,
      // Set the icon for the button.
      child: const Icon(Icons.car_rental, color: Colors.black),
    );
  }

  // A method that returns the bottom app bar widget.
  Widget _bottomBar() {
    // Return a BottomAppBar.
    return BottomAppBar(
      // Set the color of the bar.
      color: Colors.white,
      // Define the shape with a circular notch for the FAB.
      shape: const CircularNotchedRectangle(),
      // Set the margin for the notch.
      notchMargin: 8.0,
      // The child of the bar is a Row of widgets.
      child: Row(
        // Arrange the children with space around them.
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // Define the list of icon buttons.
        children: <Widget>[
          // An icon button for the calendar.
          IconButton(
            // Define the icon, size, and color.
            icon: const Icon(Icons.calendar_month,
                size: 32, color: Colors.black54),
            // The action to perform on press (currently empty).
            onPressed: () {},
          ),
          // An icon button for the user profile.
          IconButton(
            // Define the icon, size, and color.
            icon: const Icon(Icons.person, size: 32, color: Colors.black54),
            // The action to perform on press (currently empty).
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  // A method that returns the performance values panel widget.
  Widget _perfomaceValues() {
    // Return a Padding widget to add horizontal spacing.
    return Padding(
      // Apply symmetric horizontal padding.
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      // The child is a Column to arrange widgets vertically.
      child: Column(
        // Align children to the start (left).
        crossAxisAlignment: CrossAxisAlignment.start,
        // Define the list of child widgets.
        children: [
          // The title of the panel.
          Text(
            'Painel de Rendimento',
            // Style the title text.
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          // A SizedBox to add vertical space.
          SizedBox(height: 8),
          // The subtitle of the panel.
          Text(
            'Detalhes por Performance',
            // Style the subtitle text.
            style: TextStyle(fontSize: 16.0, color: Colors.grey),
          ),
          // A SizedBox to add more vertical space.
          SizedBox(height: 24),
          // A Row to display performance values horizontally.
          Row(
            // Arrange children with space between them.
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // Define the list of child widgets.
            children: [
              // A Column for daily performance.
              Column(
                children: [
                  // Label for daily performance.
                  Text('Diário'),
                  // Add vertical space.
                  SizedBox(height: 4),
                  // The daily performance value.
                  Text('R\$ 100,00',
                      // Style the value text.
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                ],
              ),
              // A Column for weekly performance.
              Column(
                children: [
                  // Label for weekly performance.
                  Text('Semanal'),
                  // Add vertical space.
                  SizedBox(height: 4),
                  // The weekly performance value.
                  Text('R\$ 1.000,00',
                      // Style the value text.
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                ],
              ),
              // A Column for monthly performance.
              Column(
                children: [
                  // Label for monthly performance.
                  Text('Mensal'),
                  // Add vertical space.
                  SizedBox(height: 4),
                  // The monthly performance value.
                  Text('R\$ 10.000,00',
                      // Style the value text.
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  // A method that returns the performance graph widget.
  Widget _graphPerformace() {
    // Return a SizedBox to give the ListView a fixed height.
    return SizedBox(
      // Set the height of the graph area.
      height: 200,
      // Use a ListView with separators for the horizontal cards.
      child: ListView.separated(
        // Add horizontal padding to the list.
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        // Allow cards to render outside the ListView bounds (for shadows).
        clipBehavior: Clip.none,
        // Set the scroll direction to horizontal.
        scrollDirection: Axis.horizontal,
        // The number of items in the list.
        itemCount: 3,
        // Build a separator between the items.
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        // Build each item in the list.
        itemBuilder: (context, index) {
          // Define a list of colors for the cards.
          final cardColors = [
            Colors.amber,
            Colors.black,
            Colors.amber.shade700
          ];
          // Define a list of colors for the text.
          final textColors = [Colors.black, Colors.white, Colors.black];
          // Define a list of colors for the chart bars.
          final barColors = [Colors.black45, Colors.amber, Colors.black45];
          // Define a list of titles for the cards.
          final cardTexts = [
            'Rendimento Diário',
            'Rendimento Semanal',
            'Rendimento Mensal'
          ];
          // Define a list of values for the cards.
          final cardValues = ['R\$ 100,00', 'R\$ 1.000,00', 'R\$ 10.000,00'];

          // Return a Card widget for the graph item.
          return Card(
            // Set the card's shadow elevation.
            elevation: 4.0,
            // Set the card's color based on the index.
            color: cardColors[index],
            // Set the shape of the card with rounded corners.
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            // Use a SizedBox to define the card's width.
            child: SizedBox(
              // Set the width of the card.
              width: 250,
              // Add padding inside the card.
              child: Padding(
                // Apply padding on all sides.
                padding: const EdgeInsets.all(16.0),
                // Use a Column to arrange content vertically.
                child: Column(
                  // Align content to the start (left).
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // Define the list of child widgets.
                  children: [
                    // The title text for the card.
                    Text(
                      cardTexts[index],
                      // Style the title text.
                      style: TextStyle(
                          color: textColors[index],
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    // Add vertical space.
                    const SizedBox(height: 4),
                    // The value text for the card.
                    Text(
                      cardValues[index],
                      // Style the value text.
                      style: TextStyle(
                          color: textColors[index],
                          fontSize: 22,
                          fontWeight: FontWeight.w900),
                    ),
                    // Use a Spacer to push the chart to the bottom.
                    const Spacer(),
                    // A SizedBox to contain the bar chart.
                    SizedBox(
                      // Set a fixed height for the chart.
                      height: 80,
                      // Use a Row to arrange the bars horizontally.
                      child: Row(
                        // Arrange bars with space around them.
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // Align bars to the bottom of the row.
                        crossAxisAlignment: CrossAxisAlignment.end,
                        // Map chart data to a list of Container widgets.
                        children: chartData[index].map(
                          (height) {
                            // Return a Container to represent a single bar.
                            return Container(
                              // Set the width of the bar.
                              width: 12,
                              // Set the height of the bar.
                              height: height,
                              // Decorate the bar container.
                              decoration: BoxDecoration(
                                // Set the color of the bar.
                                color: barColors[index],
                                // Set rounded corners for the bar.
                                borderRadius: BorderRadius.circular(4),
                              ),
                            );
                          },
                        ).toList(), // Convert the mapped items to a List.
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // A method that returns the side menu (drawer) widget.
  Widget _buildSideMenu() {
    // Return a Drawer widget.
    return Drawer(
      // The child is a Container for custom styling.
      child: Container(
        // Set the background color of the drawer.
        color: Colors.black,
        // Add padding inside the drawer.
        child: Padding(
          // Apply padding on all sides.
          padding: EdgeInsets.all(16),
          // Use a Column to arrange menu items vertically.
          child: Column(
            // Align items to the start (top).
            mainAxisAlignment: MainAxisAlignment.start,
            // Define the list of menu items.
            children: <Widget>[
              // The title of the menu.
              const Text(
                'Menu',
                // Style the menu title.
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              // Add vertical space.
              SizedBox(
                height: 24,
              ),
              // A menu item using ListTile.
              ListTile(
                // The leading icon for the item.
                leading: Icon(
                  Icons.car_crash,
                  color: Colors.amber,
                  size: 32,
                ),
                // The title of the item.
                title: Text(
                  'Gerenciamento de Carros',
                  // Style the title text.
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                // The action to perform on tap (currently empty).
                onTap: () {},
              ),
              // Another menu item.
              ListTile(
                  // The leading icon.
                  leading: Icon(
                    Icons.calendar_month,
                    color: Colors.amber,
                    size: 32,
                  ),
                  // The title of the item.
                  title: Text(
                    'Calendário de Alugueis',
                    // Style the title text.
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  // The action to perform on tap.
                  onTap: () {}),
              // Another menu item.
              ListTile(
                // The leading icon.
                leading: Icon(
                  Icons.person,
                  color: Colors.amber,
                  size: 32,
                ),
                // The title of the item.
                title: Text(
                  'Gerenciamento de Clientes',
                  // Style the title text.
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                // The action to perform on tap.
                onTap: () {},
              ),
              // Another menu item.
              ListTile(
                // The leading icon.
                leading: Icon(
                  Icons.monetization_on,
                  color: Colors.amber,
                  size: 32,
                ),
                // The title of the item.
                title: Text(
                  'Gerenciamento de Lucros',
                  // Style the title text.
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                // The action to perform on tap.
                onTap: () {},
              ),
              // The exit menu item.
              ListTile(
                // The leading icon.
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.red,
                  size: 32,
                ),
                // The title of the item.
                title: Text(
                  'Sair do Aplicativo',
                  // Style the title text.
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                // The action to perform on tap.
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  // A method that returns the "last registers" section widget.
  Widget _lastRegisters() {
    // Add vertical padding to the whole section.
    return Padding(
      // Apply symmetric vertical padding.
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      // Use a Column to arrange widgets vertically.
      child: Column(
        // Align children to the start (left).
        crossAxisAlignment: CrossAxisAlignment.start,
        // Define the list of child widgets.
        children: [
          // Include the performance values panel.
          _perfomaceValues(),
          // Add vertical space.
          const SizedBox(height: 24),
          // Include the performance graph.
          _graphPerformace(),
          // Add vertical space.
          const SizedBox(height: 24),
          // Add padding for the list of last registers.
          Padding(
            // Apply symmetric horizontal padding.
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            // Use a Column for the title and the list.
            child: Column(
              // Align children to the start (left).
              crossAxisAlignment: CrossAxisAlignment.start,
              // Define the list of child widgets.
              children: [
                // The title for the last registers list.
                const Text(
                  'Últimos Registros',
                  // Style the title text.
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                // Add vertical space.
                const SizedBox(height: 12),
                // Use a ListView.builder to create the list dynamically.
                ListView.builder(
                  // Make the ListView's height wrap its content.
                  shrinkWrap: true,
                  // Disable scrolling for this inner ListView.
                  physics: const NeverScrollableScrollPhysics(),
                  // Set the number of items in the list.
                  itemCount: recentRentals.length,
                  // Build each item in the list.
                  itemBuilder: (context, index) {
                    // Get the data for the current rental item.
                    final rental = recentRentals[index];
                    // Return a Card for each list item.
                    return Card(
                      // Set the background color of the card.
                      color: Colors.white,
                      // Set the vertical margin for the card.
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      // Set the card's shadow elevation.
                      elevation: 2.0,
                      // Use a ListTile for a standard list item layout.
                      child: ListTile(
                        // The leading widget (icon on the left).
                        leading: const Icon(Icons.directions_car,
                            color: Colors.amber),
                        // The title of the list tile.
                        title: Text(
                          // Display the car and client info.
                          '${rental['car']} - ${rental['client']}',
                          // Style the title text.
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        // The subtitle of the list tile.
                        subtitle: Text('Alugado em: ${rental['date']}'),
                        // The trailing widget (icon on the right).
                        trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                        // The action to perform on tap (currently empty).
                        onTap: () {},
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}