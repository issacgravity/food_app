import 'package:flutter/material.dart';
import 'package:food_app/cartpage.dart';
import 'package:food_app/favoritepage.dart';
import 'package:food_app/productpage.dart';
import 'package:food_app/profilepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  int selectedCategoryIndex = 0;
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

  final List<String> categories = [
    "Fast Food",
    "Fruits",
    "Drinks",
    "Vegetables",
  ];

  final List<Widget> pages = const [
    HomePage(),
    CartPage(),
    FavoritePage(),
    ProfilePage(),
    ProductPage(),
  ];

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Center(
            child: Text("Home", style: TextStyle(color: Colors.black)),
          ),
          leading: const Icon(Icons.menu, color: Colors.black),
          actions: const [Icon(Icons.notification_add, color: Colors.black)],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    suffixIcon: const Icon(Icons.search, color: Colors.black),
                    filled: true,
                    fillColor: Colors.grey[50],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: const BorderSide(
                        color: Colors.amberAccent,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Stack(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 206, 49, 38),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 25,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/fruit.jpg',
                            width: 150,
                            height: 150,
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Grocery Shopping App",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "Get 20% off",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Find By Category",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(categories.length, (index) {
                      final isSelected = selectedCategoryIndex == index;
                      return Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedCategoryIndex = index;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28,
                              vertical: 18,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.red : Colors.grey[200],
                              borderRadius: BorderRadius.circular(16),
                              boxShadow:
                                  isSelected
                                      ? [
                                        const BoxShadow(
                                          color: Colors.red,
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        ),
                                      ]
                                      : [],
                            ),
                            child: Text(
                              categories[index],
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Fast Food",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Center(
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: List.generate(food.length, (index) {
                      final item = food[index];
                      final isSelected = selectedFood == index;

                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedFood = index;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductPage(),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.42,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? Colors.red.shade50
                                    : Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color:
                                  isSelected ? Colors.red : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Image.asset(
                                  item["image"],
                                  height: 150,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                item["title"],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item["description"],
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$${item["price"].toString()}",
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 16,
                                      ),
                                      Text(
                                        item["rating"].toString(),
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: selectedIndex,
          onTap: onTabTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color.fromARGB(255, 206, 49, 38),
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
