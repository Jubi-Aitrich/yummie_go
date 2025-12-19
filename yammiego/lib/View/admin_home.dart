import 'package:flutter/material.dart';
import 'package:yammiego/View/customer_home.dart';
import 'package:yammiego/View/delivery_home.dart';
import 'package:yammiego/View/vendor_home.dart';


class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _adminCard(
              context,
              title: "Customer Module",
              icon: Icons.person,
              color: Colors.blue,
              page: const CustomerHomePage(),
            ),
            _adminCard(
              context,
              title: "Vendor Module",
              icon: Icons.store,
              color: Colors.orange,
              page: const VendorHomePage(),
            ),
            _adminCard(
              context,
              title: "Delivery Module",
              icon: Icons.delivery_dining,
              color: Colors.green,
              page: const DeliveryHomePage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _adminCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required Widget page,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        },
      ),
    );
  }
}
