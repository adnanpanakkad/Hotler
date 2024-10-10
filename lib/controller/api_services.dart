import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hotler/model/product.dart';

class ApiServices {
  static Future<List<Product>> fetchTodo() async {
    const url =
        "https://hotel-management-8yjm.onrender.com/api/products/list-product/66b44ca0c09cde8535f40245";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> items = json['category'] ?? []; // Ensure items is a list
      return items.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
