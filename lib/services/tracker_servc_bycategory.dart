part of 'services.dart';

class ByTodoService {
  Repository _repository;

  ByTodoService() {
    _repository = Repository();
  }

  saveTodo(Todo todo) async {
    return await _repository.insertData("todos", todo.todoMap());
  }

  readTodos() async {
    return await _repository.readData("todos");
  }

  //baca dari category
  readByCategory(category) async {
    return await _repository.readDataByColumn('todos', 'category', category);
  }
}
