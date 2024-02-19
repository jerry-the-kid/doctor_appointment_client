import 'package:doctor_appointment_client/app/widgets/no_item_note.dart';
import 'package:doctor_appointment_client/app/widgets/primary_full_btn.dart';
import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:doctor_appointment_client/constants/helpers.dart';
import 'package:doctor_appointment_client/data/models/card_model.dart';
import 'package:doctor_appointment_client/providers/booking_provider.dart';
import 'package:doctor_appointment_client/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    var bookingProvider = context.watch<BookingProvider>();
    var bookingTime = Helpers().combineDateTimeAndTimeString(
        bookingProvider.selectedDate, bookingProvider.selectedHour);

    var bookingTimeString =
        "${Helpers().formattedDate(newPattern: "HH:mm", dateTime: bookingTime)} - ${Helpers().formattedDate(newPattern: "HH:mm", dateTime: bookingTime.add(const Duration(hours: 1)))}";

    var cards = context.watch<UserProvider>().currentUser!.cards;

    return Scaffold(
      appBar: AppBar(title: const Text("Payment Method")),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: PrimaryFullBtn(
          title: 'Reserved booking for 250,000 VND',
          onPressed: () {
            context.replace(
              Uri(
                path: '/appNotify',
                queryParameters: {
                  'svgSrc': 'assets/images/trans_done.svg',
                  'title': 'Booking successfully !!'
                },
              ).toString(),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Padding(
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
                        "SaiGon General Hospital: ${bookingProvider.doctor!.specialistIn}",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: DetailInfo(
                              label: "Date",
                              // info: "10.05.2023",
                              info: Helpers().formattedDate(
                                  newPattern: 'dd.MM.yyyy',
                                  dateTime: context
                                      .watch<BookingProvider>()
                                      .selectedDate),
                            ),
                          ),
                          Expanded(
                            child: DetailInfo(
                              label: "Time",
                              // info: "13:00 - 14:00",
                              info: bookingTimeString,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: DetailInfo(
                              label: "Doctor",
                              info:
                                  "${bookingProvider.doctor!.title} ${bookingProvider.doctor!.name}",
                            ),
                          ),
                          Expanded(
                            child: DetailInfo(
                              label: "Department",
                              info:
                                  "Phòng ban ${bookingProvider.doctor!.specialistIn}",
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
                    onPressed: () {
                      context.push('/payments/add');
                    },
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
              const SizedBox(
                height: 10,
              ),
              if (cards == null || cards.isEmpty)
                const NoItemNote(
                  message: "There is no saved cards. Please add new card",
                ),
              if (cards != null) SelectedCard(cards: cards),
              const SizedBox(
                height: 10,
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
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
      ),
    );
  }
}

class SelectedCard extends StatefulWidget {
  const SelectedCard({super.key, required this.cards});

  final List<CardModel> cards;

  @override
  State<SelectedCard> createState() => _SelectedCardState();
}

class _SelectedCardState extends State<SelectedCard> {
  int selectedCardIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        itemBuilder: ((context, index) => Column(children: [
              OptionTile<int>(
                label: Helpers().addSpacesEveryIntervalCharacter(
                    widget.cards[index].cardNumber),
                value: index,
                groupValue: selectedCardIndex,
                onChanged: (value) {
                  context
                      .read<BookingProvider>()
                      .setCard(card: widget.cards[value!]);

                  setState(() {
                    selectedCardIndex = value;
                  });
                },
              ),
              const SizedBox(
                height: 8,
              ),
            ])),
        itemCount: widget.cards.length,
      ),
    );
  }
}

class OptionTile<T> extends StatelessWidget {
  const OptionTile(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      required this.label});

  final T value;
  final T groupValue;
  final void Function(T?)? onChanged;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Radio(value: value, groupValue: groupValue, onChanged: onChanged),
        ],
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
