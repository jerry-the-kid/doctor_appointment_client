import 'package:flutter/material.dart';

class TableCellCustom extends StatelessWidget {
  final String content;
  final bool isTitle;

  const TableCellCustom({
    super.key,
    this.isTitle = false,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return TableCell(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(content,
          style: isTitle ? Theme.of(context).textTheme.titleMedium : null),
    ));
  }
}
