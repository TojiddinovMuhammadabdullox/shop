import 'package:flutter/material.dart';
import 'package:hometask/models/product.dart';

class ProductController with ChangeNotifier {
  final List<Product> _products = [
    Product(
        id: '1',
        name: 'Smartphone',
        price: 599.99,
        imageUrl: 'assets/smartphone.png',
        category: 'Electronics'),
    Product(
        id: '2',
        name: 'Laptop',
        price: 999.99,
        imageUrl: 'assets/laptop.png',
        category: 'Electronics'),
    Product(
        id: '3',
        name: 'Headphones',
        price: 149.99,
        imageUrl: 'assets/headphones.png',
        category: 'Electronics'),
    Product(
        id: '4',
        name: 'T-shirt',
        price: 24.99,
        imageUrl: 'assets/tshirt.png',
        category: 'Clothing'),
    Product(
        id: '5',
        name: 'Jeans',
        price: 49.99,
        imageUrl: 'assets/jeans.png',
        category: 'Clothing'),
    Product(
        id: '6',
        name: 'Sneakers',
        price: 79.99,
        imageUrl: 'assets/sneakers.png',
        category: 'Clothing'),
    Product(
        id: '7',
        name: 'Watch',
        price: 199.99,
        imageUrl: 'assets/watch.png',
        category: 'Accessories'),
    Product(
        id: '8',
        name: 'Backpack',
        price: 39.99,
        imageUrl: 'assets/backpack.png',
        category: 'Accessories'),
    Product(
        id: '9',
        name: 'Smart TV',
        price: 799.99,
        imageUrl: 'assets/smarttv.png',
        category: 'Electronics'),
    Product(
        id: '10',
        name: 'Coffee Maker',
        price: 89.99,
        imageUrl: 'assets/coffeemaker.png',
        category: 'Home'),
  ];

  final List<String> _categories = [
    'All',
    'Electronics',
    'Clothing',
    'Accessories',
    'Home'
  ];

  List<Product> get products => _products;
  List<String> get categories => _categories;

  List<Product> getProductsByCategory(String category) {
    if (category == 'All') return _products;
    return _products.where((product) => product.category == category).toList();
  }
}
