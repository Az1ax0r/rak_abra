import 'package:flutter/material.dart';

void main() {
  runApp(const RakAbraApp());
}

class RakAbraApp extends StatelessWidget {
  const RakAbraApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RAK Abra',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StationScreen(),
    );
  }
}

class StationScreen extends StatelessWidget {
  const StationScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> routes = const [
    {
      'title': 'Sheikh Zayed to Vegetable Market',
      'note': '',
    },
    {
      'title': 'Sheikh Zayed to Hilton Garden',
      'note': '',
    },
    {
      'title': 'Sheikh Zayed to Manar Mall',
      'note':
          'Note: Manar Mall station is currently NOT ready for passenger pickup and drop-off.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RAK Abra Stations'),
      ),
      body: ListView.builder(
        itemCount: routes.length,
        itemBuilder: (context, index) {
          final route = routes[index];
          return Card(
            margin: const EdgeInsets.all(12),
            child: ListTile(
              title: Text(route['title']!),
              subtitle: route['note']!.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Text(
                        route['note']!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : null,
              leading: CircleAvatar(
                child: Text('${index + 1}'),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Selected: ${route['title']}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
