import 'package:ai_table_list/src/components/contracts/table_row_interface.dart';

/// Class implementations
/// Implments class responsible to generate informations of row.
class AITableRow extends TableRowInterface {
  AITableRow({
    /// Cells of row
    required super.cells,

    /// When row clicked
    super.onClick,

    /// When row hovered
    super.onHover,
  });
}
