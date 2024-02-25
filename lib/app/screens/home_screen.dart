import 'package:badges/badges.dart' as badges;
import 'package:doctor_appointment_client/app/widgets/doctor_list.dart';
import 'package:doctor_appointment_client/app/widgets/no_item_note.dart';
import 'package:doctor_appointment_client/app/widgets/upcoming_schedule_card.dart';
import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:doctor_appointment_client/data/models/booking_model.dart';
import 'package:doctor_appointment_client/data/models/user_model.dart';
import 'package:doctor_appointment_client/providers/refresh_provider.dart';
import 'package:doctor_appointment_client/providers/user_provider.dart';
import 'package:doctor_appointment_client/services/booking_service.dart';
import 'package:doctor_appointment_client/services/doctor_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserInfoHeader(
            userName: user.userName,
            imageSrc: user.avatarImage,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Today's Medicines",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                MedicineListTile(),
                SizedBox(width: 10),
                MedicineListTile(),
                MedicineListTile()
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const HeadingWithViewAll(
            title: "Upcoming Schedule",
          ),
          const SizedBox(
            height: 15,
          ),
          FutureBuilder(
              key: Key(context.watch<KeyRefreshProvider>().bookingKey),
              future: BookingService().getAllBookings(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.connectionState == ConnectionState.done &&
                    (snapshot.data == null || snapshot.data!.isEmpty)) {
                  return const NoItemNote(
                      message: "You don't have any upcoming schedule !");
                }

                var closestBooking =
                    findClosestBooking(snapshot.data!, DateTime.now());

                return UpcomingScheduleCard(
                    isActive: true, bookingModel: closestBooking);
              }),
          const SizedBox(
            height: 30,
          ),
          const HeadingWithViewAll(
            title: "Top Doctor",
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              height: 300,
              child: FutureBuilder(
                  future: DoctorService().getAllDoctors(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return DoctorList(doctors: snapshot.data!);
                    }

                    return const NoItemNote(
                        message: "Something went wrong. Please try again !");
                  })),
        ],
      ),
    );
  }
}

class HeadingWithViewAll extends StatelessWidget {
  final String title;

  const HeadingWithViewAll({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/doctors'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Column(children: [
            const Text("view all",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor)),
            const SizedBox(
                height: 4.0), // Adjust the height for the desired space
            Container(
              height: 1.5,
              width: 50, // Adjust the height of the underline
              color: AppColors.blue, // Set the underline color
            ),
          ])
        ],
      ),
    );
  }
}

class MedicineListTile extends StatelessWidget {
  const MedicineListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.access_time_sharp,
              size: 16,
            ),
            Text(
              " 02:00 PM ",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Text("Upcoming",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColors.blue))
          ],
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.fromLTRB(5, 10, 20, 10),
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(7.0), // Adjust the radius as needed
            color: AppColors.blue_bg, // Set the background color
          ),
          child: Row(
            children: [
              const Icon(
                Icons.medication_outlined,
                size: 35,
                color: AppColors.blue,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Zincovit CL",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    "2 table spoons, After meal",
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class UserInfoHeader extends StatelessWidget {
  final String userName;
  final String imageSrc;

  const UserInfoHeader(
      {super.key, required this.userName, required this.imageSrc});

  @override
  Widget build(BuildContext context) {
    var currentUser = context.watch<UserProvider>().currentUser;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                context.push('/user');
              },
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      currentUser == null ? imageSrc : currentUser.avatarImage),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hello",
                  style: TextStyle(color: AppColors.gray_2),
                ),
                Text(currentUser == null ? userName : currentUser.userName,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 18)),
              ],
            )
          ],
        ),
        badges.Badge(
          position: badges.BadgePosition.topStart(top: 10, start: 21),
          showBadge: false,
          child: IconButton(
              onPressed: () {
                context.push('/notification');
              },
              icon: const Icon(
                Icons.notifications,
                color: AppColors.primaryColor,
              )),
        )
      ],
    );
  }
}
