import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int selectedFood = 0;

  final List<Map<String, dynamic>> food = [
    {
      "image": "assets/images/burger.jpg",
      "title": "Burger",
      "price": 4.99,
      "description": "Delicious beef burger ",
      "rating": 4.5,
    },
    {
      "image": "assets/images/pizza.jpg",
      "title": "Pizza",
      "price": 6.99,
      "description": "Cheesy pepperoni pizza",
      "rating": 4.7,
    },
    {
      "image": "assets/images/salad.jpg",
      "title": "Salad",
      "price": 3.49,
      "description": "Fresh vegetable salad",
      "rating": 4.2,
    },
    {
      "image": "assets/images/burger.jpg",
      "title": "Burger",
      "price": 4.99,
      "description": "Delicious beef burger ",
      "rating": 4.5,
    },
    {
      "image": "assets/images/pizza.jpg",
      "title": "Pizza",
      "price": 6.99,
      "description": "Cheesy pepperoni pizza",
      "rating": 4.7,
    },
    {
      "image": "assets/images/salad.jpg",
      "title": "Salad",
      "price": 3.49,
      "description": "Fresh vegetable salad",
      "rating": 4.2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text("Product Details", style: TextStyle(fontSize: 16)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Icon(Icons.shopping_cart, color: Colors.red),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            // The product image with favorite icon
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
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
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.favorite, color: Colors.red),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Fresh Salad",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        Text(
                          "(5.0)",
                          style: TextStyle(fontSize: 18, color: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$12.99",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "(40 reviews)",
                      style: TextStyle(fontSize: 18, color: Colors.green),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.justify,
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequ",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                      child: Text(
                        'Check Out',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
