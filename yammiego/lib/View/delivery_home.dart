import 'package:flutter/material.dart';
import 'package:yammiego/Model/order.dart';
import 'package:yammiego/View/pickup_details.dart';

class DeliveryHomePage extends StatelessWidget {
  const DeliveryHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Order> assignedOrders = [
      Order(
        orderId: 101,
        customerName: "Rahul",
        restaurantName: "Pizza Hut",
        pickupAddress: "Pizza Hut, MG Road",
        dropAddress: "Indiranagar, Bangalore",
        amount: 350,
        status: "Assigned",
      ),
      Order(
        orderId: 102,
        customerName: "Anjali",
        restaurantName: "Burger King",
        pickupAddress: "Burger King, Forum Mall",
        dropAddress: "BTM Layout, Bangalore",
        amount: 220,
        status: "Assigned",
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Assigned Orders")),
      body: ListView.builder(
        itemCount: assignedOrders.length,
        itemBuilder: (context, index) {
          final order = assignedOrders[index];

          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 4,
            child: ListTile(
              leading: CircleAvatar(child: Text(order.orderId.toString())),
              title: Text(order.restaurantName),
              subtitle: Text("Customer: ${order.customerName}"),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "₹ ${order.amount}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    order.status,
                    style: const TextStyle(color: Colors.green),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PickupDetailsPage(order: order),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
