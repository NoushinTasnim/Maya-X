import 'dart:math';
import 'package:flutter/material.dart';
import 'package:maya_x/colors.dart';
import 'package:maya_x/model/product.dart';
import '../components/product_card.dart';
import '../model/category.dart';
import '../model/load_json.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TextEditingController _searchController = TextEditingController();
  late Future<List<Category>> _futureCategories;

  @override
  void initState() {
    super.initState();
    _futureCategories = loadCategories();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kAccentColor,
        automaticallyImplyLeading: false,
        leading: const Icon(
          Icons.menu_rounded,
          color: kPrimaryColor,
        ),
        title: const Text(
          'লাবিবা আক্তার',
          style: TextStyle(
            fontFamily: 'Kalpurush',
            color: kPrimaryColor,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              Icons.shopping_cart_outlined,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
            child: TextField(
              cursorColor: kSecondaryColor,
              controller: _searchController,
              decoration: const InputDecoration(
                focusColor: kSecondaryColor,
                hintText: 'অনুসন্ধান করুন...',
                prefixIcon: Icon(Icons.search_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
              ),
              onChanged: (value) {
                // Perform search or filter operations here
                print('Search query: $value');
              },
            ),
          ),
          SizedBox(height: 32),
          Expanded(
            child: FutureBuilder<List<Category>>(
              future: _futureCategories,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No products available'));
                }

                final categories = snapshot.data!;
                return ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, categoryIndex) {
                    final category = categories[categoryIndex];
                    final pageController = PageController(
                      viewportFraction: .5,
                      initialPage: 1,
                    );

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            category.name,
                            style: const TextStyle(
                              fontFamily: 'Kalpurush',
                              color: kSecondaryColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: AspectRatio(
                            aspectRatio: 1.8,
                            child: PageView.builder(
                              onPageChanged: (value) {
                                setState(() {
                                  // Handle page change if necessary
                                });
                              },
                              controller: pageController,
                              physics: ClampingScrollPhysics(),
                              itemCount: category.products.length,
                              itemBuilder: (context, productIndex) {
                                return buildProductCard(
                                  category.products[productIndex],
                                  pageController,
                                  productIndex,
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 32),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProductCard(Product product, PageController pageController, int productIndex) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 0;
        if (pageController.position.haveDimensions) {
          value = productIndex - pageController.page!;
          value = (value).clamp(-1, 1);
        }
        double scale = 1 - (value.abs() * 0.33); // Adjust the scale factor as desired

        return AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: 1,
          child: Transform.scale(
            scale: scale,
            child: ProductCard(
              product: product,
            ),
          ),
        );
      },
    );
  }
}