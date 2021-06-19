import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {

  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {

  String titleInput = "";
  String amountInput = "";

  void submitData() {
    String title = titleInput;
    double amount = double.parse(amountInput);

    if (title.isEmpty || amount <= 0) {
      return;
    }

    this.widget.addNewTransaction(title, amount);

    // close modal
    Navigator.of(this.context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              onChanged: (value) => titleInput = value,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              onChanged: (value) => amountInput = value,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            ElevatedButton(
              onPressed: submitData,
              child: Text('Add Transaction'),
              style: ElevatedButton.styleFrom(primary: Colors.purple),
            )
          ],
        ),
      ),
    );
  }
}
