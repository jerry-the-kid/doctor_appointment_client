import 'dart:io';

import 'package:doctor_appointment_client/app/widgets/detail_avatar_image.dart';
import 'package:doctor_appointment_client/app/widgets/input.dart';
import 'package:doctor_appointment_client/app/widgets/primary_full_btn.dart';
import 'package:doctor_appointment_client/constants/helpers.dart';
import 'package:doctor_appointment_client/providers/user_provider.dart';
import 'package:doctor_appointment_client/services/auth_service.dart';
import 'package:doctor_appointment_client/services/file_service.dart';
import 'package:doctor_appointment_client/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as path;

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({super.key});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  bool isEdit = false;
  int imageWidgetKey = 0;
  File? selectFile;

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
                  onFileChange: (file) {
                    setState(() {
                      selectFile = file;
                    });
                  },
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
                UserDetailForm(
                    isEdit: isEdit,
                    selectFile: selectFile,
                    resetState: () {
                      setState(() {
                        isEdit = false;
                      });
                    })
              ],
            ),
          ),
        ));
  }
}

class UserDetailForm extends StatefulWidget {
  const UserDetailForm(
      {super.key,
      required this.isEdit,
      required this.selectFile,
      required this.resetState});

  final bool isEdit;
  final File? selectFile;
  final VoidCallback resetState;

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
    final ageController =
        TextEditingController(text: userProvider.currentUser!.age.toString());

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
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Row(children: [
              Expanded(
                child: Input(
                  controller: emailController,
                  enabled: widget.isEdit,
                  label: 'Email',
                  placeholder: 'Your email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!Helpers().isStringEmail(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Input(
                  controller: ageController,
                  enabled: widget.isEdit,
                  label: 'Age',
                  placeholder: 'Your age',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    } else if (!Helpers().isAllNumbers(value)) {
                      return 'Please enter a valid age';
                    }
                    return null;
                  },
                ),
              ),
            ]),
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
                  inputType: TextInputType.number,
                  placeholder: 'Your weight',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your weight";
                    } else if (!Helpers().isAllNumbers(value)) {
                      return 'Please enter a valid weight';
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
                    placeholder: "Your gender",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your gender";
                      } else if (!['male', 'female'].contains(value)) {
                        return 'Gender must be male or female';
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
            if (widget.isEdit)
              PrimaryFullBtn(
                  title: "Save",
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      Map<Object, Object?> data = {
                        'userName': nameController.text,
                        'email': emailController.text,
                        'gender': genderController.text,
                        'weight': int.parse(weightController.text),
                        'age': int.parse(ageController.text)
                      };

                      Helpers().handleFirebaseException(
                          context: context,
                          callBackFnc: () async {
                            await UserService().updateUser(
                                uid: Auth().currentUser!.uid, data: data);
                          },
                          successCallBack: () async {
                            if (widget.selectFile != null) {
                              var imageSrc =
                                  await FileService().uploadImageToFirebase(
                                widget.selectFile!,
                                Helpers().generateRandomKey() +
                                    path.extension(widget.selectFile!.path),
                              );
                              await UserService().updateUser(
                                  uid: Auth().currentUser!.uid,
                                  data: {'avatarImage': imageSrc});
                            }

                            final user = await Auth()
                                .getUserDocument(Auth().currentUser!.uid);
                            if (context.mounted) {
                              context
                                  .read<UserProvider>()
                                  .setCurrentUser(user: user!);
                              widget.resetState();
                            }
                          },
                          successMessage: "Updated Success");
                    }
                  })
          ],
        ));
  }
}
