import 'package:flutter/material.dart';
// Chip widgets show compact information or actions. Wrap lays out items and wraps to a new line when space runs out.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wrap + Chip Demo',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      home: const WrapChipDemoPage(),
    );
  }
}

/// A single page that demonstrates different Chip types arranged with Wrap.
class WrapChipDemoPage extends StatefulWidget {
  const WrapChipDemoPage({super.key});

  @override
  State<WrapChipDemoPage> createState() => _WrapChipDemoPageState();
}

class _WrapChipDemoPageState extends State<WrapChipDemoPage> {
  // For ChoiceChip (single selection)
  final List<String> _categories = <String>[
    'Fruits',
    'Veggies',
    'Dairy',
    'Bakery',
    'Beverages',
  ];
  String _selectedCategory = 'Fruits';

  // For FilterChip (multi selection)
  final List<String> _filters = <String>[
    'Organic',
    'On Sale',
    'In Stock',
    'Local',
  ];
  final Set<String> _activeFilters = <String>{'In Stock'};

  // For InputChip (user tags that can be removed)
  final List<String> _tags = <String>['Apple', 'Banana', 'Orange'];

  // For ActionChip (simple action)
  int _actionCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wrap + Chip Tutorial')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _sectionTitle('1) Basic Chip in a Wrap (display-only)'),
            Wrap(
              spacing: 8.0, // space between chips in the same line
              runSpacing: 8.0, // space between lines
              children: const <Widget>[
                Chip(label: Text('Apple')),
                Chip(label: Text('Blueberry')),
                Chip(label: Text('Cherry')),
                Chip(label: Text('Dragonfruit')),
                Chip(label: Text('Elderberry')),
                Chip(label: Text('Fig')),
                Chip(label: Text('Grapes')),
              ],
            ),
            const SizedBox(height: 24),

            _sectionTitle('2) ChoiceChip (single selection)'),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _categories.map((String category) {
                final bool isSelected = _selectedCategory == category;
                return ChoiceChip(
                  label: Text(category),
                  selected: isSelected,
                  onSelected: (bool value) {
                    if (!value) return;
                    setState(() => _selectedCategory = category);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            Text('Selected: $_selectedCategory'),
            const SizedBox(height: 24),

            _sectionTitle('3) FilterChip (multi selection)'),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _filters.map((String filter) {
                final bool isActive = _activeFilters.contains(filter);
                return FilterChip(
                  label: Text(filter),
                  selected: isActive,
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        _activeFilters.add(filter);
                      } else {
                        _activeFilters.remove(filter);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            Text('Active filters: ${_activeFilters.join(', ')}'),
            const SizedBox(height: 24),

            _sectionTitle('4) ActionChip (quick action)'),
            Wrap(
              spacing: 8.0,
              children: <Widget>[
                ActionChip(
                  label: const Text('Increment Counter'),
                  avatar: const Icon(Icons.add),
                  onPressed: () => setState(() => _actionCounter++),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('Action count: $_actionCounter'),
            const SizedBox(height: 24),

            _sectionTitle('5) InputChip (tags with delete)'),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _tags.map((String tag) {
                return InputChip(
                  label: Text(tag),
                  onDeleted: () {
                    setState(() => _tags.remove(tag));
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            FilledButton.icon(
              onPressed: () => _addNewTag(),
              icon: const Icon(Icons.add),
              label: const Text('Add Tag'),
            ),
            const SizedBox(height: 24),

            _sectionTitle('Wrap layout knobs'),
            const Text(
              'In these examples we used Wrap(spacing, runSpacing). '
              'Wrap automatically moves chips to the next line when space runs out.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium),
    );
  }

  void _addNewTag() {
    // Just cycles through some sample names
    const List<String> samples = <String>[
      'Mango',
      'Pear',
      'Kiwi',
      'Papaya',
      'Berry',
    ];
    final String next =
        samples[(samples.length + _tags.length) % samples.length];
    setState(() => _tags.add(next));
  }
}
