part of 'services.dart';

class CategoryService {
  Repository _repository;

  CategoryService() {
    _repository = Repository();
  }
  //create data
  saveCategory(CategoryTodo category) async {
    return await _repository.insertData("categories", category.categoryMap());
    //parameter olehobject category//method savecategory
    //print(category.name);
    //print(category.description);
  }

  //update data
  updateCategory(CategoryTodo category) async {
    return await _repository.updateData('categories', category.categoryMap());
  }

  readCategories() async {
    return await _repository.readData('categories');
  }

  //readData form by Id
  readCategoryById(categoryId) async {
    return await _repository.readDataById('categories', categoryId);
  }

  deleteCategory(categoryId) async {
    return await _repository.deleteData('categories', categoryId);
  }
}
