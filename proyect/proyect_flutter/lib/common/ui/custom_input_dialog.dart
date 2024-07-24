import 'package:flutter/material.dart';
import 'package:proyect_client/proyect_client.dart';

class CustomInputDialog extends StatelessWidget {
  // POSSIBLE USER AND CLIENT
  final Client? client;
  final UsersRegistry? user;

  final String title;
  final String? content; // POSSIBLE CONTENT

  // TEXT CONTROLLERS LIST
  final List<TextEditingController> textControllers;

  // TEXT LABELS LIST
  final List<String> labels;

  // BUTTONS LIST
  final List<ElevatedButton> actions;

  const CustomInputDialog({
    super.key,
    this.client,
    this.user,
    required this.title,
    this.content,
    required this.textControllers,
    required this.labels,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    // MUST HAVE THE SAME LENGHT (NUMBER OF ELEMENTS)
    assert(textControllers.length == labels.length,
        'Controllers and labels must have the same length');

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: const Color(0xFF369DD8),
            width: 2.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 30,
                right: 30,
                bottom: 10,
              ),
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF369DD8),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            const Divider(
              color: Color(0xFF369DD8),
              indent: 30,
              endIndent: 30,
            ),
            if (content != null)
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  bottom: 10,
                  top: 10,
                ),
                child: Text(
                  content!,
                  style: const TextStyle(color: Colors.black87, fontSize: 18),
                ),
              ),

            // GENERATE TEXT INPUTS WITH DEFINED STYLE
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: 10,
                top: 10,
              ),
              child: Column(
                children: List.generate(textControllers.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: TextField(
                      controller: textControllers[index],
                      style: const TextStyle(
                        color: Color.fromARGB(255, 54, 157, 216),
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        labelText: labels[index],
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 54, 157, 216),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 54, 157, 216),
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 54, 157, 216),
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: 15,
                top: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // ADD POSSIBLE MULTIPLE BUTTONS
                children: [
                  ...actions.map((button) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: buildStyledButton(button),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // BUTTONS STYLING
  ElevatedButton buildStyledButton(ElevatedButton button) {
    return ElevatedButton(
      onPressed: button.onPressed,
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 25.0),
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        backgroundColor: Colors.white,
        foregroundColor: const Color.fromARGB(255, 54, 157, 216),
        shadowColor: const Color.fromARGB(255, 54, 157, 216),
        elevation: 3,
        shape: ContinuousRectangleBorder(
          side: const BorderSide(
            color: Color.fromARGB(255, 54, 157, 216),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: button.child,
    );
  }
}
