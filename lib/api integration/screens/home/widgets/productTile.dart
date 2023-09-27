import 'package:flutter/material.dart';
import 'package:project_june1/api%20integration/model/productModel.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(child: Column(children: [Container(height: 180,width: double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),)],),);
  }
}
