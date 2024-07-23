part of '../presentation/pop_up_create_to_do_task.dart';


abstract class CreateTaskPopUpController extends State<CreateTaskPopUp> {
  @override
  void dispose() {
    _titleCon.dispose();
    _descriptionCon.dispose();
    _dateCon.dispose();
    super.dispose();
  }

  // CONTROLLERS
  final TextEditingController _titleCon = TextEditingController();
  final TextEditingController _descriptionCon = TextEditingController();
  final TextEditingController _dateCon = TextEditingController();

  // TAKES CONTROLLER'S DATA AND CREATE A TASK
  Task createTaskWithData() {
    return Task(
        title: _titleCon.text,
        description: _descriptionCon.text,
        deadLine: (_dateCon.text != '') ? DateTime.parse(_dateCon.text) : null,
        complete: false,
        userID: widget.userID);
  }

  // CHECKS IF ERROR EXISTS
  String checkIfError() {
    String error = '';

    if (_titleCon.text.isEmpty) {
      error += 'Title';
    }
    return error;
  }

  // IF THERE'S NO ERROR IN THE TASK. CREATES THE TASK IN THE DB, ELSE POPUP ErrorAlertDialog
  Future<void> createTask() async {
    String error = checkIfError();

    if (error == '') {
      Task newTask = createTaskWithData();
      await widget.client.tasks.addTask(newTask);
      if (mounted) {
        Navigator.of(context).pop();
      }
    } else {
      await showDialog(
        context: context,
        builder: (BuildContext context) => error_dialog.ErrorAlertDialog(
            errorTitle: 'Error in $error',
            errorContent: '$error cannot be empty.'),
      );
    }
  }
}
