import 'package:ai_table_list/src/utils/styles/ai_colors.dart';
import 'package:flutter/material.dart';

/// Control cell of header
abstract class TableHeaderCell {
  /// Content of cell
  final Widget child;

  /// Aligment of content cell
  final Alignment align;

  /// Control display in mobile versions
  final bool visibleMobile;

  TableHeaderCell({
    required this.child,
    this.align = Alignment.centerLeft,
    this.visibleMobile = false,
  });
}

/// Class header of table
abstract class TableHedaerInterface {
  /// Columns of header table
  final List<TableHeaderCell> columns;

  /// Background color of row
  final Color background;

  TableHedaerInterface({
    required this.columns,
    this.background = AIColors.white,
  });
}
