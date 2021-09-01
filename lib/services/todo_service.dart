import 'package:taskmanagerapp/repositories/repository.dart';
import 'package:taskmanagerapp/models/todo.dart';
class TodoService{
  Repository _repository;

  TodoService(){
    _repository=Repository();
  }
  saveTodo(Todo todo) async{
    return await _repository.insertData('todos',todo.todoMap());
  }
  //read todos
  readTodos() async{
    return await _repository.readData('todos');
  }
  // read todo by id
  readTodoById(todoId) async {
  return await _repository.readDataById('todos',todoId);
  }

  updateTodo(Todo todo) async {
    return 0;
  }

  deleteTodo(todoId) async {
    return await _repository.deleteData("todos", todoId);
  }
}