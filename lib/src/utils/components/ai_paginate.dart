// ignore_for_file: prefer_const_constructors

import 'package:ai_table_list/src/utils/styles/ai_colors.dart';
import 'package:flutter/material.dart';

/// Widget paginate in development...
class AIPaginate extends StatefulWidget {
  const AIPaginate({Key? key}) : super(key: key);

  @override
  State<AIPaginate> createState() => _AIPaginateState();
}

class _AIPaginateState extends State<AIPaginate> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        children: [
          Text(
            'Mostrando 1 a 10 de 23',
            style: TextStyle(fontSize: 15),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.arrow_left_sharp),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: AIColors.blue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                '1',
                style: TextStyle(color: AIColors.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                '2',
                style: TextStyle(color: AIColors.black),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                '3',
                style: TextStyle(color: AIColors.black),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                '4',
                style: TextStyle(color: AIColors.black),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.arrow_right_sharp),
          ),
        ],
      ),
    );
  }
}
