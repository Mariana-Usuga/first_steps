import 'package:first_steps/domain/entities/message.dart';
import 'package:first_steps/presentation/providers/chat_provider.dart';
import 'package:first_steps/presentation/widgets/chat/his_messages_bubble.dart';
import 'package:first_steps/presentation/widgets/chat/my_message_bubble.dart';
import 'package:first_steps/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];

                return (message.fromWho == FromWho.his)
                    ? HisMessageBubble(message: message)
                    : MyMessageBubble(message: message);
              },
            )),
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
              /*onValue: (value) {
                chatProvider.sendMessage(value);
              },*/
            )
          ],
        ),
      ),
    );
  }
}
