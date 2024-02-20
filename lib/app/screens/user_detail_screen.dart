import 'package:doctor_appointment_client/app/widgets/detail_avatar_image.dart';
import 'package:doctor_appointment_client/app/widgets/input.dart';
import 'package:doctor_appointment_client/app/widgets/primary_full_btn.dart';
import 'package:doctor_appointment_client/constants/helpers.dart';
import 'package:doctor_appointment_client/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({super.key});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  bool isEdit = false;
  int imageWidgetKey = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "About Me",
          ),
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {
                    isEdit = !isEdit;
                    imageWidgetKey += 1;
                  });
                },
                child: Text(isEdit ? "View" : "Edit"))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, bottom: 40),
            child: Column(
              children: [
                DetailAvatarImage(
                  isEdit: isEdit,
                  key: Key(imageWidgetKey.toString()),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(context.watch<UserProvider>().currentUser!.userName,
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  context.watch<UserProvider>().currentUser!.email,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 14),
                ),
                const SizedBox(height: 40),
                const SizedBox(
                  height: 20,
                ),
                UserDetailForm(isEdit: isEdit)
              ],
            ),
          ),
        ));
  }
}

class UserDetailForm extends StatefulWidget {
  const UserDetailForm({super.key, required this.isEdit});

  final bool isEdit;

  @override
  State<UserDetailForm> createState() => _UserDetailFormState();
}

class _UserDetailFormState extends State<UserDetailForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var userProvider = context.watch<UserProvider>();
    final nameController =
        TextEditingController(text: userProvider.currentUser!.userName);
    final emailController =
        TextEditingController(text: userProvider.currentUser!.email);
    final weightController = TextEditingController(
        text: userProvider.currentUser!.weight.toString());
    final genderController =
        TextEditingController(text: userProvider.currentUser!.gender);

    return Form(
        key: _formKey,
        child: Column(
          children: [
            Input(
              controller: nameController,
              enabled: widget.isEdit,
              label: 'Name',
              placeholder: 'Your Name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter card holder name';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Input(
              controller: emailController,
              enabled: widget.isEdit,
              label: 'Email',
              placeholder: 'Your email',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter card holder name';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                    child: Input(
                  controller: weightController,
                  label: "Weight",
                  enabled: widget.isEdit,
                  placeholder: 'MM/YY',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter cvv's expiry date";
                    } else if (!Helpers().isStringMMYYFormat(value)) {
                      return 'Invalid expiry date';
                    }
                    return null;
                  },
                )),
                const SizedBox(width: 20),
                Expanded(
                  child: Input(
                    controller: genderController,
                    label: "Gender",
                    enabled: widget.isEdit,
                    placeholder: "000",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter cvv number";
                      } else if (value.trim().length != 3) {
                        return 'CVV number must have 3 digits';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            if (widget.isEdit) PrimaryFullBtn(title: "Save", onPressed: () {})
          ],
        ));
  }
}
