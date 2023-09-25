// ignore: prefer_typing_uninitialized_variables
enum FromWho { me, his }

class Message {
  final String text;
  final String? image;
  final FromWho fromWho;

  Message({required this.text, this.image, required this.fromWho});
}
