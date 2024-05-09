import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {
  final String name;
  final bool hide;
  final TextEditingController mycontroller;
  final IconData iconData; 

  const TextArea({
    Key? key,
    required this.name,
    required this.hide,
    required this.mycontroller,
    required this.iconData, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 2.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 220, 226, 242),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Icon(
              iconData, // Use the provided icon data
              color: Color.fromARGB(
                255,
                150,
                154,
                161,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: TextFormField(
                controller: mycontroller,
                obscureText: hide,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "$name",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 150, 154, 161),
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
