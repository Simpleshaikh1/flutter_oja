import 'package:flutter/material.dart';
import 'package:oja/components/add_to_cart.dart';
import 'package:oja/components/image_container.dart';
import 'package:oja/components/might_also_like.dart';
import 'package:oja/components/review_product.dart';
import 'package:oja/components/search_product.dart';
import 'package:oja/components/select_color.dart';
import 'package:oja/components/select_size.dart';
import 'package:oja/components/specification.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreen();
}

class _ProductDetailScreen extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Men's Regular Fit T-Shirt",
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              children: [
                const SizedBox(
                  width: 12,
                ),
                FavoriteIcon(isFavorite: false, onToggle: () {}),

                SearchIcon(
                  onTap: () {},
                ),
                // IconButton(onPressed: (){}, icon: const Icon(Icons.search), color: Colors.black,)
              ],
            ),
          )
        ],
      ),
      body: ProductDetailsScreenContent(product: widget.product),
    );
  }
}

class ProductDetailsScreenContent extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailsScreenContent({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // const Divider(height: 20, thickness: 2,),
          const ProductImageCarousel(imagePaths: ['assets/man_in_shirt.png', 'assets/man_in_shirt.png', 'assets/man_in_shirt.png', 'assets/man_in_shirt.png']),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(

              children: [
                Row(
                  children: [
                    Text(
                      product['title'],
                      style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[850]),
                    ),
                    const SizedBox(width: 30,),
                    FavoriteIcon(isFavorite: true, onToggle: () {})
                  ],
                ),
                const SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: List.generate(5, (index) {
                        final rating = product['rating'] as double;
                        final fullStar = index < rating.floor();
                        final halfStar = !fullStar && index < rating && rating % 1 >= 0.5;

                        return Icon(
                          fullStar
                              ? Icons.star
                              : halfStar
                              ? Icons.star_half
                              : Icons.star_border,
                          size: 30,
                          color: Colors.amber,
                        );
                      }),
                    ),
                    const SizedBox(height: 20,),
                    Text('\$${(product['price'] as double).toStringAsFixed(2)}', style: const TextStyle(fontSize: 30, color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),)
                  ],
                ),
                const SizedBox(height: 30,),
                const SelectSizeSection(),
                const SizedBox(height: 0,),
                const SelectColorSection(),
                const SizedBox(height: 30,),
                const SpecificationSection(),
                const SizedBox(height: 30,),
                const ReviewProductSection(
                  averageRating: 4.5,
                  reviewCount: 5,
                  reviews: [
                    {
                      'name': 'John Doe',
                      'avatar': 'assets/profile1.png',
                      'rating': 4.0,
                      'comment': 'The product is really comfortable and looks great!',
                      'images': [
                        'assets/review_cloth.png',
                        'assets/review_cloth2.png',
                      ],
                      'date': 'April 25, 2025',
                    },
                    // ...more reviews
                  ],
                ),
                const SizedBox(height: 30,),
                const Align(
                  alignment: Alignment.centerLeft,
                  child:Text('You Might Also Like', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
                ),
                const MightLikeSection(),
                const SizedBox(height: 30,),
                CustomButton(label: 'Add To Cart', onTap: (){}),
              ],
            ),
          )
        ],
      ),
    );
  }
}
