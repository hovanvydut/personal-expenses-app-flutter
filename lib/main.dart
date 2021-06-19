import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/new_transaction.dart';
import 'package:personal_expenses_app/widgets/transaction_list.dart';
import './model/transaction.dart';

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

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  
  final List<Transaction> transactions = [
    Transaction(
        id: '1', title: 'New shoes', amount: 22.99, date: DateTime.now()),
    Transaction(
        id: '2', title: 'Weekly Groceries', amount: 19, date: DateTime.now()),
    Transaction(id: '3', title: 'Food', amount: 3, date: DateTime.now()),
  ];

  void _addNewTransaction(String title,  double amount) {
    final newTx = new Transaction(id: DateTime.now().toString(), title: title, amount: amount, date: DateTime.now());

    setState(() {
      this.transactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return NewTransaction(_addNewTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expense App1'),
        actions: [
          IconButton(onPressed: () => _startAddNewTransaction(context), icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Container(width: double.infinity, child: Text('CHART!')),
              color: Colors.blue,
              elevation: 5,
            ),
            TransactionList(transactions)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: () => _startAddNewTransaction(context),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
