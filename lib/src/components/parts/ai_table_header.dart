import 'package:ai_table_list/src/components/contracts/table_header_interface.dart';

/// Control cell of header
class AITableHeaderCell extends TableHeaderCell {
  AITableHeaderCell({
    /// Content of cell
    required super.child,

    /// Aligment of content cell
    super.align,
  });
}

/// Class header of table
class AITableHeader extends TableHedaerInterface {
  AITableHeader({
    /// Columns of header table
    required super.columns,

    /// Background color of row
    super.background,
  });
}
