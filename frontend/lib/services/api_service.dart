import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/expense.dart';

class ApiService {
  static const String _baseUrl = 'http://10.0.2.2:5000';

  static Future<List<Expense>> getExpenses() async {
    final response = await http.get(Uri.parse('$_baseUrl/api/expense'));

    // 👇 Debug output
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Expense.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load expenses');
    }
  }

  // ✅ Move this method INSIDE the class
  static Future<void> createExpense(Expense expense) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/api/expense'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': expense.title,
        'amount': expense.amount,
        'category': expense.category,
        'date': expense.date.toIso8601String(), // ✅ Make sure this is included
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create expense');
    }
  }
}
