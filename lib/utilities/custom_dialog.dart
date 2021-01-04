import 'package:flutter/material.dart';

class CustomDialog {
  CustomDialog();

  alertDialog(
      {BuildContext context, String title, String message, IconData icon}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(
              icon,
              color: Colors.red,
            ),
            SizedBox(
              width: 8,
            ),
            Text(title),
          ],
        ),
        content: Text(message),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          )
        ],
      ),
    );
  }

  snackBar(BuildContext context) {
    return Scaffold.of(context)
        // ignore: deprecated_member_use
        .showSnackBar(SnackBar(content: Text('Register')));
  }
}
