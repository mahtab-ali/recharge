import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recharge_app/model/payee.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PayeeService {
  final String endpoint = 'https://rechargeapp.com/api/payees';

  Future<List<Payee>> fetchPayees() async {
    try {
      // Attempt to fetch payees from the network
      final response = await http.get(Uri.parse(endpoint));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        // Save to SharedPreferences for future use
        await _savePayeesToSharedPreferences(jsonData);
        return jsonData.map((json) => Payee.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load payees');
      }
    } catch (e) {
      // On error, load payees from SharedPreferences
      return await _loadPayeesFromSharedPreferences();
    }
  }

  Future<void> _savePayeesToSharedPreferences(List<dynamic> payees) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = json.encode(payees);
    await prefs.setString('payees', jsonData);
  }

  Future<List<Payee>> _loadPayeesFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = prefs.getString('payees') ?? '[]';
    final List<dynamic> payeeList = json.decode(jsonData);
    return payeeList.map((json) => Payee.fromJson(json)).toList();
  }
}
