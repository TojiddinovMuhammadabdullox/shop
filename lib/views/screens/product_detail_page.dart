import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hometask/controllers/cart_controller.dart';
import 'package:hometask/controllers/product_controller.dart';
import 'package:hometask/models/product.dart';
import 'package:go_router/go_router.dart';

class ProductDetailPage extends StatelessWidget {
  final String id;

  const ProductDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<ProductController>(context);
    final cartController = Provider.of<CartController>(context);
    final Product product =
        productController.products.firstWhere((p) => p.id == id);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                product.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Text(
                product.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  SizedBox(width: 4),
                  Text('4.5'),
                  SizedBox(width: 8),
                  Icon(Icons.message, color: Colors.grey),
                  SizedBox(width: 3),
                  Text('32 reviews'),
                  SizedBox(width: 8),
                  Text('•'),
                  SizedBox(width: 8),
                  Icon(Icons.category_rounded, color: Colors.grey),
                  SizedBox(width: 3),
                  Text('154 sold'),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                '\$${product.price.toStringAsFixed(2)} (50-100 pcs)',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        cartController.addItem(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Added to cart')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'Send inquiry',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Chip(
                      labelPadding:
                          EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                      label: Icon(
                        CupertinoIcons.heart,
                        color: Color.fromARGB(255, 15, 92, 225),
                      )),
                ],
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Condition:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Brand new'),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Material:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Plastic'),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Category:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Electronics, gadgets'),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Item num:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('23421'),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Info about edu item is an ideal companion for anyone engaged in learning. The drone provides precise and...',
              ),
              const SizedBox(height: 8),
              const Text(
                'Read more',
                style: TextStyle(color: Colors.blue),
              ),
              const Divider(height: 32),
              const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('R', style: TextStyle(color: Colors.white)),
                ),
                title: Text('Supplier'),
                subtitle: Text('Guangji Trading LLC'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.flag, color: Colors.grey),
                    SizedBox(width: 4),
                    Text('Germany'),
                    SizedBox(width: 4),
                    Icon(Icons.verified, color: Colors.grey),
                    SizedBox(width: 4),
                    Icon(Icons.local_shipping, color: Colors.grey),
                  ],
                ),
              ),
              const Divider(height: 32),
              const Text(
                'Similar products',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildSimilarProduct(
                        context, 'T-shirt', '10.30', 'assets/tshirt.png'),
                    _buildSimilarProduct(
                        context, 'Jacket', '10.30', 'assets/tshirt.png'),
                    _buildSimilarProduct(
                        context, 'Sweater', '10.30', 'assets/tshirt.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSimilarProduct(
      BuildContext context, String name, String price, String imageUrl) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imageUrl, width: 120, height: 120, fit: BoxFit.cover),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text('\$$price', style: const TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}
