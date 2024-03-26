import 'package:doctor_appointment_client/app/widgets/table_cell_custom.dart';
import 'package:doctor_appointment_client/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

double calculateBMI(int weight, int height) {
  double bmi = weight / (height * height);

  return bmi;
}

class PhysicalHealthScreen extends StatelessWidget {
  const PhysicalHealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserProvider>();

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
              children: [
                const TableRow(
                  children: [
                    TableCellCustom(content: "Nội dung khám", isTitle: true),
                    TableCellCustom(content: 'Kết quả', isTitle: true),
                  ],
                ),
                TableRow(
                  children: [
                    const TableCellCustom(content: "Chiều cao"),
                    TableCellCustom(content: '${user.currentUser?.height} cm'),
                  ],
                ),
                TableRow(
                  children: [
                    const TableCellCustom(content: "Cân nặng"),
                    TableCellCustom(content: '${user.currentUser?.weight} kg'),
                  ],
                ),
                const TableRow(
                  children: [
                    TableCellCustom(content: "Chỉ số BMI"),
                    TableCellCustom(content: '20.1'),
                  ],
                ),
                const TableRow(
                  children: [
                    TableCellCustom(content: "Mạch"),
                    TableCellCustom(content: '80 lần/phút'),
                  ],
                ),
                const TableRow(
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
