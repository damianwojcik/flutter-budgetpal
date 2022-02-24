import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widgets/transaction_list.dart';
import '../widgets/new_transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 'T1', title: 'Gold 1oz', amount: 7300, date: DateTime.now()),
    Transaction(
        id: 'T2', title: 'Silver 1oz', amount: 350, date: DateTime.now()),
    Transaction(
        id: 'T3', title: 'Chocolate Bar', amount: 5, date: DateTime.now()),
    Transaction(id: 'T4', title: 'Beer', amount: 3.5, date: DateTime.now()),
    Transaction(id: 'T5', title: 'Pizza', amount: 24, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions)
      ],
    );
  }
}
