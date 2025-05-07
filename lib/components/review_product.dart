import 'package:flutter/material.dart';
import 'package:oja/screens/review_screen.dart';

class ReviewProductSection extends StatelessWidget {
  final double averageRating;
  final int reviewCount;
  final List<Map<String, dynamic>> reviews;

  const ReviewProductSection({
    super.key,
    required this.averageRating,
    required this.reviewCount,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) return const SizedBox();

    final firstReview = reviews[0];

    return Padding(
      padding: const  EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
               const Text(
                'Review Product',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReviewDetailScreen(reviews: reviews))
                  )
                },
                child: const Text(
                  'See more',
                  style: TextStyle(color: Colors.lightBlue, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Overall rating
          Row(
            children: [
              ...List.generate(5, (i) {
                final fullStar = i < averageRating.floor();
                final halfStar = !fullStar && i < averageRating && averageRating % 1 >= 0.5;
                return Icon(
                  fullStar ? Icons.star : halfStar ? Icons.star_half : Icons.star_border,
                  color: Colors.orange,
                  size: 20,
                );
              }),
              const SizedBox(width: 8),
              Text('$averageRating ($reviewCount reviews)', style: const TextStyle(color: Colors.black54)),
            ],
          ),
          const SizedBox(height: 16),

          // Reviewer info
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(firstReview['avatar']),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(firstReview['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Row(
                    children: List.generate(5, (i) {
                      final r = firstReview['rating'] as double;
                      final fullStar = i < r.floor();
                      final halfStar = !fullStar && i < r && r % 1 >= 0.5;
                      return Icon(
                        fullStar ? Icons.star : halfStar ? Icons.star_half : Icons.star_border,
                        color: Colors.orange,
                        size: 16,
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Review comment
          Text(
            firstReview['comment'],
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 12),

          // Review images
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                (firstReview['images'] as List<String>).length,
                    (index) => _reviewImage(firstReview['images'][index]),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Date
          Text(
            'Reviewed on ${firstReview['date']}',
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _reviewImage(String path) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(path),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
