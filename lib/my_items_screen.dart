import 'package:flutter/material.dart';

class MyItemsScreen extends StatefulWidget {
  const MyItemsScreen({super.key});

  @override
  State<MyItemsScreen> createState() => _MyItemsScreenState();
}

class _MyItemsScreenState extends State<MyItemsScreen> {
  // Mock list of items created/listed by the user
  final List<Map<String, dynamic>> _myItems = [
    {
      "name": "Final Fantasy X PS2",
      "price": 19.50,
      "stock": 10,
    },
    {
      "name": "Nintendo GameCube Controller",
      "price": 34.00,
      "stock": 5,
    },
    {
      "name": "Sony PlayStation 2",
      "price": 75.00,
      "stock": 2,
    },
  ];

  // Function to handle deleting an item from the list
  void _deleteItem(int index) {
    final deletedItemName = _myItems[index]["name"];
    setState(() {
      _myItems.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Deleted "$deletedItemName"',
          style: const TextStyle(fontFamily: 'monospace'),
        ),
        backgroundColor: const Color(0xFF10141D),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080A0F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF080A0F),
        title: const Text(
          'My Items (Items List)',
          style: TextStyle(
            fontFamily: 'monospace',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF2D7CFF)),
      ),
      body: _myItems.isEmpty
          ? const Center(
        child: Text(
          'No items listed yet.',
          style: TextStyle(
            fontFamily: 'monospace',
            color: Colors.white54,
          ),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _myItems.length,
        itemBuilder: (context, index) {
          final item = _myItems[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFF10141D),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFF2D7CFF).withOpacity(0.3),
              ),
            ),
            child: Row(
              children: [
                // Item Icon/Placeholder
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF080A0F),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xFF2D7CFF),
                    ),
                  ),
                  child: const Icon(
                    Icons.image_outlined,
                    color: Color(0xFF2D7CFF),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 14),

                // Item Details (Name, Price, Stock)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["name"],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'monospace',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$${item["price"].toStringAsFixed(2)}  •  Stock: ${item["stock"]}',
                        style: const TextStyle(
                          fontFamily: 'monospace',
                          color: Color(0xFFB0B8C8),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),

                // Delete Button
                IconButton(
                  onPressed: () => _deleteItem(index),
                  icon: const Icon(
                    Icons.delete_outline,
                    color: Colors.redAccent,
                    size: 22,
                  ),
                  tooltip: 'Delete item',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}