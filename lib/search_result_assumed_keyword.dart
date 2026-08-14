import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0D0F12),
        fontFamily: 'monospace',
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
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
    return const Scaffold(
      backgroundColor: Color(0xFF0D0F12),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search, size: 80, color: Colors.blue),
            SizedBox(height: 16),
            Text(
              'XChange Search',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String title;
  final String rating;
  final String condition;
  final String price;
  final String? originalPrice;
  final String shipping;
  final String imageUrl;

  Product({
    required this.title,
    required this.rating,
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
  final TextEditingController _searchController = TextEditingController(text: 'okami');
  String _selectedCategory = 'All';

  // Sample initial product list
  final List<Product> _products = [
    Product(
      title: 'Okami HD - Nintendo Switch Edition',
      rating: '★★★★★ (412)',
      condition: 'New',
      price: '\$29.99',
      originalPrice: '\$39.99',
      shipping: 'Free shipping',
      imageUrl: 'https://picsum.photos/200?random=1',
    ),
    Product(
      title: 'MacBook Pro 14" M3 Pro - Space Black',
      rating: '★★★★☆ (312)',
      condition: 'New',
      price: '\$1,799.00',
      originalPrice: '\$2,199',
      shipping: 'Free shipping',
      imageUrl: 'https://picsum.photos/200?random=2',
    ),
    Product(
      title: 'Dell XPS 15 - Intel Core i9, 32GB RAM',
      rating: '★★★★☆ (187)',
      condition: 'Refurbished',
      price: '\$1,349.99',
      shipping: 'Free shipping',
      imageUrl: 'https://picsum.photos/200?random=3',
    ),
    Product(
      title: 'ASUS ROG Zephyrus G14 - Ryzen 9',
      rating: '★★★★☆ (94)',
      condition: 'New',
      price: '\$1,099.00',
      originalPrice: '\$1,399',
      shipping: '\$9.99 shipping',
      imageUrl: 'https://picsum.photos/200?random=4',
    ),
    Product(
      title: 'Lenovo ThinkPad X1 Carbon Gen 11',
      rating: '★★★★☆ (223)',
      condition: 'Open box',
      price: '\$899.00',
      originalPrice: '\$1,149',
      shipping: 'Free shipping',
      imageUrl: 'https://picsum.photos/200?random=5',
    ),
    Product(
      title: 'Devil May Cry 2',
      rating: '★★☆☆☆ (223)',
      condition: 'Open box',
      price: '\$2.00',
      originalPrice: '\$20',
      shipping: 'Free shipping',
      imageUrl: 'https://u-mercari-images.mercdn.net/thumb/photos/m85967365978_1.jpg?width=2560&quality=75&_=1769927890',
    ),
    Product(
      title: 'Grade 10 Japanese First Print Pikachu Card',
      rating: '★★★★★ (22323)',
      condition: 'Open box',
      price: '\$4000000',
      originalPrice: '\$200000',
      shipping: 'Free shipping',
      imageUrl: 'https://pbs.twimg.com/media/G88v-DSXQAAud4t.jpg',
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

  // Filter products where title contains or starts with the first letter (ignore case)
  List<Product> get _filteredProducts {
    final query = _searchController.text.trim().toLowerCase();
    if (query.isEmpty) return _products;

    final firstChar = query[0];
    return _products.where((product) {
      final title = product.title.toLowerCase();
      // Matches if title starts with searched first letter OR contains full query
      return title.startsWith(firstChar) || title.contains(query);
    }).toList();
  }

  // Check if search query matches any existing product exactly
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
          rating: '★ New Item',
          condition: 'New',
          price: '\$499.00',
          shipping: 'Free shipping',
          imageUrl: 'https://picsum.photos/200?random=10',
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredProducts;
    final query = _searchController.text.trim();

    return Scaffold(
      backgroundColor: const Color(0xFF0D0F12),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121418),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () {},
        ),
        title: Container(
          height: 42,
          decoration: BoxDecoration(
            color: const Color(0xFF1A1D24),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF2A2F3A)),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  style: const TextStyle(
                      fontFamily: 'monospace', color: Colors.white, fontSize: 14),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    hintText: 'Search product...',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Container(
                width: 42,
                height: 42,
                decoration: const BoxDecoration(
                  color: Color(0xFF2563EB),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(7),
                    bottomRight: Radius.circular(7),
                  ),
                ),
                child: const Icon(Icons.search, color: Colors.white, size: 20),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          // Subheader Meta & Best Match
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${filtered.length} results for "$query"',
                  style: const TextStyle(
                      fontFamily: 'monospace', color: Colors.grey, fontSize: 12),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1D24),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: const Color(0xFF2A2F3A)),
                  ),
                  child: Row(
                    children: [
                      Container(width: 8, height: 8, color: Colors.blue),
                      const SizedBox(width: 6),
                      Text(
                        'Best match',
                        style: const TextStyle(
                            fontFamily: 'monospace', color: Colors.blue, fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Horizontal Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              children: ['All', 'New', 'Refurbished', 'Open box'].map((category) {
                final isSelected = _selectedCategory == category;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    label: Text(
                      category,
                      style: TextStyle(
                        fontFamily: 'monospace',
                        color: isSelected ? Colors.white : Colors.grey[400],
                        fontSize: 12,
                      ),
                    ),
                    selected: isSelected,
                    selectedColor: const Color(0xFF2563EB),
                    backgroundColor: const Color(0xFF1A1D24),
                    side: BorderSide(
                      color: isSelected ? const Color(0xFF2563EB) : const Color(0xFF2A2F3A),
                    ),
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 8),

          // Scrollable List View
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: filtered.length + (query.isNotEmpty && !_exactMatchExists ? 1 : 0),
              itemBuilder: (context, index) {
                // Show "Add new word" banner as the first item if query doesn't match existing product
                if (query.isNotEmpty && !_exactMatchExists && index == 0) {
                  return GestureDetector(
                    onTap: () => _addNewWordProduct(query),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E293B),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFF3B82F6), style: BorderStyle.solid),
                      ),
                      child: Center(
                        child: Text(
                          '+ Add "$query" as a new item',
                          style: TextStyle(
                              fontFamily: 'monospace',
                              color: Colors.blue[300],
                              fontSize: 13),
                        ),
                      ),
                    ),
                  );
                }

                final productIndex = (query.isNotEmpty && !_exactMatchExists) ? index - 1 : index;
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

  Color _getBadgeColor(String condition) {
    switch (condition) {
      case 'Refurbished':
        return Colors.blue.shade900;
      case 'Open box':
        return Colors.amber.shade900;
      default:
        return Colors.green.shade900;
    }
  }

  Color _getBadgeTextColor(String condition) {
    switch (condition) {
      case 'Refurbished':
        return Colors.blue.shade200;
      case 'Open box':
        return Colors.amber.shade200;
      default:
        return Colors.green.shade200;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D24),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF222731)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              product.imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(width: 80, height: 80, color: Colors.black26),
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
                    fontSize: 13,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  product.rating,
                  style: const TextStyle(
                      fontFamily: 'monospace', color: Colors.amber, fontSize: 11),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: _getBadgeColor(product.condition),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    product.condition,
                    style: TextStyle(
                      fontFamily: 'monospace',
                      color: _getBadgeTextColor(product.condition),
                      fontSize: 10,
                    ),
                  ),
                ),
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
                          color: Colors.grey,
                          fontSize: 11,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ],
                ),
                Text(
                  product.shipping,
                  style: const TextStyle(
                      fontFamily: 'monospace', color: Colors.grey, fontSize: 10),
                ),
              ],
            ),
          ),
          const Icon(Icons.bookmark_border, color: Colors.grey, size: 20),
        ],
      ),
    );
  }
}



/*
onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SearchScreen()),
  );
}
home menu asle add korte hobe
 */