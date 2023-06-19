import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  final int Total_product;
  const Cart({Key? key, required this.Total_product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),

      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Total product: ${Total_product}'),
        ],
      )),
    );
  }
}
