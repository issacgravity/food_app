import 'package:flutter/material.dart';
import 'package:food_app/favoritepage.dart';
import 'package:food_app/homepage.dart';
import 'package:food_app/profilepage.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int selectedIndex = 1;

  List<Map<String, dynamic>> food = [
    {
      "image": "assets/images/burger.jpg",
      "title": "Burger",
      "price": 4.99,
      "description": "Delicious beef burger",
    },
    {
      "image": "assets/images/pizza.jpg",
      "title": "Pizza",
      "price": 6.99,
      "description": "Cheesy pepperoni pizza",
    },
    {
      "image": "assets/images/salad.jpg",
      "title": "Salad",
      "price": 3.49,
      "description": "Fresh vegetable salad",
    },
    {
      "image": "assets/images/burger.jpg",
      "title": "Burger",
      "price": 4.99,
      "description": "Delicious beef burger",
    },
    {
      "image": "assets/images/pizza.jpg",
      "title": "Pizza",
      "price": 6.99,
      "description": "Cheesy pepperoni pizza",
    },
    {
      "image": "assets/images/salad.jpg",
      "title": "Salad",
      "price": 3.49,
      "description": "Fresh vegetable salad",
    },
  ];

  List<int> quantities = [];

  final List<Widget> pages = const [
    HomePage(),
    CartPage(),
    FavoritePage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    quantities = List<int>.filled(food.length, 1);
  }

  void onTabTapped(int index) {
    if (index != selectedIndex) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => pages[index]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            "Cart",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: food.length,
              itemBuilder: (context, index) {
                final item = food[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          item['image'],
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title and Delete
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item['title'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      food.removeAt(index);
                                      quantities.removeAt(index);
                                    });
                                  },
                                  child: Icon(
                                    Icons.delete_outline,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item['description'],
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${item['price']}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (quantities[index] > 1) {
                                            quantities[index]--;
                                          }
                                        });
                                      },
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.red[700],
                                        child: const Icon(
                                          Icons.remove,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '${quantities[index]}',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    const SizedBox(width: 8),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          quantities[index]++;
                                        });
                                      },
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.red[700],
                                        child: const Icon(
                                          Icons.add,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Check Out',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
