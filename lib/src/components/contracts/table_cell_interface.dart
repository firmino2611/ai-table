import 'package:flutter/cupertino.dart';

/// Class control cell of rows
abstract class TableCellInterface {
  /// Content of cell
  final Widget child;

  /// Aligmento content cell
  final Alignment align;

  TableCellInterface({
    required this.child,
    this.align = Alignment.centerLeft,
  });
}
