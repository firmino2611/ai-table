import 'package:ai_table_list/src/components/contracts/table_filter.dart';
import 'package:ai_table_list/src/components/contracts/table_header_interface.dart';
import 'package:ai_table_list/src/components/contracts/table_row_interface.dart';
import 'package:ai_table_list/src/utils/components/ai_icon_button.dart';
import 'package:ai_table_list/src/utils/components/ai_paginate.dart';
import 'package:ai_table_list/src/utils/components/ai_text_field.dart';
import 'package:ai_table_list/src/utils/styles/ai_colors.dart';
import 'package:ai_table_list/src/utils/styles/ai_input_style.dart';
import 'package:ai_table_list/src/utils/styles/constants.dart';
import 'package:flutter/material.dart';

/// Component main of table.
/// Receive the rows and header properties.
class AITableList extends StatefulWidget {
  const AITableList({
    Key? key,
    required this.rows,
    required this.header,
    this.filter,
    this.settings,
  }) : super(key: key);

  /// The rows of table
  final List<TableRowInterface> rows;

  /// Header columns
  final TableHedaerInterface header;

  /// Filter default
  final TableFilter? filter;

  /// Some settings of table
  final TableSettings? settings;

  @override
  State<AITableList> createState() => _AITableListState();
}

class _AITableListState extends State<AITableList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ======================= FILTER HEADER =========================== //
        /// Component to add filter and others actions
        Visibility(
          visible: widget.settings?.showFilters ?? true,
          child: Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            decoration: Constants.boxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: AITextField(
                    placeholder: widget.filter?.search?.placeholder ?? '',
                    onChange: widget.filter?.search?.onChange,
                  ),
                ),
                Visibility(
                  visible: widget.filter?.filterButton?.visible ?? true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Tooltip(
                      message: widget.filter?.filterButton?.tooltip ?? '',
                      child: _validateContent,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),

        // ====================== . FILTER HEADER =========================  //

        // =========================  HEADER ==============================  //
        Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          decoration: Constants.boxDecoration(color: widget.header.background),
          child: Row(
            children: widget.header.columns.map<Widget>((head) {
              return Expanded(
                flex: 1,
                child: Align(
                  alignment: head.align,
                  child: head.child,
                ),
              );
            }).toList(),
          ),
        ),
        // ========================= . HEADER  ============================  //

        // ==========================  ROWS ===============================  //
        ..._builderRows,
        // ========================== . ROWS  =============================  //

        // ====================== PAGINATE ================================= //
        // todo: coming son...
        // ==================== . PAGINATE ================================= //
      ],
    );
  }

  /// Validate content of button filters
  get _validateContent {
    // if a builder custom be received
    if (widget.filter?.filterButton != null &&
        widget.filter?.filterButton!.builder != null) {
      return widget.filter?.filterButton!.builder!();
    }

    return AIIconButton(
      icon: widget.filter?.filterButton?.icon ?? Icons.tune_outlined,
      onPressed: widget.filter?.filterButton?.onClick,
      size: HeadingSize.h4,
      iconColor: AIColors.white,
      backgroundColor: widget.filter?.filterButton?.color ?? AIColors.blue,
    );
  }

  /// Generate rows of table
  List<Widget> get _builderRows {
    return widget.rows.map((row) {
      return FocusableActionDetector(
        onShowHoverHighlight: (focus) {
          if (row.onHover != null) row.onHover!(widget.rows.indexOf(row));
        },
        child: GestureDetector(
          onTap: () {
            if (row.onClick != null) row.onClick!(widget.rows.indexOf(row));
          },
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            decoration: Constants.boxDecoration(),
            child: Row(
              children: row.cells.map((cell) {
                return Expanded(
                  flex: 1,
                  child: Align(
                    alignment: cell.align,
                    child: cell.child,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      );
    }).toList();
  }
}

/// Class controle settings of table
class TableSettings {
  /// Control display filter
  final bool showFilters;

  /// Control limit items per page
  final int limitePrePage;

  TableSettings({
    this.showFilters = true,
    this.limitePrePage = 10,
  });
}
