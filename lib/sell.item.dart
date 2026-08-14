import 'package:flutter/material.dart';

void main() {
  runApp(const XChangeApp());
}

class XChangeApp extends StatelessWidget {
  const XChangeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XChange',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0D0D0D),
        cardColor: const Color(0xFF161618),
        primaryColor: const Color(0xFF3B82F6),
        textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Courier', // Uses system monospace font
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// Global Auth State Mock
bool isLoggedIn = false;

// Item Listing Model Data
class ItemListing {
  String? imagePath;
  String title = '';
  String category = 'Other';
  String description = '';
  double originalPrice = 0.0;
  double discount = 0.0;
  double deliveryCharge = 0.0;
  int stockQuantity = 1;

  double get sellingPrice => originalPrice * (1 - (discount / 100));
}

// -----------------------------------------------------------------------------
// 1. HOME SCREEN
// -----------------------------------------------------------------------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D0D),
        elevation: 0,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text('XC',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 8),
            const Text('XChange',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3B82F6),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SellFlowWizard()),
              );
            },
            icon: const Icon(Icons.add, size: 18),
            label: const Text('Sell',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          IconButton(
            icon: Icon(
              isLoggedIn ? Icons.person : Icons.person_outline,
              color: isLoggedIn ? Colors.green : Colors.white,
            ),
            onPressed: () {
              isLoggedIn = !isLoggedIn; // Toggle for testing
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(isLoggedIn
                      ? 'Logged In Mode'
                      : 'Logged Out Mode'),
                ),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'The future in\nyour hands',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: const [
                CategoryCard(title: 'Laptops', icon: Icons.laptop),
                CategoryCard(title: 'Computer parts', icon: Icons.keyboard),
                CategoryCard(title: 'Smartphones', icon: Icons.phone_android),
                CategoryCard(
                    title: 'Enterprise networking', icon: Icons.dns),
                CategoryCard(
                    title: 'Tablets & eBooks', icon: Icons.tablet),
                CategoryCard(title: 'Storage & media', icon: Icons.storage),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF161618),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.grey),
          const SizedBox(height: 12),
          Text(title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// 2. MULTI-STEP SELLING FLOW
// -----------------------------------------------------------------------------
class SellFlowWizard extends StatefulWidget {
  const SellFlowWizard({super.key});

  @override
  State<SellFlowWizard> createState() => _SellFlowWizardState();
}

class _SellFlowWizardState extends State<SellFlowWizard> {
  int _currentStep = 1;
  final ItemListing _listing = ItemListing();

  void _nextStep() {
    if (_currentStep < 5) {
      setState(() => _currentStep++);
    }
  }

  void _prevStep() {
    if (_currentStep > 1) {
      setState(() => _currentStep--);
    } else {
      Navigator.pop(context);
    }
  }

  void _checkAuthAndPublish() {
    if (!isLoggedIn) {
      // Prompt Login Modal before finalizing
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: const Color(0xFF161618),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) => LoginModal(
          onLoginSuccess: () {
            Navigator.pop(context); // Close login sheet
            _finalizeListing();
          },
        ),
      );
    } else {
      _finalizeListing();
    }
  }

  void _finalizeListing() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => const SuccessScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _prevStep,
        ),
        title: Text(_getStepTitle(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text('$_currentStep / 5',
                  style: const TextStyle(color: Colors.grey)),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          // Step Progress Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 8),
                width: index + 1 == _currentStep ? 24 : 8,
                height: 4,
                decoration: BoxDecoration(
                  color: index + 1 == _currentStep
                      ? const Color(0xFF3B82F6)
                      : Colors.grey[800],
                  borderRadius: BorderRadius.circular(2),
                ),
              );
            }),
          ),
          Expanded(child: _buildStepContent()),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B82F6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: _currentStep == 5 ? _checkAuthAndPublish : _nextStep,
                child: Text(
                  _currentStep == 5 ? 'Finalize & publish' : 'Continue',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  String _getStepTitle() {
    switch (_currentStep) {
      case 1:
        return 'Add photos';
      case 2:
        return 'Item details';
      case 3:
        return 'Pricing';
      case 4:
        return 'Stock';
      case 5:
        return 'Review listing';
      default:
        return '';
    }
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 1:
        return _StepPhotos(listing: _listing);
      case 2:
        return _StepDetails(listing: _listing);
      case 3:
        return _StepPricing(listing: _listing);
      case 4:
        return _StepStock(listing: _listing);
      case 5:
        return _StepReview(listing: _listing);
      default:
        return Container();
    }
  }
}

// -----------------------------------------------------------------------------
// STEP SUB-VIEWS
// -----------------------------------------------------------------------------

// Step 1: Photos
class _StepPhotos extends StatelessWidget {
  final ItemListing listing;
  const _StepPhotos({required this.listing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Add up to 6 photos. The first photo will be the cover.',
              style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              // Mock picking image
              listing.imagePath = 'uploaded';
            },
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[700]!, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: Colors.blue),
                  SizedBox(height: 4),
                  Text('Add photo', style: TextStyle(color: Colors.blue, fontSize: 12)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Step 2: Item Details
class _StepDetails extends StatefulWidget {
  final ItemListing listing;
  const _StepDetails({required this.listing});

  @override
  State<_StepDetails> createState() => _StepDetailsState();
}

class _StepDetailsState extends State<_StepDetails> {
  final categories = [
    'Laptops',
    'Smartphones',
    'Computer parts',
    'Tablets & eBooks',
    'Enterprise networking',
    'Storage & media',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Item title *', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          TextField(
            onChanged: (val) => widget.listing.title = val,
            decoration: const InputDecoration(
              hintText: 'e.g. Apple MacBook Pro 14" M3',
              filled: true,
              fillColor: Color(0xFF161618),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          const Text('Category *', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: categories.map((cat) {
              final isSelected = widget.listing.category == cat;
              return ChoiceChip(
                label: Text(cat),
                selected: isSelected,
                selectedColor: const Color(0xFF3B82F6),
                backgroundColor: const Color(0xFF161618),
                onSelected: (selected) {
                  if (selected) {
                    setState(() => widget.listing.category = cat);
                  }
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          const Text('Description', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          TextField(
            maxLines: 4,
            onChanged: (val) => widget.listing.description = val,
            decoration: const InputDecoration(
              hintText: 'Describe your item - condition, specs, included accessories...',
              filled: true,
              fillColor: Color(0xFF161618),
              border: OutlineInputBorder(),
            ),
          )
        ],
      ),
    );
  }
}

// Step 3: Pricing
class _StepPricing extends StatefulWidget {
  final ItemListing listing;
  const _StepPricing({required this.listing});

  @override
  State<_StepPricing> createState() => _StepPricingState();
}

class _StepPricingState extends State<_StepPricing> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Original price (\$) *', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (val) => widget.listing.originalPrice = double.tryParse(val) ?? 0.0,
            decoration: const InputDecoration(
              prefixText: '\$ ',
              filled: true,
              fillColor: Color(0xFF161618),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Discount on selling price (%)', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (val) => widget.listing.discount = double.tryParse(val) ?? 0.0,
            decoration: const InputDecoration(
              suffixText: '%',
              filled: true,
              fillColor: Color(0xFF161618),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Delivery charge (\$) - leave blank for free', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (val) => widget.listing.deliveryCharge = double.tryParse(val) ?? 0.0,
            decoration: const InputDecoration(
              prefixText: '\$ ',
              filled: true,
              fillColor: Color(0xFF161618),
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}

// Step 4: Stock
class _StepStock extends StatefulWidget {
  final ItemListing listing;
  const _StepStock({required this.listing});

  @override
  State<_StepStock> createState() => _StepStockState();
}

class _StepStockState extends State<_StepStock> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text('How many units do you have available?',
              style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 32,
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () {
                  if (widget.listing.stockQuantity > 1) {
                    setState(() => widget.listing.stockQuantity--);
                  }
                },
              ),
              const SizedBox(width: 24),
              Text('${widget.listing.stockQuantity}',
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(width: 24),
              IconButton(
                iconSize: 32,
                icon: const Icon(Icons.add_circle_outline),
                onPressed: () {
                  setState(() => widget.listing.stockQuantity++);
                },
              ),
            ],
          ),
          const SizedBox(height: 40),
          const Text('You can update stock anytime from your listings.',
              style: TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}

// Step 5: Review
class _StepReview extends StatelessWidget {
  final ItemListing listing;
  const _StepReview({required this.listing});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.image, size: 80, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF161618),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(listing.title.isEmpty ? 'Untitled Item' : listing.title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(listing.category, style: const TextStyle(color: Colors.grey)),
                const Divider(height: 24, color: Colors.grey),
                Text(listing.description.isEmpty ? 'No description' : listing.description),
                const Divider(height: 24, color: Colors.grey),
                _summaryRow('Original price', '\$${listing.originalPrice.toStringAsFixed(2)}'),
                _summaryRow('Discount', '${listing.discount.toStringAsFixed(0)}%'),
                _summaryRow('Selling price', '\$${listing.sellingPrice.toStringAsFixed(2)}', isHighlight: true),
                _summaryRow('Delivery charge', '\$${listing.deliveryCharge.toStringAsFixed(2)}'),
                _summaryRow('Stock quantity', '${listing.stockQuantity}'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _summaryRow(String label, String value, {bool isHighlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(
            value,
            style: TextStyle(
              fontWeight: isHighlight ? FontWeight.bold : FontWeight.normal,
              color: isHighlight ? const Color(0xFF3B82F6) : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// LOG-IN MODAL (Triggered before publishing if user is unauthenticated)
// -----------------------------------------------------------------------------
class LoginModal extends StatelessWidget {
  final VoidCallback onLoginSuccess;
  const LoginModal({super.key, required this.onLoginSuccess});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        top: 20,
        left: 20,
        right: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Sign in required',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Please sign in to publish your listing on XChange.',
              style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              filled: true,
              fillColor: Color(0xFF0D0D0D),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              filled: true,
              fillColor: Color(0xFF0D0D0D),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B82F6),
              ),
              onPressed: () {
                isLoggedIn = true;
                onLoginSuccess();
              },
              child: const Text('Sign in & Publish'),
            ),
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// 3. SUCCESS / CONFIRMATION SCREEN
// -----------------------------------------------------------------------------
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFF142E18),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.green, size: 48),
              ),
              const SizedBox(height: 24),
              const Text('Item listed!',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              const Text(
                'Your item is now live on XChange.\nBuyers can find and purchase it immediately.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B82F6),
                  ),
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Text('Back to home'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}