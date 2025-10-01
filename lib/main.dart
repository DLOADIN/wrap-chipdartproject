import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Wrap + Chip Tutorial')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            spacing: 8.0, // Horizontal spacing between chips
            runSpacing: 8.0, // Vertical spacing between lines of chips
            children: <Widget>[
              Chip(label: const Text('Apple')),
              Chip(label: const Text('Banana')),
              Chip(label: const Text('Orange')),
              Chip(label: const Text('Grapes')),
              Chip(label: const Text('Strawberry')),
              Chip(label: const Text('Blueberry')),
              Chip(label: const Text('Pineapple')),
              Chip(label: const Text('Mango')),
              // You can use different types of chips here
              ActionChip(
                label: const Text('Add Item'),
                onPressed: () {
                  // Handle add item action
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}