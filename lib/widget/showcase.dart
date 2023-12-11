import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_single_template/cubit/favorite_cubit.dart';
import 'package:food_delivery_single_template/localization/locals.dart';
import 'package:food_delivery_single_template/model/food_menu_item.dart';
import 'package:food_delivery_single_template/widget/food_menu_item_list_tile.dart';

class Showcase extends StatelessWidget {
  final String title;
  final List<FoodMenuItem> menuItems;
  final void Function() callback;

  const Showcase(
      {required this.title,
      required this.menuItems,
      required this.callback,
      super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final titleLarge = themeData.textTheme.titleLarge;

    final locals = Locals.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(title, style: titleLarge),
              const Spacer(),
              GestureDetector(
                onTap: callback,
                child: Text(
                  locals.seeAll,
                  style: titleLarge?.copyWith(
                    color: themeData.colorScheme.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 240.0,
          child: BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, favState) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final menuItem = menuItems[index];
                  return FoodMenuItemListTile(
                    item: menuItem,
                    isFavorite: favState.favorites
                        .any((fav) => fav.itemId == menuItem.id),
                    key: UniqueKey(),
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}
