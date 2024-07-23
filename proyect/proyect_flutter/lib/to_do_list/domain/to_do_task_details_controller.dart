part of '../presentation/to_do_task_details.dart';

abstract class TaskDetailsController extends State<TaskDetails> {
// DELETE TASK
  Future<void> deleteTask(Task task) async {
    await client.tasks.deleteTask(task);
  }
}
