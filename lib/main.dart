import 'package:flutter/material.dart';
import './widgets/user_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expense App1'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Container(width: double.infinity, child: Text('CHART!')),
              color: Colors.blue,
              elevation: 5,
            ),
            UserTransaction()
          ],
        ),
      ),
    );
  }

}
