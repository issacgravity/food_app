import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text("Prodcut Details", style: TextStyle(fontSize: 16)),
        ),
        leading: const Icon(Icons.arrow_back_ios),
        actions: const [
          Icon(Icons.shopping_cart, color: Colors.red),
          Padding(padding: EdgeInsets.all(24)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Stack(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              Positioned(
                top: 25,
                left: 125,
                child: Image.asset(
                  'assets/images/salad.jpg',
                  width: 150,
                  height: 150,
                ),
              ),
              Positioned(
                top: 25,
                right: 25,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Icon(Icons.favorite, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
