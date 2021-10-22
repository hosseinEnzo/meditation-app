import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils{
  Utils(this.context);
  BuildContext context;
  void showSnackBar(String text,IconData icon,Color color){
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          children:  [
            Icon(
              Icons.warning,
              color: color,
            ),
            const SizedBox(
              width: 5,
            ),
             Text(text)
          ],
        )));
  }

}