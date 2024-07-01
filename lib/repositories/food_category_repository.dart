import 'package:core/entities.dart';

class FoodCategoryRepository {
  const FoodCategoryRepository();

  Future<List<FoodCategory>> fetchFoodCategories() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return foodCategories.map((category) {
        return FoodCategory(
          id: category['id']!,
          name: category['name']!,
          imageUrl: category['imageUrl']!,
        );
      }).toList();
    } catch (err) {
      throw Exception('Error fetching food categories: $err');
    }
  }
}

const foodCategories = [
  {
    'id': 'category_1',
    'name': 'Coffe',
    'imageUrl': 'assets/icons/copi.png',
  },
  {
    'id': 'category_2',
    'name': 'ES Jeruk',
    'imageUrl': 'assets/icons/copi.png',
  },
];
