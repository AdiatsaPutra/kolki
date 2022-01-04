part of 'models.dart';

class CategoryTodo {
  int id;
  String name;
  String description;

  String categoryDate;
  categoryMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['name'] = name;
    mapping['description'] = description;

    mapping['categoryDate'] = categoryDate;

    return mapping;
  }
}
