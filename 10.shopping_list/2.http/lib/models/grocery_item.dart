import 'package:shopping_list/models/category.dart';

class GroceryItem {
  final String id;
  final String name;
  final int quantity;
  // there is a category in flutter foundation,
  // so be-careful to add category model for this property
  final Category category;

  const GroceryItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });
}
