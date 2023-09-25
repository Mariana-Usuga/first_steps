import 'package:first_steps/domain/entities/message.dart';
import 'package:flutter/material.dart';

class HisMessageBubble extends StatelessWidget {
  final Message message;

  const HisMessageBubble({super.key, required this.message});

  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: TextStyle(color: Colors.white),
            ),
          )),
      const SizedBox(
        height: 5,
      ),
      _ImageBubble(message.image!),
      const SizedBox(height: 10)
    ]);
  }
}

class _ImageBubble extends StatelessWidget {
  final String image;

  const _ImageBubble(this.image);

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(image,
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover, loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: const Text('Mi amor esta enviando un mensaje'));
      }),
    );
  }
}
