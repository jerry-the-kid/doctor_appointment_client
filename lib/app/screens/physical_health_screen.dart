import 'package:doctor_appointment_client/app/widgets/table_cell_custom.dart';
import 'package:flutter/material.dart';

class PhysicalHealthScreen extends StatelessWidget {
  const PhysicalHealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Physical Health")),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Khám thể lực",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 20)),
            const SizedBox(
              height: 15,
            ),
            Table(
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
                    TableCellCustom(content: "Chiều cao"),
                    TableCellCustom(content: '175 cm'),
                  ],
                ),
                TableRow(
                  children: [
                    TableCellCustom(content: "Cân nặng"),
                    TableCellCustom(content: '53 kg'),
                  ],
                ),
                TableRow(
                  children: [
                    TableCellCustom(content: "Chỉ số BMI"),
                    TableCellCustom(content: '...'),
                  ],
                ),
                TableRow(
                  children: [
                    TableCellCustom(content: "Mạch"),
                    TableCellCustom(content: '80 lần/phút'),
                  ],
                ),
                TableRow(
                  children: [
                    TableCellCustom(content: "Huyết áp"),
                    TableCellCustom(content: '130/80 mmHg'),
                  ],
                ),
              ],
            )
          ]),
        ));
  }
}
