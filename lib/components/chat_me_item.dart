import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/user_avatar.dart';
import 'package:flutter_full_course/data/model/chat.dart';
import 'package:flutter_full_course/style/app_colors.dart';

class ChatMeItem extends StatelessWidget {
  final Chat chat;
  const ChatMeItem({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 30, top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
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
          const SizedBox(width: 8),
          const UserAvatar(
            size: 30,
          )
        ],
      ),
    );
  }
}
