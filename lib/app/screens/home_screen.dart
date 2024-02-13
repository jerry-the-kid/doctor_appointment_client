import 'package:badges/badges.dart' as badges;
import 'package:doctor_appointment_client/app/widgets/doctor_list.dart';
import 'package:doctor_appointment_client/app/widgets/upcoming_schedule_card.dart';
import 'package:doctor_appointment_client/constants/app_colors.dart';
import 'package:doctor_appointment_client/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final User? user = Auth().currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserInfoHeader(),
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
          const UpcomingScheduleCard(isActive: true),
          const SizedBox(
            height: 30,
          ),
          const HeadingWithViewAll(
            title: "Top Doctor",
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(height: 300, child: DoctorList())
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
  const UserInfoHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                context.push('/user');
              },
              child: const SizedBox(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/edward.jpg',
                  ),
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
                Text("Edward!",
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
