import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budgetpal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Budgetpal'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    Transaction(
        id: 'T1', title: 'Gold 1oz', amount: 7300, date: DateTime.now()),
    Transaction(
        id: 'T2', title: 'Silver 1oz', amount: 350, date: DateTime.now())
  ];
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              color: Colors.blue,
              child: Container(width: double.infinity, child: Text('CHART')),
              elevation: 5,
            ),
            Card(
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                        controller: titleController,
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Amount'),
                        controller: amountController,
                      ),
                      FlatButton(
                          textColor: Colors.purple,
                          onPressed: () {
                            print(titleController.text);
                          },
                          child: Text('Add Transaction'))
                    ],
                  ),
                )),
            Column(
              children: transactions.map((transaction) {
                return Card(
                    child: Row(children: <Widget>[
                  Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\$${transaction.amount.toString()}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        transaction.title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(DateFormat.yMMMMd().format(transaction.date),
                          style: TextStyle(color: Colors.red))
                    ],
                  )
                ]));
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
