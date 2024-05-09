import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Date extends StatefulWidget {
  final String Date_name;
  final double size;
  final ValueChanged<DateTime?> onDateChanged; // Add this line

  Date(
      {required this.Date_name,
      required this.size,
      required this.onDateChanged});

  @override
  _DateState createState() => _DateState(onDateChanged: onDateChanged);
}

class _DateState extends State<Date> {
  TextEditingController _dateController = TextEditingController();
  final ValueChanged<DateTime?> onDateChanged;

  _DateState({required this.onDateChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
        child: TextField(
          controller: _dateController,
          decoration: InputDecoration(
            label: Text(
              widget.Date_name,
              style: TextStyle(fontSize: 16),
            ),
            labelStyle: TextStyle(color: Colors.black),
            filled: false,
            fillColor: Colors.transparent,
            prefixIcon: Icon(
              Icons.calendar_today,
              size: 20,
            ),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          readOnly: true,
          onTap: () {
            _SelectDate();
          },
        ),
      ),
    );
  }

  Future<void> _SelectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );
    if (_picked != null) {
      setState(() {
        String formattedDate = DateFormat('dd MMMM yyyy').format(_picked);
        _dateController.text = formattedDate;
        onDateChanged(
            _picked); // Call the callback function with the selected date
      });
    }
  }
}
