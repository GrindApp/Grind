import 'package:flutter/material.dart';

class MyCheckbox extends StatefulWidget {
  final String text;

  MyCheckbox({required this.text});

  @override
  _MyCheckboxState createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.grey[900],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  shape: BoxShape.rectangle,
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.white,
                    width: isChecked ? 1.0 : 1.0,
                  ),
                ),
                width: 20, // Adjust width and height as needed
                height: 20,
                child: isChecked
                    ? Icon(Icons.check, color: Colors.white, size: 15)
                    : null,
              ),
              SizedBox(width: 8),
              Text(
                widget.text, // Using the input parameter here
                style: isChecked
                    ? TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
