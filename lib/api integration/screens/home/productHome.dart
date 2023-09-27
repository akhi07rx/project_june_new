import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_june1/api%20integration/controller/productcontroller.dart';

void main() {
  runApp(GetMaterialApp(
    home: ProductHome(),
  ));
}

class ProductHome extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products"),),
      body: SizedBox(child: Obx((){
        if(productController.isLoading.value){
          return const Center(child: CircularProgressIndicator(),);
    }
        else{
          return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context,index){
            return ProductTile(productController.productList[index]);
    })
    }
    }),
    );
  }
}
