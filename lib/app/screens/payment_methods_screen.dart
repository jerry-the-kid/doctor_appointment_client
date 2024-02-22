import 'package:doctor_appointment_client/app/widgets/dialog.dart';
import 'package:doctor_appointment_client/app/widgets/no_item_note.dart';
import 'package:doctor_appointment_client/app/widgets/primary_full_btn.dart';
import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:doctor_appointment_client/constants/helpers.dart';
import 'package:doctor_appointment_client/data/models/booking_model.dart';
import 'package:doctor_appointment_client/data/models/card_model.dart';
import 'package:doctor_appointment_client/providers/booking_provider.dart';
import 'package:doctor_appointment_client/providers/user_provider.dart';
import 'package:doctor_appointment_client/services/auth_service.dart';
import 'package:doctor_appointment_client/services/booking_service.dart';
import 'package:doctor_appointment_client/services/card_service.dart';
import 'package:doctor_appointment_client/services/user_service.dart';
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

    showDenyDialog(title, message) {
      showDialog(
          context: context,
          builder: (context) => MessageDialog(
                'info',
                title: title,
                message: message,
                primaryButtonText: "Cancel",
                primaryButtonCallback: () {
                  Navigator.pop(context, true);
                },
              ));
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Payment Method")),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: PrimaryFullBtn(
          title: 'Reserved booking for 250,000 VND',
          onPressed: () {
            var card = bookingProvider.card!;

            if (card.currentBalance < 250000) {
              showDenyDialog('Payment Deny',
                  "Your card has insufficient balance to process the payment.");
              return;
            } else if (Helpers().isBeforeToday(
                Helpers().parseShortDateString(card.expiredDate))) {
              showDenyDialog("Payment Deny", "Your card has expired ");
              return;
            }

            var doctor = context.read<BookingProvider>().doctor!;
            var currentUser = context.read<UserProvider>().currentUser!;

            var booking = BookingModel(
                selectedDate: bookingTime,
                userId: Auth().currentUser!.uid,
                doctorName: doctor.name,
                title: doctor.title,
                specialistIn: doctor.specialistIn,
                avatarUrl: doctor.avatarUrl,
                createdDate: DateTime.now());

            Helpers().handleFirebaseException(
                context: context,
                callBackFnc: () async {
                  int index = currentUser.cards!.indexWhere((item) =>
                      item.cardNumber == bookingProvider.card!.cardNumber);

                  if (index != -1) {
                    cards![index].currentBalance =
                        cards[index].currentBalance - 250000;

                    Map<String, dynamic> userData = currentUser.toJson();

                    userData['cards'] =
                        cards.map((card) => card.toJson()).toList();

                    await UserService().updateUser(
                      uid: Auth().currentUser!.uid,
                      data: userData,
                    );
                  }

                  await BookingService().createBooking(bookingModel: booking);

                  final user =
                      await Auth().getUserDocument(Auth().currentUser!.uid);
                  if (context.mounted) {
                    context.read<UserProvider>().setCurrentUser(user: user!);
                  }
                },
                successCallBack: () {
                  context.replace(
                    Uri(
                      path: '/appNotify',
                      queryParameters: {
                        'svgSrc': 'assets/images/trans_done.svg',
                        'title': 'Booking successfully !!'
                      },
                    ).toString(),
                  );
                });
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
  void initState() {
    super.initState();
    context.read<BookingProvider>().setCard(card: widget.cards[0]);
  }

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
