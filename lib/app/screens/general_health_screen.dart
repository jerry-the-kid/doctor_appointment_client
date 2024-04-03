import 'package:doctor_appointment_client/app/widgets/no_item_note.dart';
import 'package:doctor_appointment_client/app/widgets/table_cell_custom.dart';
import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:doctor_appointment_client/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

List<String> subsystems = [
  'Tuần hoàn',
  'Hô hấp',
  'Tiêu hóa',
  'Thận - tiết niệu',
  'Cơ xương khớp',
  'Thần kinh',
  'Tâm Thần'
];

class GeneralHealthScreen extends StatelessWidget {
  const GeneralHealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var user = context.read<UserProvider>().currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text('General Health')),
      body: SingleChildScrollView(
        child: !(user?.isFirstCheckup ?? false)
            ? Column(
                children: [
                  const NoItemNote(message: "No general health report found!"),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        context.push("/doctors/AUdabJNMbsIRQUZBdMGK");
                      },
                      child: const Text("Booking health checkup"))
                ],
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                            TableCellCustom(
                                content: "Nội dung khám", isTitle: true),
                            TableCellCustom(
                                content: 'Phân loại', isTitle: true),
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
                            TableCellCustom(
                                content: "Nội dung khám", isTitle: true),
                            TableCellCustom(
                                content: 'Phân loại', isTitle: true),
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
                            TableCellCustom(
                                content: "Nội dung khám", isTitle: true),
                            TableCellCustom(
                                content: 'Phân loại', isTitle: true),
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
                            TableCellCustom(
                                content: "Nội dung khám", isTitle: true),
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
                            TableCellCustom(
                                content: "Các bệnh về mắt (nếu có)"),
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
                            TableCellCustom(
                                content: "Nội dung khám", isTitle: true),
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
                            TableCellCustom(
                                content: "Nội dung khám", isTitle: true),
                            TableCellCustom(
                                content: 'Phân loại', isTitle: true),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCellCustom(content: "Phân Loại"),
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
