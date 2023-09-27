import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_june1/api%20integration/controller/productcontroller.dart';

void main() {
  runApp(MaterialApp(
    home: ProductHome(),
  ));
}

class ProductHome extends StatelessWidget {
  final ProductController productController = Get.put();

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
