import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String category;

  const CategoryChip({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(
          category,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.blue,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
