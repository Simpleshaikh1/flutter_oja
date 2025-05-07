import 'package:flutter/material.dart';
import 'package:oja/components/add_to_cart.dart';
import 'package:oja/components/product_all_reviews.dart';
import 'package:oja/screens/write_review_screen.dart';

class ReviewDetailScreen extends StatefulWidget {
  final List<Map<String, dynamic>> reviews;
  const ReviewDetailScreen({super.key, required this.reviews});

  @override
  State<ReviewDetailScreen> createState() => _ReviewDetailScreen();
}

class _ReviewDetailScreen extends State<ReviewDetailScreen> {
  late final List<Map<String, dynamic>> _reviews = List<Map<String, dynamic>>.from(widget.reviews);
  int? _selectedRating; // null = all reviews

  Widget _buildFilterButton({required String label, int? rating}) {
    final isSelected = _selectedRating == rating;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.lightBlue[50] : Colors.white,
          foregroundColor: isSelected ? Colors.lightBlue : Colors.grey,
          padding: rating == null
              ? const EdgeInsets.symmetric(horizontal: 20, vertical: 12)
              : const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () => _filterByRating(rating),
        child: rating == null
            ? Text(label) // "All Reviews"
            : Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 4),
            const Icon(Icons.star, color: Colors.amber, size: 18),
            Text(label),
          ],
        ),
      ),
    );
  }


  List<Map<String, dynamic>> get _filteredReviews {
    if (_selectedRating == null) return _reviews;
    return _reviews.where((review) => review['rating'] == _selectedRating).toList();
  }

  void _filterByRating(int? rating) {
    setState(() {
      _selectedRating = rating;
    });
  }

  @override
  void initState() {
    super.initState();// Make mutable copy
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Review",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        // automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const Divider(height: 20, thickness: 2),
          const SizedBox(height: 10,),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              children: [
                _buildFilterButton(label: "All Reviews", rating: null),
                for (int i = 1; i <= 5; i++) _buildFilterButton(label: "$i", rating: i),
              ],
            ),
          ),
          Expanded(child: ReviewDetailScreenContent(
            reviews: _reviews,
          ),),
        ],
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          label: 'Write Review',
          onTap: () async {
            final newReview = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const WriteReviewScreen()),
            );
            if (newReview != null && mounted) {
              setState(() {
                _reviews.insert(0, Map<String, dynamic>.from(newReview));
              });
            }
          },
        ),
      ),
    );
  }
}

class ReviewDetailScreenContent extends StatelessWidget {
  final List<Map<String, dynamic>> reviews;
  // final VoidCallback onWriteReview;

  const ReviewDetailScreenContent({
    super.key,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 15,),
          ProductAllReviewsSection(
              averageRating: 4.5, reviewCount: 5, reviews: reviews),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
