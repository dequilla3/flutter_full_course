import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/app_text_field_expandable.dart';
import 'package:flutter_full_course/components/chat_me_item.dart';
import 'package:flutter_full_course/components/chat_other_item.dart';
import 'package:flutter_full_course/components/toolbar.dart';
import 'package:flutter_full_course/config/app_icons.dart';
import 'package:flutter_full_course/provider/app_repo.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppRepo>();
    final focusNode = FocusNode();
    final msgController = TextEditingController();

    return Scaffold(
      appBar: ToolBar(
          title:
              '${provider.selectedUserToChat?.firstname} ${provider.selectedUserToChat?.lastname}'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => focusNode.unfocus(),
              child: ListView.builder(
                reverse: true,
                itemCount: provider.chats.length,
                itemBuilder: (context, index) {
                  final chat = provider.chats.reversed.toList()[index];

                  if (chat.user.id == provider.user?.id) {
                    return ChatMeItem(chat: chat);
                  }
                  return ChatOtherItem(chat: chat);
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: AppTextFieldExpandable(
                    maxLines: 5,
                    minLines: 1,
                    hint: 'Type a message...',
                    controller: msgController,
                    focusNode: focusNode,
                  ),
                ),
                SizedBox(
                  height: 42,
                  child: IconButton(
                    onPressed: () {
                      focusNode.unfocus();
                      if (msgController.text.isNotEmpty) {
                        provider.sendMessage(msgController.text);
                      }
                    },
                    icon: SvgPicture.asset(
                      AppIcons.plane,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
