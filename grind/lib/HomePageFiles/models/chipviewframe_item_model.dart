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
      onLongPress: () {
        _showFullTextDialog(context);
      },
      child: IntrinsicWidth(
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
                Flexible(
                  // Use Flexible to allow text to shrink
                  child: Text(
                    widget.text,
                    overflow: TextOverflow.ellipsis,
                    style: isChecked
                        ? TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          )
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showFullTextDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Rounded corners
          ),
          title: Text(
            'See Your goal',
            style: TextStyle(color: Colors.white), // Title text color
          ),
          content: SingleChildScrollView(
            child: Text(
              widget.text,
              style: TextStyle(color: Colors.white), // Content text color
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Close',
                style: TextStyle(color: Colors.white), // Button text color
              ),
            ),
          ],
        );
      },
    );
  }
}
