import 'package:flutter/material.dart';
import 'Const.dart';

// ignore: must_be_immutable
class Counter extends StatefulWidget {
  final String PType;
  void Function(int) onValueChanged;
  Counter({required this.PType, required this.onValueChanged});

  @override
  _codeWidgetState createState() => _codeWidgetState();
}

class _codeWidgetState extends State<Counter> {
  int _AddultNum = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            color: Colors.grey[400],
            child: IconButton(
              icon: Icon(
                Icons.remove,
                size: 15,
              ),
              onPressed: () {
                if (_AddultNum > 0) {
                  setState(() {
                    _AddultNum--;
                  });
                    widget.onValueChanged(_AddultNum);
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              "$_AddultNum " + widget.PType,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            width: 30,
            height: 30,
            color: Pcolor,
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 15,
              ),
              onPressed: () {
                if (_AddultNum < 5) {
                  setState(() {
                    _AddultNum++;
                  });
                   widget.onValueChanged(_AddultNum);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
