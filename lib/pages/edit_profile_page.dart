import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/app_text_field.dart';
import 'package:flutter_full_course/components/toolbar.dart';
import 'package:flutter_full_course/components/user_avatar.dart';
import 'package:flutter_full_course/style/app_colors.dart';
import 'package:flutter_full_course/style/app_text.dart';

enum Gender { none, male, female, others }

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var gender = Gender.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ToolBar(title: "Edit Profile"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: UserAvatar(
                      size: 120,
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                              color: AppColors.primary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                          child: const Icon(
                            Icons.edit,
                            size: 18,
                            color: Colors.black,
                          )))
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              const AppTextField(hint: 'First Name'),
              const SizedBox(
                height: 16,
              ),
              const AppTextField(hint: 'Last Name'),
              const SizedBox(
                height: 16,
              ),
              const AppTextField(hint: 'Phone number'),
              const SizedBox(
                height: 16,
              ),
              const AppTextField(hint: 'Location'),
              const SizedBox(
                height: 16,
              ),
              const AppTextField(hint: 'Birthday'),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.only(left: 12, top: 6, right: 12),
                decoration: BoxDecoration(
                    color: AppColors.fieldColor,
                    borderRadius: const BorderRadius.all(Radius.circular(12))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gender',
                      style: AppText.body1.copyWith(fontSize: 12),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile(
                              visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity),
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Male'),
                              value: Gender.male,
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = Gender.male;
                                });
                              }),
                        ),
                        Expanded(
                          child: RadioListTile(
                              visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity),
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Female'),
                              value: Gender.female,
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = Gender.female;
                                });
                              }),
                        ),
                        Expanded(
                          child: RadioListTile(
                              visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity),
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Others'),
                              value: Gender.others,
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = Gender.others;
                                });
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
