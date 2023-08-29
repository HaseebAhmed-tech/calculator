import 'generic_list_vu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GenericListView<String, Widget>(
          widgets: _widgets,
          dataList: _items,
          onRefresh: () async {},
          onLoadMore: () async => false,
          onDelete: (context) => debugPrint('Item Deleted'),
        ),
      ),
    );
  }
}

List<Widget> _widgets = _items
    .map((item) => ListTile(
          title: Text(item),
          subtitle: Text(item),
          trailing: Text(item),
          onTap: () => debugPrint(item),
        ))
    .toList();
List<String> _items = ['Ali', 'Ahsan', 'Omair', 'Abdullah'];
