import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/expense.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String _baseUrl = 'http://10.0.2.2:5000';

  /// Get expenses for the logged-in user
  static Future<List<Expense>> getExpenses() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');

    if (token == null) throw Exception('No JWT token found');

    final response = await http.get(
      Uri.parse('$_baseUrl/api/expense'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Expense.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load expenses');
    }
  }

  /// Create a new expense for the logged-in user
  static Future<void> createExpense(Expense expense) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');

    if (token == null) throw Exception('No JWT token found');

    final response = await http.post(
      Uri.parse('$_baseUrl/api/expense'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'title': expense.title,
        'amount': expense.amount,
        'category': expense.category,
        'date': expense.date.toIso8601String(),
      }),
    );

    if (response.statusCode != 201) {
      print('Failed response: ${response.body}');
      throw Exception('Failed to create expense');
    }
  }
}
