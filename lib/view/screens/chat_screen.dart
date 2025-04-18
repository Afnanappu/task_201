import 'package:flutter/material.dart';
import 'package:task_201/core/app_colors.dart';
import 'package:task_201/models/chat_model.dart';
import 'package:task_201/view/widgets/chat_app_bar.dart';
import 'package:task_201/view/widgets/chat_body_list_widget.dart';
import 'package:task_201/view/widgets/chat_bottom_bar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(),
      body: ChatBodyListWidget(),
      backgroundColor: Color(0xFFE9F0F9),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: AppColors.primaryColorB,
          onPressed: () {},
          child: CircleAvatar(
            child: Center(child: Image.asset('assets/chat_logo.png')),
          ),
        ),
      ),
      bottomNavigationBar: ChatBottomBar(),
    );
  }
}

final chatDataList = [
  ChatModel(
    message:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took.",
    type: 'receive',
  ),

  ChatModel(message: "Lorem Ipsum is simply dummy ", type: 'sent'),

  ChatModel(message: "Lorem Ipsum is simply dummy", type: 'receive'),
  ChatModel(
    message:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took.",
    type: 'sent',
  ),
];
