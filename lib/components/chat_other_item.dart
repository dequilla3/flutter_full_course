import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/user_avatar.dart';
import 'package:flutter_full_course/data/model/chat.dart';
import 'package:flutter_full_course/style/app_colors.dart';

class ChatOtherItem extends StatelessWidget {
  final Chat chat;
  const ChatOtherItem({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 16, top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserAvatar(
            size: 30,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${chat.user.firstname} ${chat.user.lastname}',
                      style:
                          const TextStyle(color: AppColors.black, fontSize: 9),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      chat.message,
                      style: const TextStyle(color: AppColors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
