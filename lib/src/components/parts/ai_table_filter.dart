import 'package:ai_table_list/src/components/contracts/table_filter.dart';

/// Class of filters table
class AITableFilter extends TableFilter {
  AITableFilter({
    /// Control widget of search default
    super.actions,

    /// Allows the construction of a custom input
    super.filterButton,

    /// Additional actions that can be shown in the upper right corner
    super.search,
  });
}

/// Class that controls the filters header lookup field.
class AIFilterHeaderSearch extends FilterHeaderSearch {
  AIFilterHeaderSearch({
    /// When something is typed in input
    super.onChange,

    /// Text of hint input
    super.placeholder,
  });
}
