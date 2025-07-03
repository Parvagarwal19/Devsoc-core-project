import 'package:flutter/material.dart';
import '../models/expense.dart';

class ExpenseTile extends StatelessWidget {
  final Expense expense;
  const ExpenseTile({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(expense.title),
      // subtitle: Text('${expense.date.toLocal()}'.split(' ')[0]),
      trailing: Text('₹${expense.amount.toStringAsFixed(2)}'),
    );
  }
}
