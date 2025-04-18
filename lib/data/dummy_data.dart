import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meals.dart';

const availableCategories = [
  Category(id: 'c1', title: 'Italian', color: Colors.purple),
  Category(id: 'c2', title: 'Quick & Easy', color: Colors.red),
  Category(id: 'c3', title: 'Hamburgers', color: Colors.orange),
  Category(id: 'c4', title: 'German', color: Colors.amber),
  Category(id: 'c5', title: 'Light & Lovely', color: Colors.blue),
  Category(id: 'c6', title: 'Exotic', color: Colors.green),
  Category(id: 'c7', title: 'Breakfast', color: Colors.lightBlue),
  Category(id: 'c8', title: 'Asian', color: Colors.lightGreen),
  Category(id: 'c9', title: 'French', color: Colors.pink),
  Category(id: 'c10', title: 'Summer', color: Colors.teal),
  // New categories added below
  Category(id: 'c11', title: 'Mexican', color: Colors.deepOrange),
  Category(id: 'c12', title: 'Desserts', color: Colors.indigo),
  Category(id: 'c13', title: 'Seafood', color: Colors.blueGrey),
  Category(id: 'c14', title: 'Vegetarian', color: Colors.lime),
  Category(id: 'c15', title: 'Comfort Food', color: Colors.brown),
  Category(id: 'c16', title: 'Mediterranean', color: Colors.cyan),
  Category(id: 'c17', title: 'BBQ', color: Colors.deepPurple),
  Category(id: 'c18', title: 'Soups', color: Colors.amberAccent),
  Category(id: 'c19', title: 'Healthy', color: Colors.lightGreenAccent),
  Category(id: 'c20', title: 'Kids Friendly', color: Colors.pinkAccent),
];

const dummyMeals = [
  Meal(
    id: 'm1',
    categories: ['c1', 'c2'],
    title: 'Spaghetti with Tomato Sauce',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/image1.jpg',
    duration: 20,
    ingredients: [
      '4 Tomatoes',
      '1 Tablespoon of Olive Oil',
      '1 Onion',
      '250g Spaghetti',
      'Spices',
      'Cheese (optional)',
    ],
    steps: [
      'Cut the tomatoes and the onion into small pieces.',
      'Boil some water - add salt to it once it boils.',
      'Put the spaghetti into the boiling water - they should be done in about 10 to 12 minutes.',
      'In the meantime, heaten up some olive oil and add the cut onion.',
      'After 2 minutes, add the tomato pieces, salt, pepper and your other spices.',
      'The sauce will be done once the spaghetti are.',
      'Feel free to add some cheese on top of the finished dish.',
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm2',
    categories: ['c2'],
    title: 'Toast Hawaii',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/image2.jpg',
    duration: 10,
    ingredients: [
      '1 Slice White Bread',
      '1 Slice Ham',
      '1 Slice Pineapple',
      '1-2 Slices of Cheese',
      'Butter',
    ],
    steps: [
      'Butter one side of the white bread',
      'Layer ham, the pineapple and cheese on the white bread',
      'Bake the toast for round about 10 minutes in the oven at 200°C',
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm3',
    categories: ['c2', 'c3'],
    title: 'Classic Hamburger',
    affordability: Affordability.pricey,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/image3.jpg',
    duration: 45,
    ingredients: [
      '300g Cattle Hack',
      '1 Tomato',
      '1 Cucumber',
      '1 Onion',
      'Ketchup',
      '2 Burger Buns',
    ],
    steps: [
      'Form 2 patties',
      'Fry the patties for c. 4 minutes on each side',
      'Quickly fry the buns for c. 1 minute on each side',
      'Bruch buns with ketchup',
      'Serve burger with tomato, cucumber and onion',
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm4',
    categories: ['c4'],
    title: 'Wiener Schnitzel',
    affordability: Affordability.luxurious,
    complexity: Complexity.challenging,
    imageUrl: 'assets/images/image4.jpg',
    duration: 60,
    ingredients: [
      '8 Veal Cutlets',
      '4 Eggs',
      '200g Bread Crumbs',
      '100g Flour',
      '300ml Butter',
      '100g Vegetable Oil',
      'Salt',
      'Lemon Slices',
    ],
    steps: [
      'Tenderize the veal to about 2–4mm, and salt on both sides.',
      'On a flat plate, stir the eggs briefly with a fork.',
      'Lightly coat the cutlets in flour then dip into the egg, and finally, coat in breadcrumbs.',
      'Heat the butter and oil in a large pan (allow the fat to get very hot) and fry the schnitzels until golden brown on both sides.',
      'Make sure to toss the pan regularly so that the schnitzels are surrounded by oil and the crumbing becomes ‘fluffy’.',
      'Remove, and drain on kitchen paper. Fry the parsley in the remaining oil and drain.',
      'Place the schnitzels on awarmed plate and serve garnishedwith parsley and slices of lemon.',
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm5',
    categories: [
      'c2'
          'c5',
      'c10',
    ],
    title: 'Salad with Smoked Salmon',
    affordability: Affordability.luxurious,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/image5.jpg',
    duration: 15,
    ingredients: [
      'Arugula',
      'Lamb\'s Lettuce',
      'Parsley',
      'Fennel',
      '200g Smoked Salmon',
      'Mustard',
      'Balsamic Vinegar',
      'Olive Oil',
      'Salt and Pepper',
    ],
    steps: [
      'Wash and cut salad and herbs',
      'Dice the salmon',
      'Process mustard, vinegar and olive oil into a dessing',
      'Prepare the salad',
      'Add salmon cubes and dressing',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm6',
    categories: ['c6', 'c10'],
    title: 'Delicious Orange Mousse',
    affordability: Affordability.affordable,
    complexity: Complexity.hard,
    imageUrl: 'assets/images/image6.jpg',
    duration: 240,
    ingredients: [
      '4 Sheets of Gelatine',
      '150ml Orange Juice',
      '80g Sugar',
      '300g Yoghurt',
      '200g Cream',
      'Orange Peel',
    ],
    steps: [
      'Dissolve gelatine in pot',
      'Add orange juice and sugar',
      'Take pot off the stove',
      'Add 2 tablespoons of yoghurt',
      'Stir gelatin under remaining yoghurt',
      'Cool everything down in the refrigerator',
      'Whip the cream and lift it under die orange mass',
      'Cool down again for at least 4 hours',
      'Serve with orange peel',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm7',
    categories: ['c7'],
    title: 'Pancakes',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/image7.jpg',
    duration: 20,
    ingredients: [
      '1 1/2 Cups all-purpose Flour',
      '3 1/2 Teaspoons Baking Powder',
      '1 Teaspoon Salt',
      '1 Tablespoon White Sugar',
      '1 1/4 cups Milk',
      '1 Egg',
      '3 Tablespoons Butter, melted',
    ],
    steps: [
      'In a large bowl, sift together the flour, baking powder, salt and sugar.',
      'Make a well in the center and pour in the milk, egg and melted butter; mix until smooth.',
      'Heat a lightly oiled griddle or frying pan over medium high heat.',
      'Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot.',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm8',
    categories: ['c8'],
    title: 'Creamy Indian Chicken Curry',
    affordability: Affordability.pricey,
    complexity: Complexity.challenging,
    imageUrl: 'assets/images/image8.jpg',
    duration: 35,
    ingredients: [
      '4 Chicken Breasts',
      '1 Onion',
      '2 Cloves of Garlic',
      '1 Piece of Ginger',
      '4 Tablespoons Almonds',
      '1 Teaspoon Cayenne Pepper',
      '500ml Coconut Milk',
    ],
    steps: [
      'Slice and fry the chicken breast',
      'Process onion, garlic and ginger into paste and sauté everything',
      'Add spices and stir fry',
      'Add chicken breast + 250ml of water and cook everything for 10 minutes',
      'Add coconut milk',
      'Serve with rice',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm9',
    categories: ['c9'],
    title: 'Chocolate Souffle',
    affordability: Affordability.affordable,
    complexity: Complexity.hard,
    imageUrl: 'assets/images/image9.jpg',
    duration: 45,
    ingredients: [
      '1 Teaspoon melted Butter',
      '2 Tablespoons white Sugar',
      '2 Ounces 70% dark Chocolate, broken into pieces',
      '1 Tablespoon Butter',
      '1 Tablespoon all-purpose Flour',
      '4 1/3 tablespoons cold Milk',
      '1 Pinch Salt',
      '1 Pinch Cayenne Pepper',
      '1 Large Egg Yolk',
      '2 Large Egg Whites',
      '1 Pinch Cream of Tartar',
      '1 Tablespoon white Sugar',
    ],
    steps: [
      'Preheat oven to 190°C. Line a rimmed baking sheet with parchment paper.',
      'Brush bottom and sides of 2 ramekins lightly with 1 teaspoon melted butter; cover bottom and sides right up to the rim.',
      'Add 1 tablespoon white sugar to ramekins. Rotate ramekins until sugar coats all surfaces.',
      'Place chocolate pieces in a metal mixing bowl.',
      'Place bowl over a pan of about 3 cups hot water over low heat.',
      'Melt 1 tablespoon butter in a skillet over medium heat. Sprinkle in flour. Whisk until flour is incorporated into butter and mixture thickens.',
      'Whisk in cold milk until mixture becomes smooth and thickens. Transfer mixture to bowl with melted chocolate.',
      'Add salt and cayenne pepper. Mix together thoroughly. Add egg yolk and mix to combine.',
      'Leave bowl above the hot (not simmering) water to keep chocolate warm while you whip the egg whites.',
      'Place 2 egg whites in a mixing bowl; add cream of tartar. Whisk until mixture begins to thicken and a drizzle from the whisk stays on the surface about 1 second before disappearing into the mix.',
      'Add 1/3 of sugar and whisk in. Whisk in a bit more sugar about 15 seconds.',
      'whisk in the rest of the sugar. Continue whisking until mixture is about as thick as shaving cream and holds soft peaks, 3 to 5 minutes.',
      'Transfer a little less than half of egg whites to chocolate.',
      'Mix until egg whites are thoroughly incorporated into the chocolate.',
      'Add the rest of the egg whites; gently fold into the chocolate with a spatula, lifting from the bottom and folding over.',
      'Stop mixing after the egg white disappears. Divide mixture between 2 prepared ramekins. Place ramekins on prepared baking sheet.',
      'Bake in preheated oven until scuffles are puffed and have risen above the top of the rims, 12 to 15 minutes.',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm10',
    categories: ['c2', 'c5', 'c10'],
    title: 'Asparagus Salad with Cherry Tomatoes',
    affordability: Affordability.luxurious,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/image10.jpg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil',
    ],
    steps: [
      'Wash, peel and cut the asparagus',
      'Cook in salted water',
      'Salt and pepper the asparagus',
      'Roast the pine nuts',
      'Halve the tomatoes',
      'Mix with asparagus, salad and dressing',
      'Serve with Baguette',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm11',
    categories: ['c11', 'c2'],
    title: 'Chicken Tacos',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/image11.jpg',
    duration: 25,
    ingredients: [
      '2 Chicken Breasts',
      '1 Packet Taco Seasoning',
      '8 Corn Tortillas',
      '1 Avocado',
      '1 Tomato',
      '1/2 Onion',
      'Fresh Cilantro',
      'Lime Wedges',
      'Sour Cream',
    ],
    steps: [
      'Season and cook chicken until done, then shred',
      'Warm tortillas according to package directions',
      'Dice tomato, onion, and avocado',
      'Assemble tacos with chicken and toppings',
      'Garnish with cilantro and lime juice',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm12',
    categories: ['c12', 'c9'],
    title: 'Crème Brûlée',
    affordability: Affordability.luxurious,
    complexity: Complexity.challenging,
    imageUrl: 'assets/images/image12.jpg',
    duration: 120,
    ingredients: [
      '2 Cups Heavy Cream',
      '5 Egg Yolks',
      '1/2 Cup Sugar + extra for topping',
      '1 Vanilla Bean',
      'Pinch of Salt',
    ],
    steps: [
      'Heat cream with scraped vanilla bean until steaming',
      'Whisk egg yolks with sugar until pale',
      'Temper eggs with hot cream mixture',
      'Strain and pour into ramekins',
      'Bake in water bath at 150°C for 45 minutes',
      'Chill for at least 2 hours',
      'Sprinkle with sugar and caramelize with torch',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm13',
    categories: ['c13', 'c16'],
    title: 'Garlic Shrimp Pasta',
    affordability: Affordability.pricey,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/image13.jpg',
    duration: 30,
    ingredients: [
      '300g Linguine',
      '400g Shrimp',
      '4 Garlic Cloves',
      '1/2 Teaspoon Red Pepper Flakes',
      '1/4 Cup Olive Oil',
      '1/4 Cup Parsley',
      '1 Lemon',
      'Salt and Pepper',
    ],
    steps: [
      'Cook pasta according to package directions',
      'Sauté garlic and red pepper in olive oil',
      'Add shrimp and cook until pink',
      'Toss with cooked pasta and lemon juice',
      'Garnish with parsley',
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm14',
    categories: ['c14', 'c19'],
    title: 'Quinoa Buddha Bowl',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/image13.jpg',
    duration: 35,
    ingredients: [
      '1 Cup Quinoa',
      '1 Sweet Potato',
      '1 Avocado',
      '1 Cup Chickpeas',
      '2 Cups Kale',
      '2 Tablespoons Tahini',
      '1 Lemon',
      '1 Teaspoon Cumin',
    ],
    steps: [
      'Cook quinoa according to package',
      'Roast diced sweet potato with cumin',
      'Massage kale with lemon juice',
      'Assemble bowl with all ingredients',
      'Drizzle with tahini dressing',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm15',
    categories: ['c15', 'c20'],
    title: 'Mac & Cheese',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/image14.png',
    duration: 25,
    ingredients: [
      '250g Macaroni',
      '2 Cups Cheddar Cheese',
      '2 Tablespoons Butter',
      '2 Tablespoons Flour',
      '2 Cups Milk',
      '1/2 Teaspoon Mustard Powder',
      'Salt and Pepper',
    ],
    steps: [
      'Cook macaroni until al dente',
      'Make roux with butter and flour',
      'Whisk in milk until thickened',
      'Add cheese and seasonings',
      'Combine with pasta and bake if desired',
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm16',
    categories: ['c17', 'c3'],
    title: 'BBQ Ribs',
    affordability: Affordability.pricey,
    complexity: Complexity.challenging,
    imageUrl: 'assets/images/image15.jpg',
    duration: 240,
    ingredients: [
      '1 Rack Pork Ribs',
      '1 Cup BBQ Sauce',
      '2 Tablespoons Brown Sugar',
      '1 Tablespoon Paprika',
      '1 Teaspoon Garlic Powder',
      '1 Teaspoon Onion Powder',
      '1 Teaspoon Salt',
    ],
    steps: [
      'Remove membrane from ribs',
      'Apply dry rub and refrigerate for 1 hour',
      'Cook low and slow at 120°C for 3 hours',
      'Brush with sauce last 30 minutes',
      'Rest before serving',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm17',
    categories: ['c18', 'c5'],
    title: 'Butternut Squash Soup',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/image16.jpg',
    duration: 45,
    ingredients: [
      '1 Butternut Squash',
      '1 Onion',
      '2 Carrots',
      '4 Cups Vegetable Stock',
      '1 Teaspoon Cinnamon',
      '2 Tablespoons Olive Oil',
      'Salt and Pepper',
    ],
    steps: [
      'Roast cubed squash with oil and spices',
      'Sauté onion and carrots',
      'Add stock and simmer',
      'Blend until smooth',
      'Adjust seasoning',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm18',
    categories: ['c8', 'c12'],
    title: 'Mango Sticky Rice',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/image18.jpg',
    duration: 60,
    ingredients: [
      '1 Cup Sticky Rice',
      '1 Ripe Mango',
      '1 Cup Coconut Milk',
      '2 Tablespoons Sugar',
      '1/4 Teaspoon Salt',
    ],
    steps: [
      'Soak rice for 30 minutes',
      'Steam rice for 20 minutes',
      'Heat coconut milk with sugar and salt',
      'Combine with cooked rice',
      'Serve with sliced mango',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm19',
    categories: ['c11', 'c15'],
    title: 'Beef Enchiladas',
    affordability: Affordability.affordable,
    complexity: Complexity.challenging,
    imageUrl: 'assets/images/image19.jpg',
    duration: 50,
    ingredients: [
      '500g Ground Beef',
      '1 Onion',
      '2 Garlic Cloves',
      '1 Packet Enchilada Sauce',
      '8 Corn Tortillas',
      '2 Cups Cheese',
      '1 Teaspoon Cumin',
    ],
    steps: [
      'Brown beef with onion and garlic',
      'Add spices and sauce',
      'Fill tortillas and roll up',
      'Top with remaining sauce and cheese',
      'Bake at 180°C for 20 minutes',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm20',
    categories: ['c7', 'c20'],
    title: 'French Toast',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/image20.jpg',
    duration: 15,
    ingredients: [
      '4 Slices Bread',
      '2 Eggs',
      '1/2 Cup Milk',
      '1 Teaspoon Cinnamon',
      '2 Tablespoons Butter',
      'Maple Syrup',
    ],
    steps: [
      'Whisk eggs, milk and cinnamon',
      'Dip bread in mixture',
      'Cook in butter until golden',
      'Serve with syrup',
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
];
