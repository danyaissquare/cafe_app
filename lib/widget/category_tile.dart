import 'package:flutter/material.dart';
import 'package:food_delivery_single_template/model/category.dart';

class CategoryTile extends StatelessWidget {
  final Category category;

  const CategoryTile({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final onPrimaryTitleSmall = themeData.textTheme.titleSmall
        ?.copyWith(color: themeData.colorScheme.onPrimary);

    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 110.0,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            child: Stack(
              children: [
                Image.asset(
                  "assets/${category.image}.jpg",
                  fit: BoxFit.cover,
                  width: 110,
                  height: 110,
                ),
                Positioned(
                  left: 0.0,
                  right: 0.0,
                  bottom: 0.0,
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    color: themeData.colorScheme.primary,
                    child: Text(
                      category.name,
                      textAlign: TextAlign.center,
                      style: onPrimaryTitleSmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
