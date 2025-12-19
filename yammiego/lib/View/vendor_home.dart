import 'package:flutter/material.dart';
import 'package:yammiego/Model/vendor_order.dart';
import 'package:yammiego/View/vendor_orders.dart';


class VendorHomePage extends StatelessWidget {
  const VendorHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<VendorOrder> orders = [
      VendorOrder(
        orderId: 201,
        customerName: "Amit",
        amount: 450,
        status: "Delivered",
        date: DateTime.now(),
      ),
      VendorOrder(
        orderId: 202,
        customerName: "Neha",
        amount: 300,
        status: "Pending",
        date: DateTime.now(),
      ),
      VendorOrder(
        orderId: 203,
        customerName: "Rohit",
        amount: 200,
        status: "Delivered",
        date: DateTime.now(),
      ),
    ];

    int totalOrders = orders.length;
    double totalRevenue = orders
        .where((o) => o?.status == "Delivered")
        .fold(0, (sum, o) => sum + o.amount);

    return Scaffold(
      appBar: AppBar(title: const Text("Vendor Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Summary Cards
            Row(
              children: [
                Expanded(
                  child: _summaryCard(
                    title: "Total Orders",
                    value: totalOrders.toString(),
                    icon: Icons.receipt_long,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _summaryCard(
                    title: "Revenue",
                    value: "₹ $totalRevenue",
                    icon: Icons.currency_rupee,
                    color: Colors.green,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // View Details Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => VendorOrdersPage(orders: orders),
                    ),
                  );
                },
                child: const Text("View Orders & Revenue Details"),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Today's Orders",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(orders[index].orderId.toString()),
                      ),
                      title: Text(orders[index].customerName),
                      subtitle: Text("₹ ${orders[index].amount}"),
                      trailing: Text(
                        orders[index].status,
                        style: TextStyle(
                          color: orders[index].status == "Delivered"
                              ? Colors.green
                              : Colors.orange,
                        ),
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

  Widget _summaryCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, size: 30, color: color),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}

extension on Object? {
  num? get amount => null;
}
