import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/image_placeholder.jpg',
                      width: 150,
                    ),
                  ),
                ),

                // const SizedBox(height: 150),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton.filled(
                        onPressed: () {}, icon: const Icon(Icons.edit)))
              ]),
            ),
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
                          onPressed: () {},
                          icon: const Icon(Icons.navigate_next))
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
                          onPressed: () {},
                          icon: const Icon(Icons.navigate_next))
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
                          onPressed: () {},
                          icon: const Icon(Icons.navigate_next))
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
                            context.push('/user/health');
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
      ),
    );
  }
}
