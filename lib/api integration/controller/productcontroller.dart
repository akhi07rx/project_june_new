import 'package:get/get.dart';
import 'package:project_june1/api%20integration/service/api_services.dart';

class ProductController extends GetxController {
  //obs - observable
  var isLoading = true.obs;
  var productList = [].obs;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  void getProducts() async {
    try {
      isLoading(true);
      var products = await HttpServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
