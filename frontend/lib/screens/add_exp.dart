import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../services/api_service.dart';

class AddExpenseScreen extends StatefulWidget {
  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  double _amount = 0;
  String _category = '';
  DateTime _selectedDate = DateTime.now(); // ✅ Added

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Expense newExpense = Expense(
        title: _title,
        amount: _amount,
        category: _category,
        date: _selectedDate, // ✅ Pass selected date
      );

      try {
        await ApiService.createExpense(newExpense);
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add expense')),
        );
      }
    }
  }

  // ✅ Function to show date picker
  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Expense')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                onSaved: (value) => _title = value!,
                validator: (value) => value!.isEmpty ? 'Enter a title' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                onSaved: (value) => _amount = double.tryParse(value!) ?? 0,
                validator: (value) => value!.isEmpty ? 'Enter amount' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Category'),
                onSaved: (value) => _category = value!,
                validator: (value) => value!.isEmpty ? 'Enter a category' : null,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('Date: ${_selectedDate.toLocal().toString().split(' ')[0]}'),
                  Spacer(),
                  TextButton(
                    onPressed: _pickDate,
                    child: Text('Select Date'),
                  )
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Add Expense'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
