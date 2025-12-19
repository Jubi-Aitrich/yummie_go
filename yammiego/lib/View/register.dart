import 'package:flutter/material.dart';
import 'package:yammiego/View/admin_dashboard.dart';
import 'package:yammiego/View/customer_dashboard.dart';
import 'package:yammiego/View/delivery_dashboard.dart';
import 'package:yammiego/View/vendor_dashboard.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String selectedRole = "Customer";

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final roles = ["Customer", "Vendor", "Admin", "Delivery Boy"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            DropdownButtonFormField(
              value: selectedRole,
              items: roles.map((role) {
                return DropdownMenuItem(value: role, child: Text(role));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedRole = value!;
                });
              },
              decoration: const InputDecoration(labelText: "Register As"),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Full Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: () {
                Widget destination;

                if (selectedRole == "Customer") {
                  destination = const CustomerDashboard();
                } else if (selectedRole == "Vendor") {
                  destination = const VendorDashboard();
                } else if (selectedRole == "Admin") {
                  destination = const AdminDashboard();
                } else {
                  destination = const DeliveryDashboard();
                }

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => destination),
                  (route) => false,
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Registered as $selectedRole")),
                );
              },
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}