import 'package:example/models.dart';
import 'package:flutter/material.dart';
import 'package:simple_grouped_list/simple_grouped_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Simple Grouped List example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SimpleGroupedList<Student, DateTime>(
        items: students,
        headerBuilder: (item) => Container(
          decoration: const BoxDecoration(
              border: Border.symmetric(
            horizontal: BorderSide(
              width: 2,
              color: Colors.red,
            ),
          )),
          child: Row(
            children: [
              Text(
                item.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              )
            ],
          ),
        ),
        groupBy: (student) => student.enrollmentDate,
        itemWidget: (student) => Text(student.name),
      ),
    );
  }
}
