import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trendy_app/constants/const_url.dart';
import 'package:trendy_app/service/products/products_model.dart';

Future<List<ProductsModel>> getProducts() async {
  final response = await http.get(Uri.parse('$baseUrl/products'));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    List<ProductsModel> products =
        (data as List).map((item) => ProductsModel.fromJson(item)).toList();
    return products;
  } else {
    throw Exception('Failed to load products: ${response.statusCode}');
  }
}
