import 'package:flutter/material.dart';
import 'Const.dart';

class ComboBox extends StatefulWidget {
  final List<String> items; // Define a parameter to accept the list of items
  final String Hint_name;
  final Function(String?) onChanged; // Add a callback function parameter
  const ComboBox({
    Key? key,
    required this.items,
    required this.Hint_name,
    required this.onChanged,
  }) : super(key: key); // Constructor

  @override
  State<ComboBox> createState() => _ComboBoxState();
}

class _ComboBoxState extends State<ComboBox> {
  String? valuechoose;

  @override
  Widget build(BuildContext context) {
    try {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          child: DropdownButton<String>(
            hint: Text(widget.Hint_name),
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 36,
            isExpanded: true,
            style: TextStyle(color: Scolor, fontSize: 22),
            value: valuechoose,
            items: widget.items.map((ValueItem) {
              return DropdownMenuItem<String>(
                value: ValueItem,
                child: Text(ValueItem),
              );
            }).toList(),
            onChanged: (newvalue) {
              setState(() {
                valuechoose = newvalue;
                widget.onChanged(newvalue); // Call the callback function
              });
            },
          ),
        ),
      );
    } catch (e) {
      print('Caught an error: $e');
      // Handle the error gracefully, such as showing a message to the user
      return Text('An error occurred');
    }
  }
}
