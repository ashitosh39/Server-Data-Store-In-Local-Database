import 'dart:convert';
import 'package:api_fetch_store_sqflite_in_flutter/Models/models/product.dart';
import 'package:http/http.dart' as http;


class ApiService {
  static Future<List<Product>> fetchProducts() async {
  try {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  } catch (e) {
    throw Exception('Error fetching products: $e');
  }
}
}