import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/providers/favourites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealFavoriteStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  content: Text(
                    wasAdded ? 'Added to favorites!' : 'Removed from favorites',
                  ),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      ref
                          .read(favoriteMealsProvider.notifier)
                          .toggleMealFavoriteStatus(meal);
                    },
                  ),
                ),
              );
            },
            icon:
                isFavorite
                    ? const Icon(
                      Icons.favorite,
                      key: ValueKey('icon1'),
                      color: Colors.red, // Set favorite icon to red
                    )
                    : const Icon(
                      Icons.favorite_border,
                      key: ValueKey('icon2'),
                      color: Colors.red, // Set unfavorite icon to red
                    ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // Remove the SliverAppBar since we already have a regular AppBar
          SliverToBoxAdapter(
            child: Column(
              children: [
                Hero(
                  tag: meal.id,
                  child: InteractiveViewer(
                    child: Image.asset(
                      meal.imageUrl,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) => Container(
                            color: colorScheme.surfaceVariant,
                            height: 300,
                            child: const Center(child: Icon(Icons.fastfood)),
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Meal summary chips
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _buildInfoChip(
                            context,
                            Icons.schedule,
                            '${meal.duration} min',
                          ),
                          _buildInfoChip(
                            context,
                            Icons.work_outline,
                            meal.complexity.name.capitalize(),
                          ),
                          _buildInfoChip(
                            context,
                            Icons.attach_money,
                            meal.affordability.name.capitalize(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Ingredients section
                      _SectionTitle(
                        title: 'Ingredients',
                        icon: Icons.shopping_basket,
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children:
                            meal.ingredients
                                .map(
                                  (ingredient) => InputChip(
                                    label: Text(ingredient),
                                    onPressed: () {
                                      // Could add functionality to add to shopping list
                                    },
                                    avatar: const Icon(Icons.circle, size: 8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
                      const SizedBox(height: 24),
                      // Steps section
                      _SectionTitle(title: 'Preparation', icon: Icons.list_alt),
                      const SizedBox(height: 12),
                      ...meal.steps.asMap().entries.map((entry) {
                        final index = entry.key + 1;
                        final step = entry.value;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Card(
                            elevation: 0,
                            color: colorScheme.surfaceVariant.withOpacity(0.3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                // Could add functionality to mark steps as done
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: colorScheme.primary,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text(
                                        '$index',
                                        style: theme.textTheme.bodySmall
                                            ?.copyWith(
                                              color: colorScheme.onPrimary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        step,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Could add functionality to share the recipe
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Share ${meal.title} recipe')));
        },
        icon: const Icon(Icons.share),
        label: const Text('Share'),
      ),
    );
  }

  Widget _buildInfoChip(BuildContext context, IconData icon, String text) {
    return Chip(
      avatar: Icon(icon, size: 18),
      label: Text(text),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      side: BorderSide.none,
      visualDensity: VisualDensity.compact,
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
