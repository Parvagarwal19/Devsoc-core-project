import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../services/api_service.dart';
import 'add_exp.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Expense>> _expenses;

  @override
  void initState() {
    super.initState();
    _loadExpenses();
  }

  void _loadExpenses() {
    _expenses = ApiService.getExpenses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expenses')),
      body: FutureBuilder<List<Expense>>(
        future: _expenses,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No expenses found.'));
          }

          final expenses = snapshot.data!;
          return ListView.builder(
            itemCount: expenses.length,
            itemBuilder: (context, index) {
              final e = expenses[index];
              return ListTile(
                title: Text(e.title),
                subtitle: Text(e.category),
                trailing: Text('₹${e.amount.toStringAsFixed(2)}'),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddExpenseScreen()),
          );
          setState(() {
            _loadExpenses(); // Reload list after adding new expense
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
