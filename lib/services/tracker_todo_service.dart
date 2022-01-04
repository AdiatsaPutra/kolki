part of 'services.dart';

class TodoService {
  Repository _repository;

  TodoService() {
    _repository = Repository();
  }

  saveTodo(Todo todo) async {
    return await _repository.insertData("todos", todo.todoMap());
  }

  readTodos() async {
    return await _repository.readData("todos");
  }

  //baca dari category
  readTodosByCategory(category) async {
    return await _repository.readDataByColumn('todos', 'category', category);
  }
}
