import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String customTitle;
  final String customContent;
  final List<ElevatedButton>? customActions;

  const CustomAlertDialog({
    super.key,
    required this.customTitle,
    required this.customContent,
    this.customActions,
  });

  @override
  Widget build(BuildContext context) {
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
                  top: 10.0, left: 30, right: 30, bottom: 10),
              child: Text(
                customTitle,
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
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, bottom: 10, top: 10),
              child: Text(
                customContent,
                style: const TextStyle(color: Colors.black87, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, bottom: 15, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                // POSSIBLE MULTIPLE BUTTONS
                children: [
                  if (customActions != null && customActions!.isNotEmpty)
                    ...customActions!.map((button) => Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: buildStyledButton(button),
                          ),
                        ))
                  else
                    Expanded(
                      child: buildStyledButton(
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'OK',
                            style: TextStyle(
                              color: Color.fromARGB(255, 54, 157, 216),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // CUSTOM BUTTON FOR DEFINED CUSTOM ACTIONS
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
