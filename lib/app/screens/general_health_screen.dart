import 'package:flutter/material.dart';

List<String> subsystems = [
  'Tuần hoàn',
  'Hô hấp',
  'Tiêu hóa',
  'Thận - tiết niệu',
  'Cơ xương khớp',
  'Thần kinh',
  'Thâm Thần'
];

class GeneralHealthScreen extends StatelessWidget {
  const GeneralHealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('General Health')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nội Khoa",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 20)),
              const SizedBox(
                height: 15,
              ),
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),
                },
                border: TableBorder.all(),
                children: [
                  const TableRow(
                    children: [
                      TableCellCustom(content: "Nội dung khám", isTitle: true),
                      TableCellCustom(content: 'Phân loại', isTitle: true),
                    ],
                  ),
                  ...subsystems.map(
                    (data) => TableRow(
                      children: [
                        TableCellCustom(content: data),
                        const TableCellCustom(content: 'N/A'),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text("Ngoại Khoa",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 20)),
              const SizedBox(
                height: 15,
              ),
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),
                },
                border: TableBorder.all(),
                children: const [
                  TableRow(
                    children: [
                      TableCellCustom(content: "Nội dung khám", isTitle: true),
                      TableCellCustom(content: 'Phân loại', isTitle: true),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCellCustom(content: "Ngoại khoa"),
                      TableCellCustom(content: 'N/A'),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text("Sản phụ khoa",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 20)),
              const SizedBox(
                height: 15,
              ),
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),
                },
                border: TableBorder.all(),
                children: const [
                  TableRow(
                    children: [
                      TableCellCustom(content: "Nội dung khám", isTitle: true),
                      TableCellCustom(content: 'Phân loại', isTitle: true),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCellCustom(content: "Sản phụ"),
                      TableCellCustom(content: 'N/A'),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text("Mắt",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 20)),
              const SizedBox(
                height: 15,
              ),
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),
                },
                border: TableBorder.all(),
                children: const [
                  TableRow(
                    children: [
                      TableCellCustom(content: "Nội dung khám", isTitle: true),
                      TableCellCustom(content: 'Kết quả', isTitle: true),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCellCustom(content: "Không kính"),
                      TableCellCustom(
                          content: 'Mắt phải: 10/10, Mắt trái: 10/10'),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCellCustom(content: "Các bệnh về mắt (nếu có)"),
                      TableCellCustom(content: 'N/A'),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCellCustom(content: "Có kính"),
                      TableCellCustom(content: 'N/A'),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCellCustom(content: "Phân loại"),
                      TableCellCustom(content: '2'),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text("Răng Hàm Mặt",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 20)),
              const SizedBox(
                height: 15,
              ),
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),
                },
                border: TableBorder.all(),
                children: const [
                  TableRow(
                    children: [
                      TableCellCustom(content: "Nội dung khám", isTitle: true),
                      TableCellCustom(content: 'Kết quả', isTitle: true),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCellCustom(content: "Hàm trên"),
                      TableCellCustom(content: 'N/A'),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCellCustom(content: "Hàm dưới"),
                      TableCellCustom(content: 'N/A'),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCellCustom(
                          content: "Các bệnh về Răng Hàm Mặt (nếu có)"),
                      TableCellCustom(content: 'N/A'),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCellCustom(content: "Phân loại"),
                      TableCellCustom(content: '1'),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text("Da liễu",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 20)),
              const SizedBox(
                height: 15,
              ),
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),
                },
                border: TableBorder.all(),
                children: const [
                  TableRow(
                    children: [
                      TableCellCustom(content: "Nội dung khám", isTitle: true),
                      TableCellCustom(content: 'Phân loại', isTitle: true),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCellCustom(content: "Sản phụ"),
                      TableCellCustom(content: 'N/A'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
