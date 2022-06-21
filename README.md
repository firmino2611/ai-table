### This is a simple package to create a table that looks like a list of items. Soon we will add more features in order to make it more useful to the community.
## Coming Son

- Layout version mobile
- Checked options
- Paginate component
- Builder text field custom

## Features

#### Rows

Defines table rows. Here you have the freedom to build the cell the way you want, as it is built from widgets.

```dart
AITableRow(
    onClick: (index) {},
    cells: [
        AITableCell(child: Text('#123')),
        AITableCell(child: Text('Mickey')),
        AITableCell(child: Text('34.039')),
        AITableCell(
            align: Alignment.centerRight,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                    child: Text('delete'),
                    onPressed: () {},
                ),
            ),
        ),
    ],
),
```

##### [TableRowInterface] - AITableRow

```dart
/// Cells of row
final List<TableCellInterface> cells;

/// When row clicked
/// [index] row clicked
final Function(int index)? onClick;

/// When row hovered
/// [index] row clicked
final Function(int index)? onHover;
```

##### [TableCellInterface] - AITableCell

```dart
/// Content of cell
final Widget child;

/// Aligmento content cell
final Alignment align;
```

#### Header

Here you specify some definitions for the table header.

```dart
 AITableHeader(
    background: Colors.grey.shade200,
    columns: [
        AITableHeaderCell(
            child: Text(
                'ID',
                style: TextStyle(fontWeight: FontWeight.bold),
            ),
        ),
        AITableHeaderCell(
            child: Text(
                'NAME',
                style: TextStyle(fontWeight: FontWeight.bold),
            ),
        ),
        AITableHeaderCell(
            child: Text(
                'BALANCE',
                style: TextStyle(fontWeight: FontWeight.bold),
            ),
        ),
        AITableHeaderCell(
            child: Text(
                'ACTIONS',
                style: TextStyle(fontWeight: FontWeight.bold),
            ),
            align: Alignment.centerRight,
        ),
    ],
),
```

##### [TableHedaerInterface] - AITableHeader

```dart
/// Columns of header table
final List<TableHeaderCell> columns;

/// Background color of row
final Color background;
```

##### [TableHeaderCell] - AITableHeaderCell

```dart
/// Content of cell
final Widget child;

/// Aligment of content cell
final Alignment align;
```

#### Filter

We thought about adding a default filters feature to speed up your development. You can choose to show it or not and you can also customize some properties of this filter.

```dart
AITableFilter(
    filterButton: FilterButton(
        color: Colors.red,
        icon: Icons.abc,
        tooltip: 'Filters',
        visible: true,
        onClick: () {},
        builder: () {
           return Icon(Icons.dangerous);
        },
    ),
    search: AIFilterHeaderSearch(
        placeholder: 'Search..',
        onChange: (val) {},
    ),
    actions: []
)
```

##### [TableFilter] - AITableFilter

```dart
/// Control widget of search default
final FilterHeaderSearch? search;

/// Allows the construction of a custom input
final FilterButton? filterButton;

/// Additional actions that can be shown in the upper right corner
final List<Widget>? actions;
```

##### FilterButton

```dart
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
```

##### [FilterHeaderSearch] - AIFilterHeaderSearch

```dart
/// When something is typed in input
final Function(String value)? onChange;

/// Text of hint input
final String placeholder;
```

## Getting started

```dart
import 'package:ai_table_list/ai_table_list.dart';
```

## Usage

See the example available
