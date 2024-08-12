import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hometask/views/widgets/category_chip.dart';
import 'package:hometask/views/widgets/custom_drawer.dart';
import 'package:hometask/views/widgets/custom_icon.dart';
import 'package:hometask/views/widgets/product_card.dart';
import 'package:provider/provider.dart';
import '../../controllers/product_controller.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../models/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedCategory = 'All';
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<ProductController>(context);
    final filteredProducts = productController
        .getProductsByCategory(_selectedCategory)
        .where(
          (product) =>
              product.name.toLowerCase().contains(_searchQuery.toLowerCase()),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CustomIcon(),
            const SizedBox(width: 8),
            Text(
              'Brand',
              style: TextStyle(
                fontSize: 25,
                color: Colors.blue.shade300,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => context.go('/cart'),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (query) {
                  setState(() {
                    _searchQuery = query;
                  });
                },
              ),
            ),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: productController.categories.map((category) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                    child: ZoomTapAnimation(
                      onTap: () {
                        setState(() {
                          _selectedCategory = category;
                        });
                      },
                      child: CategoryChip(category: category),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            _buildTrendingSection(),
            const SizedBox(height: 16),
            _buildDealsAndOffersSection(filteredProducts),
            const SizedBox(height: 16),
            _buildHomeAndOutdoorSection(filteredProducts),
          ],
        ),
      ),
    );
  }

  Widget _buildTrendingSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: double.infinity,
        color: Colors.blue[50],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.centerLeft, // Aligns content to the start
            children: [
              Image.asset(
                'assets/example.png',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Latest trending',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Electronic items',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Learn more',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDealsAndOffersSection(List<Product> products) {
    final electronicsProducts =
        products.where((product) => product.category == 'Electronics').toList();
    return _buildProductSection('Deals and offers', electronicsProducts);
  }

  Widget _buildHomeAndOutdoorSection(List<Product> products) {
    final homeProducts =
        products.where((product) => product.category == 'Home').toList();
    return _buildProductSection('Home and outdoor', homeProducts);
  }

  Widget _buildProductSection(String title, List<Product> products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Container(
                width: 150,
                padding: const EdgeInsets.all(8),
                child: ProductCard(product: products[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
