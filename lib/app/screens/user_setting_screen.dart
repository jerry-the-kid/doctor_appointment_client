import 'package:doctor_appointment_client/app/widgets/detail_avatar_image.dart';
import 'package:flutter/material.dart';

class UserSettingScreen extends StatefulWidget {
  const UserSettingScreen({super.key});

  @override
  State<UserSettingScreen> createState() => _UserSettingScreenState();
}

class _UserSettingScreenState extends State<UserSettingScreen> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 40),
      child: Column(
        children: [
          const DetailAvatarImage(),
          const SizedBox(
            height: 5,
          ),
          Text("Jane Cooper",
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(
            height: 5,
          ),
          Text(
            "jane.cooper@medicare.com",
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14),
          ),
          const SizedBox(height: 60),
          SizedBox(
            height: 350,
            child: ListView(
              children: [
                Row(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(width: 15),
                    const Text(
                      "About me",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.navigate_next))
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.calendar_month_outlined),
                    const SizedBox(width: 15),
                    const Text(
                      "My appointments",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.navigate_next))
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.assignment),
                    const SizedBox(width: 15),
                    const Text(
                      "Prescription",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.navigate_next))
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.science),
                    const SizedBox(width: 15),
                    const Text(
                      "Test Result",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          // context.push('/health');
                        },
                        icon: const Icon(Icons.navigate_next))
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(color: Colors.grey),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.notifications),
                    const SizedBox(width: 15),
                    const Text(
                      "Notifications",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Switch(
                        value: light,
                        onChanged: (bool value) => {
                              setState(() {
                                light = value;
                              })
                            })
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Icon(Icons.verified_user_outlined),
                    SizedBox(width: 15),
                    Text(
                      "Privacy and Security",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
