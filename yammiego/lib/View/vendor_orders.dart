import 'package:flutter/material.dart';
import 'package:yammiego/Model/vendor_order.dart';

class VendorOrdersPage extends StatelessWidget {
  final List<VendorOrder> orders;

  const VendorOrdersPage({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    double totalRevenue = orders
        .where((o) => o?.status == "Delivered")
        .fold(0, (sum, o) => sum + o!.amount);

    return Scaffold(
      appBar: AppBar(title: const Text("Orders & Revenue")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total Revenue: ₹ $totalRevenue",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "All Orders",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Card(
                    child: ListTile(
                      title: Text("Order #${order.orderId}"),
                      subtitle: Text(order.customerName),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("₹ ${order.amount}"),
                          Text(
                            order.status,
                            style: TextStyle(
                              color: order.status == "Delivered"
                                  ? Colors.green
                                  : Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension on Object? {
  get status => null;
  
  num? get amount => null;
}
