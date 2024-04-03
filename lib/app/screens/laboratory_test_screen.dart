import 'package:doctor_appointment_client/app/widgets/no_item_note.dart';
import 'package:doctor_appointment_client/app/widgets/table_cell_custom.dart';
import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:doctor_appointment_client/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LaboratoryTestScreen extends StatelessWidget {
  const LaboratoryTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var user = context.read<UserProvider>().currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text("Laboratory Test")),
      body: SingleChildScrollView(
        child: !(user?.isFirstCheckup ?? false)
            ? Column(
                children: [
                  const NoItemNote(message: "No laboratory report found!"),
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
                    Text("Miễn Dịch",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 20)),
                    const SizedBox(
                      height: 15,
                    ),
                    Table(
                      columnWidths: const {
                        0: FlexColumnWidth(2),
                        1: FlexColumnWidth(1),
                        2: FlexColumnWidth(1)
                      },
                      border: TableBorder.all(),
                      children: const [
                        TableRow(
                          children: [
                            TableCellCustom(
                                content: "Tên xét nghiệm", isTitle: true),
                            TableCellCustom(content: 'Kết quả', isTitle: true),
                            TableCellCustom(
                                content: 'Chỉ số bình thường', isTitle: true),
                            TableCellCustom(content: 'Đơn vị', isTitle: true),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCellCustom(content: "VDRL"),
                            TableCellCustom(content: 'NEG'),
                            TableCellCustom(content: 'NEGATIVE'),
                            TableCellCustom(content: ''),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCellCustom(content: "AgHBs"),
                            TableCellCustom(content: 'NEG (0.55)'),
                            TableCellCustom(content: 'NEG (COI < 1)'),
                            TableCellCustom(content: 'COI'),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCellCustom(content: "Anti HBs"),
                            TableCellCustom(
                                content: 'POS (18.88)', isTitle: true),
                            TableCellCustom(content: '0 - 10'),
                            TableCellCustom(content: 'IU/L'),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCellCustom(content: "Anti HCV"),
                            TableCellCustom(content: 'NEG (0.287)'),
                            TableCellCustom(content: 'NEG (COI < 1)'),
                            TableCellCustom(content: 'COI'),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text("Nước Tiểu",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 20)),
                    const SizedBox(
                      height: 15,
                    ),
                    Table(
                      columnWidths: const {
                        0: FlexColumnWidth(2),
                        1: FlexColumnWidth(1),
                        2: FlexColumnWidth(1)
                      },
                      border: TableBorder.all(),
                      children: const [
                        TableRow(
                          children: [
                            TableCellCustom(
                                content: "Tên xét nghiệm", isTitle: true),
                            TableCellCustom(content: 'Kết quả', isTitle: true),
                            TableCellCustom(
                                content: 'Chỉ số bình thường', isTitle: true),
                            TableCellCustom(content: 'Đơn vị', isTitle: true),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCellCustom(content: "Urobilinogen"),
                            TableCellCustom(
                                content: '17 umon/L', isTitle: true),
                            TableCellCustom(content: '< 17'),
                            TableCellCustom(content: 'umon/L'),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCellCustom(content: "Bilirubin"),
                            TableCellCustom(
                                content: '17 umon/L', isTitle: true),
                            TableCellCustom(content: '< 3.4'),
                            TableCellCustom(content: 'umon/L'),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCellCustom(content: "Ketone"),
                            TableCellCustom(content: 'NEG'),
                            TableCellCustom(content: '< 0.5'),
                            TableCellCustom(content: 'mmol/L'),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCellCustom(content: "Blood"),
                            TableCellCustom(content: 'neg'),
                            TableCellCustom(content: '< 5'),
                            TableCellCustom(content: 'Ery/uL'),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCellCustom(content: "Protein"),
                            TableCellCustom(content: '0.3 g/L'),
                            TableCellCustom(content: '< 0.1'),
                            TableCellCustom(content: 'g/L'),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCellCustom(content: "Nitrite"),
                            TableCellCustom(content: 'neg'),
                            TableCellCustom(content: 'Negative'),
                            TableCellCustom(content: 'umol/L'),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCellCustom(content: "Leucocytes"),
                            TableCellCustom(content: 'neg'),
                            TableCellCustom(content: '< 10'),
                            TableCellCustom(content: 'leuco/ul'),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCellCustom(content: "Glucose"),
                            TableCellCustom(content: 'neg'),
                            TableCellCustom(content: '< 0.84'),
                            TableCellCustom(content: 'mmol/L'),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCellCustom(content: "Specific Gravity"),
                            TableCellCustom(content: '1.030'),
                            TableCellCustom(content: '1.005 - 1.030'),
                            TableCellCustom(content: ''),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCellCustom(content: "pH"),
                            TableCellCustom(content: '<=6'),
                            TableCellCustom(content: '5.0 - 8.0'),
                            TableCellCustom(content: ''),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text("Huyết học",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 20)),
                    const SizedBox(
                      height: 15,
                    ),
                    Table(
                      columnWidths: const {
                        0: FlexColumnWidth(2),
                        1: FlexColumnWidth(1),
                        2: FlexColumnWidth(1)
                      },
                      border: TableBorder.all(),
                      children: const [
                        TableRow(
                          children: [
                            TableCellCustom(
                                content: "Tên xét nghiệm", isTitle: true),
                            TableCellCustom(content: 'Kết quả', isTitle: true),
                            TableCellCustom(
                                content: 'Chỉ số bình thường', isTitle: true),
                            TableCellCustom(content: 'Đơn vị', isTitle: true),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCellCustom(content: "WBC (Số lượng Bạch Cầu)"),
                            TableCellCustom(content: '6.20'),
                            TableCellCustom(content: '4.60 - 10.2'),
                            TableCellCustom(content: 'K - uL'),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCellCustom(content: "WBC (Số lượng Hồng Cầu)"),
                            TableCellCustom(content: '4.70'),
                            TableCellCustom(content: '4.04 - 6.13'),
                            TableCellCustom(content: 'M/uL'),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCellCustom(content: "PLT (Số lượng Tiểu Cầu)"),
                            TableCellCustom(content: '264'),
                            TableCellCustom(content: '142 - 424'),
                            TableCellCustom(content: 'M/uL'),
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
