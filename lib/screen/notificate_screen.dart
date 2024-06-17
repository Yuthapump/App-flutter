import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.notifications_active),
            title: const Text('Promotion Alert'),
            subtitle: const Text('Get 20% off on your next purchase.'),
            onTap: () {
              // Handle promotion alert tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications_active),
            title: const Text('New Arrival'),
            subtitle: const Text('Check out our latest collection.'),
            onTap: () {
              // Handle new arrival tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications_active),
            title: const Text('Order Shipped'),
            subtitle: const Text('Your order #12345 has been shipped.'),
            onTap: () {
              // Handle order shipped tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications_active),
            title: const Text('Account Update'),
            subtitle: const Text('Your account details have been updated.'),
            onTap: () {
              // Handle account update tap
            },
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: NotificationsScreen(),
  ));
}
