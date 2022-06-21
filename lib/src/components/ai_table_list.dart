import 'package:ai_table_list/src/components/contracts/table_cell_interface.dart';
import 'package:ai_table_list/src/components/contracts/table_filter.dart';
import 'package:ai_table_list/src/components/contracts/table_header_interface.dart';
import 'package:ai_table_list/src/components/contracts/table_row_interface.dart';
import 'package:ai_table_list/src/utils/components/ai_icon_button.dart';
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
                  child: widget.filter?.search?.builder != null
                      ? widget.filter!.search!.builder!()
                      : AITextField(
                          placeholder: widget.filter?.search?.placeholder ?? '',
                          onChange: widget.filter?.search?.onChange,
                          sufixIcon: const Icon(
                            Icons.search,
                            color: AIColors.black,
                          ),
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
                ..._validateShowActions,
              ],
            ),
          ),
        ),
        // =========================  HEADER ==============================  //
        Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          decoration: Constants.boxDecoration(color: widget.header.background),
          child: Row(children: _builderHeader),
        ),
        // ==========================  ROWS ===============================  //
        ..._builderRows.getRange(0, widget.settings?.limitePerPage ?? 10),
        // ====================== PAGINATE ================================= //
        // todo: coming son...
      ],
    );
  }

  get _validateShowActions {
    if (widget.filter?.actions != null) {
      return widget.filter!.actions;
    }
    return [];
  }

  get _builderHeader {
    final headers = <Widget>[];

    for (TableHeaderCell head in widget.header.columns) {
      final widthScreen = MediaQuery.of(context).size.width;
      final cell = Expanded(
        flex: 1,
        child: Align(
          alignment: head.align,
          child: head.child,
        ),
      );
      if (widthScreen > 400) {
        headers.add(cell);
      } else if (head.visibleMobile) {
        headers.add(cell);
      }
    }

    return headers;
  }

  /// Validate content of button filters
  get _validateContent {
    // if a builder custom be received
    if (widget.filter?.filterButton != null &&
        widget.filter?.filterButton?.builder != null) {
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
      final cells = <Widget>[];
      final widthScreen = MediaQuery.of(context).size.width;

      for (TableCellInterface cell in row.cells) {
        final cellWidget = Expanded(
          flex: 1,
          child: Align(
            alignment: cell.align,
            child: cell.child,
          ),
        );

        final head = widget.header.columns[row.cells.indexOf(cell)];

        if (widthScreen > 400) {
          cells.add(cellWidget);
        } else if (head.visibleMobile) {
          cells.add(cellWidget);
        }
      }

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
            decoration: Constants.boxDecoration(
              color: widget.settings?.rowBackground,
            ),
            child: Row(
              children: cells,
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
  final int limitePerPage;

  /// Background colors rows
  final Color rowBackground;

  TableSettings({
    this.showFilters = true,
    this.limitePerPage = 10,
    this.rowBackground = AIColors.white,
  });
}
