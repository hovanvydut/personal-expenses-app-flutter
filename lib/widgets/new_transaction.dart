import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

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
                controller: this.titleController),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: this.amountController,
            ),
            ElevatedButton(
              onPressed: () {
                String title = this.titleController.text;
                double amount = double.parse(this.amountController.text);

                this.addNewTransaction(title, amount);
              },
              child: Text('Add Transaction'),
              style: ElevatedButton.styleFrom(primary: Colors.purple),
            )
          ],
        ),
      ),
    );
  }
}
