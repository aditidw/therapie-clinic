import 'package:flutter/material.dart';
import 'package:therapie_clinic/constant.dart';
import 'package:therapie_clinic/screens/detail_screen.dart';

class ServiceCard extends StatelessWidget {
  var _name;
  var _bgColor;

  ServiceCard(this._name, this._bgColor);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(_name),
          ),
        );
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: _bgColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            title: Text(
              _name,
              style: TextStyle(
                color: kTitleTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),

          ),
        ),
      ),
    );
  }
}