import 'package:flutter/material.dart';
import 'my_items_screen.dart'; // Make sure to import your MyItemsScreen file

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  // Mock orders data adhering strictly to required fields
  final List<Map<String, dynamic>> _orders = [
    {
      "item": "Final Fantasy X PS2",
      "quantity": 1,
      "color": "Black",
      "size": "Standard",
      "email": "customer1@example.com",
      "phone": "+1 555-0142",
      "location": "New York, USA",
      "isPaid": false, // COD -> No
    },
    {
      "item": "Sony PlayStation 2",
      "quantity": 2,
      "color": "Charcoal Gray",
      "size": "N/A",
      "email": "gamer99@example.com",
      "phone": "+1 555-8831",
      "location": "Los Angeles, USA",
      "isPaid": true, // Card -> Yes
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080A0F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF080A0F),
        title: const Text(
          'Orders',
          style: TextStyle(
            fontFamily: 'monospace',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF2D7CFF)),
      ),
      body: Column(
        children: [
          // Top action area containing the My Items button
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyItemsScreen(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF10141D),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: const Color(0xFF2D7CFF),
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.inventory_2_outlined,
                        color: Color(0xFF2D7CFF),
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'My Items',
                        style: TextStyle(
                          fontFamily: 'monospace',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF2D7CFF),
                        size: 12,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Orders List
          Expanded(
            child: _orders.isEmpty
                ? const Center(
              child: Text(
                'No orders received yet.',
                style: TextStyle(
                  fontFamily: 'monospace',
                  color: Colors.white54,
                ),
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _orders.length,
              itemBuilder: (context, index) {
                final order = _orders[index];
                final bool isPaid = order["isPaid"];

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF10141D),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFF2D7CFF).withOpacity(0.3),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              order["item"],
                              style: const TextStyle(
                                fontFamily: 'monospace',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2D7CFF)
                                  .withOpacity(0.15),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Qty: ${order["quantity"]}',
                              style: const TextStyle(
                                fontFamily: 'monospace',
                                color: Color(0xFF2D7CFF),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Divider(
                        color: Color(0xFF202735),
                        height: 1,
                      ),
                      const SizedBox(height: 12),
                      _buildInfoRow(
                        Icons.palette_outlined,
                        'Attributes:',
                        'Color: ${order["color"]} | Size: ${order["size"]}',
                      ),
                      const SizedBox(height: 8),
                      _buildInfoRow(
                        Icons.email_outlined,
                        'Email:',
                        order["email"],
                      ),
                      const SizedBox(height: 8),
                      _buildInfoRow(
                        Icons.phone_outlined,
                        'Phone:',
                        order["phone"],
                      ),
                      const SizedBox(height: 8),
                      _buildInfoRow(
                        Icons.location_on_outlined,
                        'Location:',
                        order["location"],
                      ),
                      const SizedBox(height: 12),
                      const Divider(
                        color: Color(0xFF202735),
                        height: 1,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Paid?',
                            style: TextStyle(
                              fontFamily: 'monospace',
                              color: Color(0xFFB0B8C8),
                              fontSize: 13,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: isPaid
                                  ? Colors.green.withOpacity(0.15)
                                  : Colors.orange.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              isPaid ? 'Yes (Card)' : 'No (COD)',
                              style: TextStyle(
                                fontFamily: 'monospace',
                                color: isPaid
                                    ? Colors.green
                                    : Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: const Color(0xFF2D7CFF)),
        const SizedBox(width: 8),
        Text(
          '$label ',
          style: const TextStyle(
            fontFamily: 'monospace',
            color: Color(0xFFB0B8C8),
            fontSize: 13,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontFamily: 'monospace',
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}