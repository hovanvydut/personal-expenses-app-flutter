import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTransaction;

  TransactionList(this.transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: transactions.isEmpty
            ? Column(
                children: [
                  Text('No transactions added yet', style: Theme.of(context).textTheme.title,),
                  SizedBox(height: 20,),
                  Container(height: 200,child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover))
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30, 
                        child: Padding(padding: EdgeInsets.all(6),
                          child: FittedBox(child: Text('\$${transactions[index].amount}'))),
                      ),
                      title: Text(transactions[index].title, style: Theme.of(context).textTheme.title,),
                      subtitle: Text(DateFormat('dd/MM/yyyy').format(transactions[index].date)),
                      trailing: IconButton(onPressed: () => this._deleteTransaction(transactions[index].id), icon: Icon(Icons.delete), color: Theme.of(context).errorColor,),
                    ),
                  );
                },
                itemCount: transactions.length,
              ));
  }
}
