import 'package:project_june1/api%20integration/model/productModel.dart';
import 'package:http/http.dart' as http;

class HttpServices {
  static Future<List<ProductModel>> fetchProducts() async {
    var response = await http.get(Uri())

  }
}
