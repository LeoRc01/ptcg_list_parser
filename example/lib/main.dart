import 'package:flutter/material.dart';
import 'package:ptcg_list_parser/data/ptcg_list_parser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PTCG List parser demo',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurpleAccent,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            spacing: 10,
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  minLines: null,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    label: Text('List'),
                    hintText: 'Insert your list',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              FilledButton(
                onPressed: () {
                  final parser = PTCGListParser(list: controller.text);
                  parser.parse();
                },
                child: Text('Parse'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
