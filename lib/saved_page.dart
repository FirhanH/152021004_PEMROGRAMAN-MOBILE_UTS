import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kalkulator'),
        ),
        body: SavedPage(),
      ),
    );
  }
}

class SavedPage extends StatefulWidget {
  @override
  _SavedPageState createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  final TextEditingController number1Controller = TextEditingController();
  final TextEditingController number2Controller = TextEditingController();
  final TextEditingController resultController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          // Text input untuk angka 1
          TextField(
            controller: number1Controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Angka 1',
              filled: true,
              fillColor: Color.fromARGB(255, 115, 180, 232),
            ),
          ),
          SizedBox(height: 10),
          // Text input untuk angka 2
          TextField(
            controller: number2Controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Angka 2',
              filled: true,
              fillColor: Color.fromARGB(255, 115, 180, 232),
            ),
          ),
          SizedBox(height: 10),
          // Text input untuk hasil
          TextField(
            controller: resultController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Hasil',
              filled: true,
              fillColor: Color.fromARGB(255, 115, 180, 232),
            ),
          ),
          // Tombol-tombol operasi kalkulator
          ElevatedButton(
            onPressed: () {
              _performOperation((a, b) => a + b);
            },
            child: Text('+'),
          ),
          ElevatedButton(
            onPressed: () {
              _performOperation((a, b) => a - b);
            },
            child: Text('-'),
          ),
          ElevatedButton(
            onPressed: () {
              _performOperation((a, b) => a * b);
            },
            child: Text('*'),
          ),
          ElevatedButton(
            onPressed: () {
              _performOperation((a, b) => a / b);
            },
            child: Text('/'),
          ),
          // Tombol reset
          ElevatedButton(
            onPressed: () {
              number1Controller.clear();
              number2Controller.clear();
              resultController.clear();
            },
            child: Text('Reset'),
          ),
        ],
      ),
    );
  }

  void _performOperation(double Function(double, double) operation) {
    double num1 = double.tryParse(number1Controller.text) ?? 0;
    double num2 = double.tryParse(number2Controller.text) ?? 0;
    double result = operation(num1, num2);
    resultController.text = result.toString();
  }
}
