import 'package:first_steps/domain/entities/message.dart';
import 'package:first_steps/helpers/get_yes_no_answer.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();
  final hisResponse = String;

  List<Message> messageList = [
    Message(text: 'hola', fromWho: FromWho.me),
    Message(text: 'como estas', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      herReply(text);
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply(String text) async {
    final hisMessage = await getYesNoAnswer.getAnswer();
    messageList.add(hisMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
