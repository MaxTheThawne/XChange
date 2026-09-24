import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: true,
//       theme: ThemeData(
//         brightness: Brightness.dark,
//         scaffoldBackgroundColor: const Color(0xFF000000),
//         fontFamily: 'monospace',
//       ),
//       home: const SplashScreen(),
//     );
//   }
// }

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SearchScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}

class Product {
  final String title;
  final String condition;
  final String price;
  final String? originalPrice;
  final String shipping;
  final String imageUrl;

  Product({
    required this.title,
    required this.condition,
    required this.price,
    this.originalPrice,
    required this.shipping,
    required this.imageUrl,
  });
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'New';

  final List<Product> _products = [
    Product(
      title: 'Okami HD - Nintendo Switch Edition',
      condition: 'New',
      price: '\$29.99',
      originalPrice: '\$39.99',
      shipping: 'Free shipping',
      imageUrl: 'https://picsum.photos/200?random=1232323',
    ),
    Product(
      title: 'MacBook Pro 14" M3 Pro - Space Black',
      condition: 'New',
      price: '\$1,799.00',
      originalPrice: '\$2,199',
      shipping: 'Free shipping',
      imageUrl: 'https://picsum.pho33432324tos/2323200?random=2',
    ),
    Product(
      title: 'Dell XPS 15 - Intel Core i9, 32GB RAM',
      condition: 'Refurbished',
      price: '\$1,349.99',
      shipping: 'Free shipping',
      imageUrl: 'https://pic4323424sum.phot2323os/200?random=3',
    ),
    Product(
      title: 'ASUS ROG Zephyrus G14 - Ryzen 9',
      condition: 'New',
      price: '\$1,099.00',
      originalPrice: '\$1,399',
      shipping: '\$9.99 shipping',
      imageUrl: 'https://picsum.photos/23200?ran2213213dom=4',
    ),
    Product(
      title: 'Lenovo ThinkPad X1 Carbon Gen 11',
      condition: 'Open box',
      price: '\$899.00',
      originalPrice: '\$1,149',
      shipping: 'Free shipping',
      imageUrl: 'https://picsum.photo23s/200?324234234random=5',
    ),
    Product(
      title: 'Devil May Cry 2',
      condition: 'Open box',
      price: '\$2.00',
      originalPrice: '\$20',
      shipping: 'Free shipping',
      imageUrl:
      'https://u-mercari-images.mercari.com/thumb/ph23432423otos/m85967365978_1.jpg?width=2560&quality=75',
    ),
    Product(
      title: 'Grade 10 Japanese First Print Pikachu Card',
      condition: 'Open box',
      price: '\$4000000',
      originalPrice: '\$200000',
      shipping: 'Free shipping',
      imageUrl: 'https://pbs.twimg.com/media/G88v-DSXQAAud423423423432t.jpg',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Product> get _filteredProducts {
    final query = _searchController.text.trim().toLowerCase();
    if (query.isEmpty) return _products;

    final firstChar = query[0];
    return _products.where((product) {
      final title = product.title.toLowerCase();
      return title.startsWith(firstChar) || title.contains(query);
    }).toList();
  }

  bool get _exactMatchExists {
    final query = _searchController.text.trim().toLowerCase();
    if (query.isEmpty) return true;
    return _products.any((p) => p.title.toLowerCase().contains(query));
  }

  void _addNewWordProduct(String newWord) {
    setState(() {
      _products.insert(
        0,
        Product(
          title: newWord,
          condition: 'New',
          price: '\$499.00',
          shipping: 'Free shipping',
          imageUrl: 'https://picsu32432m.photos/200?random=10',
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredProducts;
    final query = _searchController.text.trim();

    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      appBar: AppBar(
        backgroundColor: const Color(0xFF000000),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          height: 37,
          decoration: BoxDecoration(
            color: const Color(0xD7736767),
            borderRadius: BorderRadius.circular(0),
            border: Border.all(color: const Color(0xFF0F1660)),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    hintText: 'Search your product here!',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),

          // Scrollable List View
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount:
              filtered.length + (query.isNotEmpty && !_exactMatchExists ? 1 : 0),
              itemBuilder: (context, index) {
                if (query.isNotEmpty && !_exactMatchExists && index == 0) {
                  return GestureDetector(
                    onTap: () => _addNewWordProduct(query),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E293B),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xFF3B82F6),
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '+ Add "$query" as a new item',
                          style: TextStyle(
                            fontFamily: 'monospace',
                            color: Colors.blue[300],
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  );
                }
                final productIndex =
                (query.isNotEmpty && !_exactMatchExists) ? index - 1 : index;
                final product = filtered[productIndex];
                return _ProductCard(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: const Color(0xFF0C0F39),
        borderRadius: BorderRadius.circular(0),
        border: Border.all(color: const Color(0xFFF8F8F8)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.network(
              product.imageUrl,
              width: 150,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 150,
                height: 80,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Container(),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      product.price,
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    if (product.originalPrice != null) ...[
                      const SizedBox(width: 6),
                      Text(
                        product.originalPrice!,
                        style: const TextStyle(
                          fontFamily: 'monospace',
                          color: Colors.limeAccent,
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ],
                ),
                Text(
                  product.shipping,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}