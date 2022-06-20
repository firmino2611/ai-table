import 'package:ai_table_list/src/components/contracts/table_cell_interface.dart';
import 'package:ai_table_list/src/components/parts/ai_table_cell.dart';

/// Class control row of table
abstract class TableRowInterface {
  /// Cells of row
  final List<TableCellInterface> cells;

  /// When row clicked
  final Function(int index)? onClick;

  /// When row hovered
  final Function(int index)? onHover;

  TableRowInterface({
    required this.cells,
    this.onClick,
    this.onHover,
  });
}
