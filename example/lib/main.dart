// ignore_for_file: prefer_const_constructors

import 'package:ai_table_list/ai_table_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AITableList(
            settings: TableSettings(
              rowBackground: Colors.grey.shade100,
              limitePerPage: 12,
              showFilters: true,
            ),
            filter: AITableFilter(
              filterButton: FilterButton(
                color: Colors.red,
                icon: Icons.filter,
                tooltip: 'Filters',
                visible: true,
                onClick: () {},
                // builder: () {
                //   return Icon(Icons.search);
                // },
              ),
              search: AIFilterHeaderSearch(
                placeholder: 'Search..',
                onChange: (val) {},
                // builder: () {
                //   return TextField();
                // },
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Add item'),
                  ),
                ),
              ],
            ),
            header: AITableHeader(
              background: Colors.grey.shade200,
              columns: [
                AITableHeaderCell(
                  visibleMobile: true,
                  child: Text(
                    'ID',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                AITableHeaderCell(
                  visibleMobile: true,
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
                  visibleMobile: true,
                  child: Text(
                    'ACTIONS',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  align: Alignment.centerRight,
                ),
              ],
            ),
            rows: List.generate(
              20,
              (index) => AITableRow(
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
            ),
          ),
        ),
      ),
    );
  }
}
