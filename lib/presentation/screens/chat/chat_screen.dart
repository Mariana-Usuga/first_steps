import 'package:first_steps/presentation/widgets/chat/his_messages_bublle.dart';
import 'package:first_steps/presentation/widgets/chat/my_message_bubble.dart';
import 'package:first_steps/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://d26oc3sg82pgk3.cloudfront.net/files/media/edit/image/33891/square_thumb%402x.jpg'),
            ),
          ),
          title: const Text('Mi amor'),
        ),
        body: _ChatView());
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return (index % 2 == 0)
                    ? const HerMessageBubble()
                    : const MyMessageBubble();
              },
            )),
            MessageFieldBox()
          ],
        ),
      ),
    );
  }
}
