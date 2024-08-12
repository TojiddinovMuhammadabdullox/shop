import 'package:flutter/material.dart';
import 'package:hometask/controllers/product_controller.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<ProductController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile accessory'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      body: Column(
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
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: ['Tablets', 'Phones', 'Ipads', 'Ipod', 'Accessories']
                  .map((category) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Chip(label: Text(category)),
                      ))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: 'Newest',
                  items: [
                    'Newest',
                    'Oldest',
                    'Price: High to Low',
                    'Price: Low to High'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
                TextButton.icon(
                  icon: const Icon(Icons.filter_list),
                  label: const Text('Filter (3)'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Wrap(
            spacing: 8,
            children: [
              Chip(label: const Text('Huawei'), onDeleted: () {}),
              Chip(label: const Text('Apple'), onDeleted: () {}),
              Chip(label: const Text('64GB'), onDeleted: () {}),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: productController.products.length,
              itemBuilder: (context, index) {
                final product = productController.products[index];
                return ListTile(
                  leading: Image.asset(product.imageUrl),
                  title: Text(product.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('\$${product.price.toStringAsFixed(2)}'),
                      const Row(
                        children: [
                          Icon(Icons.star, size: 16, color: Colors.amber),
                          Text('7.5'),
                          Text(' • 154 orders'),
                        ],
                      ),
                      const Text('Free Shipping'),
                    ],
                  ),
                  onTap: () =>
                      Navigator.pushNamed(context, '/product/${product.id}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
