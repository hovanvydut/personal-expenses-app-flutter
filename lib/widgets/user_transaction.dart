import 'package:flutter/material.dart';
import './transaction_list.dart';
import './new_transaction.dart';
import './../model/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[NewTransaction(_addNewTransaction), TransactionList(transactions)],
    );
  }
}
