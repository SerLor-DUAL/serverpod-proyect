import 'package:flutter/material.dart';
import 'package:proyect_client/proyect_client.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class CustomInputDialog extends StatelessWidget {
  // POSSIBLE USER AND CLIENT
  final Client? client;
  final UsersRegistry? user;
  final List<int>? buttonInTextFields;
  final bool? isPhone;
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
    this.buttonInTextFields,
    this.isPhone,
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
                    child: (isPhone == true && index == 1)?
                          Row(
                           children: [
                              Expanded(
                                child: SizedBox(
                                  height: 20,
                                  width: 80, // Adjust the width of the dropdown
                                  child: LanguageDropdown(
                                    initialValue: 'ES',
                                    onChanged: (value) {
                                      // Handle value change if needed
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2, // Allow TextField to take more space
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
                                    suffixIcon: (buttonInTextFields != null)
                                        ? (buttonInTextFields!.contains(index)
                                            ? IconButton(
                                                icon: const Icon(
                                                  Icons.add,
                                                  color: Color.fromARGB(255, 54, 157, 216),
                                                ),
                                                onPressed: () async {
                                                  await _selectDate(
                                                      context, textControllers[index]);
                                                })
                                            : null)
                                        : null,
                                  ),
                                ),
                              ),
                            ],
                          ) :
                    TextField(
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
                        suffixIcon: (buttonInTextFields != null)
                            ? (buttonInTextFields!.contains(index)
                                ? IconButton(
                                    icon: const Icon(
                                      Icons.add,
                                      color: Color.fromARGB(255, 54, 157, 216),
                                    ),
                                    onPressed: () async {
                                      await _selectDate(
                                          context, textControllers[index]);
                                    })
                                : null)
                            : null,
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

  // DATE SELECTOR
  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final today = DateTime.now();
    final aYearFromToday = today.add(const Duration(days: 365));

    var picked = await showCalendarDatePicker2Dialog(
        context: context,
        config: CalendarDatePicker2WithActionButtonsConfig(
          currentDate: today,
          firstDate: today,
          lastDate: aYearFromToday,
          calendarType: CalendarDatePicker2Type.single,
          calendarViewMode: CalendarDatePicker2Mode.day,
          selectedDayHighlightColor: const Color.fromARGB(255, 54, 157, 216),
          controlsTextStyle:const TextStyle(color: Color.fromARGB(255, 54, 157, 216),),
          nextMonthIcon: const Icon(Icons.navigate_next, color:   Color.fromARGB(255, 54, 157, 216),),
          lastMonthIcon: const Icon(Icons.navigate_before, color:  Color.fromARGB(255, 54, 157, 216),),
          centerAlignModePicker: true,
          useAbbrLabelForMonthModePicker: false
        ),
        dialogSize: const Size(525, 300),
        value: [today],
        borderRadius: BorderRadius.circular(8),
      );

    if (picked != null) {
      controller.text = picked.toString().substring(1,11);
    }
  }
}

//----------------------------//

class LanguageDropdown extends StatefulWidget {
  final String? initialValue;
  final ValueChanged<String?>? onChanged;

  const LanguageDropdown({
    super.key,
    this.initialValue,
    this.onChanged,
  });

  @override
 createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue ?? 'ES'; // Default value
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedValue,
      icon: const Icon(Icons.arrow_drop_down),
      style: const TextStyle(
        color: Color.fromARGB(255, 54, 157, 216),
        fontWeight: FontWeight.bold,
        fontSize: 14, // Smaller font size
      ),
      underline: Container(
        height: 0,
        color: const Color.fromARGB(255, 54, 157, 216),
      ),
      onChanged: (String? newValue) {
        setState(() {
          _selectedValue = newValue;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(newValue);
        }
      },
      items: <String>['ES', 'AR', 'VEN'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(fontSize: 14), // Smaller font size
          ),
        );
      }).toList(),
      isExpanded: false, // Ensure dropdown is not too wide
    );
  }
}