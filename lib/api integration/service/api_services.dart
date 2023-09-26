import 'package:http/http.dart' as http;
import 'package:project_june1/api%20integration/model/productModel.dart';

class HttpServices {
  static Future<List<ProductModel>> fetchProducts() async {
    var response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      var data = response.body;
      return productModelFromJson(data);
    }
    else
      {
        throw Exception();
      }
  }
}
