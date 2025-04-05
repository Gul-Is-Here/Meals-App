import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/meals_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => MealDetailsScreen(meal: meal)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.fastfood_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          ),
          const SizedBox(height: 24),
          Text(
            'No meals found',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Try selecting a different category or check back later for new recipes!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onBackground.withOpacity(0.8),
              ),
            ),
          ),
          const SizedBox(height: 32),
          // FilledButton.tonal(
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          //   child: const Text('Back to Categories'),
          // ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = CustomScrollView(
        slivers: [
          if (title != null)
            SliverAppBar(
              title: Text(title!),
              centerTitle: true,
              pinned: true,
              expandedHeight: 120,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary.withOpacity(0.3),
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
            ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList.separated(
              itemCount: meals.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder:
                  (ctx, index) => MealItem(
                    meal: meals[index],
                    onSelectMeal: (meal) {
                      selectMeal(context, meal);
                    },
                  ),
            ),
          ),
        ],
      );
    }

    if (title == null) {
      return Scaffold(
        body: Padding(padding: const EdgeInsets.all(16), child: content),
      );
    }

    return Scaffold(body: content);
  }
}
