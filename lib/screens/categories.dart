import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> _displayedCategories = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _displayedCategories = availableCategories;
    _searchController.addListener(_filterCategories);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterCategories() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _displayedCategories =
          availableCategories.where((category) {
            final categoryTitle = category.title.toLowerCase();
            return categoryTitle.contains(query);
          }).toList();
    });
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals =
        widget.availableMeals
            .where((meal) => meal.categories.contains(category.id))
            .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (ctx) => MealsScreen(title: category.title, meals: filteredMeals),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Food Recipes',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CategorySearchDelegate(
                  theme: Theme.of(context),
                  availableCategories: availableCategories,
                  availableMeals: widget.availableMeals,
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search food recipes...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surfaceVariant,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
            // Categories grid
            Expanded(
              child:
                  _displayedCategories.isEmpty
                      ? Center(
                        child: Text(
                          'No categories found',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      )
                      : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                        itemCount: _displayedCategories.length,
                        itemBuilder: (context, index) {
                          final category = _displayedCategories[index];
                          final mealCount =
                              widget.availableMeals
                                  .where(
                                    (meal) =>
                                        meal.categories.contains(category.id),
                                  )
                                  .length;

                          return CategoryGridItem(
                            category: category,
                            // mealCount: mealCount,
                            onSelectCategory: () {
                              _selectCategory(context, category);
                            },
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategorySearchDelegate extends SearchDelegate<String> {
  final List<Category> availableCategories;
  final List<Meal> availableMeals;
  final ThemeData theme;

  CategorySearchDelegate({
    required this.availableCategories,
    required this.availableMeals,
    required this.theme,
  });

  @override
  ThemeData appBarTheme(BuildContext context) {
    return theme.copyWith(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white70),
        border: InputBorder.none,
      ),
      textTheme: TextTheme(titleLarge: TextStyle(color: Colors.white)),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear, color: Colors.white),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.white),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(_filterCategories());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults(_filterCategories());
  }

  List<Category> _filterCategories() {
    return availableCategories.where((category) {
      final categoryTitle = category.title.toLowerCase();
      return categoryTitle.contains(query.toLowerCase());
    }).toList();
  }

  Widget _buildSearchResults(List<Category> categories) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        final mealCount =
            availableMeals
                .where((meal) => meal.categories.contains(category.id))
                .length;

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          color: theme.colorScheme.surfaceVariant.withOpacity(0.5),
          child: ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: category.color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.fastfood, color: category.color),
            ),
            title: Text(
              category.title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '$mealCount ${mealCount == 1 ? 'meal' : 'meals'} available',
              style: TextStyle(color: Colors.white70),
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.white70),
            onTap: () {
              final filteredMeals =
                  availableMeals
                      .where((meal) => meal.categories.contains(category.id))
                      .toList();

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (ctx) => MealsScreen(
                        title: category.title,
                        meals: filteredMeals,
                      ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  String get searchFieldLabel => 'Search categories...';

  @override
  TextStyle get searchFieldStyle => TextStyle(color: Colors.white);
}
