import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;

  TransactionList(this.transaction, this.deleteTx);

  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: constraints.maxHeight * 0.4,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    'Nothing added yet',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return TransactionItem(
                  transaction: transaction[index], deleteTx: deleteTx);
            },
            itemCount: transaction.length,
          );
  }
}
