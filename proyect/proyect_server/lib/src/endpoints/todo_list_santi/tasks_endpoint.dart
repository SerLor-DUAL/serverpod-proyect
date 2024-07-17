import 'package:serverpod/serverpod.dart';
import '../../generated/todo_list_santi/tasks.dart';

class TasksEndpoint extends Endpoint {

  // DB ENDPOINT METHODS
  // CREATE

  Future<void> addTask(Session session, Task task) async {
    await Task.db.insertRow(session, task);
  }

  Future<void> addListOfTasks(Session session, List<Task> tasks) async {
    await Task.db.insert(session, tasks);
  }

  // READ
  Future<Task?> findById(Session session, int taskID) async {
    return await Task.db.findById(
      session, 
      taskID);
  }
  Future<List<Task>> getEveryTask(Session session, int idUser) async {
    return await Task.db.find(
      session,
      orderBy: (task) => task.id,
      where: (task) => task.userID.equals(idUser)
      );
  }
  Future<List<Task>> getEveryTaskByDeadLineASC(Session session, int idUser) async {
    return await Task.db.find(
      session,
      orderBy: (task) => task.deadLine,
      where: (task) => task.userID.equals(idUser)
    );
  }
  Future<List<Task>> getEveryTaskByDeadLineDES(Session session) async {
    return await Task.db.find(
      session,
      orderDescending: true,
      orderBy: (task) => task.deadLine);
  }
  // UPDATE
  Future<void> updateTask(Session session, Task task) async {
    await Task.db.updateRow(session, task);
  }


  // Just inverts complete boolean
  Future<void> toogleComplete(Session session, Task task) async {
    task.complete = !task.complete;
    await Task.db.updateRow(session, task);
  }

  // DELETE
  Future<void> deleteTask(Session session, Task task) async {
    await Task.db.deleteRow(session, task);
  }
  Future<void> deleteMultipleTasks(Session session, List<Task> tasks) async {
    await Task.db.delete(session, tasks);
  }
}
