import 'package:flutter/material.dart';
import 'package:yammiego/Model/food.dart';

class CustomerHomePage extends StatefulWidget {
  const CustomerHomePage({super.key});

  @override
  State<CustomerHomePage> createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  List<Food> foodList = [
    Food(
      id: 1,
      name: "Burger",
      image: "https://thumbs.dreamstime.com/b/tasty-burger-french-fries-fire-close-up-home-made-flames-137249900.jpg",
      price: 120,
    ),
    Food(
      id: 2,
      name: "Pizza",
      image: "https://media.istockphoto.com/id/1442417585/photo/person-getting-a-piece-of-cheesy-pepperoni-pizza.jpg?s=612x612&w=0&k=20&c=k60TjxKIOIxJpd4F4yLMVjsniB4W1BpEV4Mi_nb4uJU=",
      price: 250,
    ),
    Food(
      id: 3,
      name: "Sandwich",
      image: "https://media.istockphoto.com/id/1256670482/photo/turkey-sandwich-with-tomato-and-lettuce.jpg?s=612x612&w=0&k=20&c=CPwIFBHQqOob3SNZbegKKjUVL6xkUZgoQ2cxT0jcUrQ=",
      price: 90,
    ),
    Food(
      id: 4,
      name: "Fried Chicken",
      image: "https://media.istockphoto.com/id/1408338331/photo/crispy-fried-chicken-in-the-basket.jpg?s=612x612&w=0&k=20&c=2GBMXq083f9_uNnx9Do6DKjmMgEip6bNEoBpxTVkNF8=",
      price: 180,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Menu"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Cart Clicked")));
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: foodList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.network(
                    foodList[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  foodList[index].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "₹ ${foodList[index].price}",
                  style: const TextStyle(color: Colors.green),
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${foodList[index].name} added to cart"),
                      ),
                    );
                  },
                  child: const Text("Add to Cart"),
                ),
                const SizedBox(height: 5),
              ],
            ),
          );
        },
      ),
    );
  }
}
