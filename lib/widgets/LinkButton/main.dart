import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  LinkButton({
    @required this.icon,
    @required this.title,
    @required this.onPressed,
  });

  final ButtonStyle buttonStyle = ButtonStyle(
    overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange[50]),
  );
  final IconData icon;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: buttonStyle,
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.orange,
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .button
                .merge(TextStyle(color: Colors.orange)),
          )
        ],
      ),
      onPressed: onPressed,
    );
  }
}
