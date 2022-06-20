import 'package:ai_table_list/src/utils/styles/ai_colors.dart';
import 'package:flutter/material.dart';

/// Class of filters table
abstract class TableFilter {
  /// Control widget of search default
  final FilterHeaderSearch? search;

  /// Allows the construction of a custom input
  final FilterButton? filterButton;

  /// Additional actions that can be shown in the upper right corner
  final List<Widget>? actions;

  TableFilter({
    this.search,
    this.filterButton,
    this.actions,
  });
  // : assert(
  //         search == null && filterButton == null,
  //         'search or builder need be not null',
  //       );
}

/// Class that controls the filters header lookup field.
abstract class FilterHeaderSearch {
  /// When something is typed in input
  final Function(String value)? onChange;

  /// Text of hint input
  final String placeholder;

  FilterHeaderSearch({
    this.onChange,
    this.placeholder = '',
  });
}

/// Default filter button configuration class.
class FilterButton {
  /// Control display button
  final bool visible;

  /// Event when the button is clicked.
  final Function()? onClick;

  /// Background color of button.
  final Color color;

  /// Icon of button default.
  final IconData icon;

  /// Tip of button hover
  final String? tooltip;

  /// If you want, you can build your own custom widget.
  /// The returned widget must not contain click events, otherwise the
  /// component's default events may not work correctly.
  final Widget Function()? builder;

  FilterButton({
    this.visible = true,
    this.onClick,
    this.color = AIColors.white,
    this.icon = Icons.tune_outlined,
    this.builder,
    this.tooltip,
  });
}
