import 'package:doctor_appointment_client/app/widgets/primary_full_btn.dart';
import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment Method")),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: PrimaryFullBtn(
          title: 'Proceed to Pay',
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              borderRadius: BorderRadius.circular(7),
              elevation: 5,
              child: Container(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Image.asset(
                        'assets/images/hospital.jpg',
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      "SaiGon General Hospital: Khám Nội Khoa #1",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: DetailInfo(
                            label: "Date",
                            info: "10.05.2023",
                          ),
                        ),
                        Expanded(
                          child: DetailInfo(
                            label: "Time",
                            info: "13:00 - 14:00",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: DetailInfo(
                            label: "Doctor",
                            info: "Dr. John Wilson",
                          ),
                        ),
                        Expanded(
                          child: DetailInfo(
                            label: "Department",
                            info: "Phòng ban Nội Khoa",
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Saved Cards',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 17),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_circle_outline_outlined,
                    size: 15,
                  ),
                  label: const Text(
                    "Add New Card",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 25),
              width: double.infinity,
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/empty.svg',
                    width: 70,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "There is no saved cards. Please add new card",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Other Ways To Pays',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: 17),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColors.gray_2),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  const Icon(Icons.credit_card),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Credit/Debit Card",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Radio(value: true, groupValue: true, onChanged: (value) {})
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailInfo extends StatelessWidget {
  final String label;
  final String info;

  const DetailInfo({super.key, required this.label, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.black54)),
        Text(
          info,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
