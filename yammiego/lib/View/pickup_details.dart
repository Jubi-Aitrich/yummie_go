import 'package:flutter/material.dart';
import 'package:yammiego/Model/order.dart';
import 'package:yammiego/View/delivery_home.dart';

class PickupDetailsPage extends StatelessWidget {
  final Order order;

  const PickupDetailsPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Order #${order.orderId}")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pickup Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: const Icon(Icons.store, color: Colors.orange),
                title: Text(order.restaurantName),
                subtitle: Text(order.pickupAddress),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Drop Location",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: const Icon(Icons.home, color: Colors.green),
                title: Text(order.customerName),
                subtitle: Text(order.dropAddress),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Order Amount",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "₹ ${order.amount}",
              style: const TextStyle(fontSize: 22, color: Colors.green),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Order Picked Successfully")),
                  );
                },
                child: const Text("Mark as Picked"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
