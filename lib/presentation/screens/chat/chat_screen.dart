import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://media.licdn.com/dms/image/v2/C4E03AQEiFdRmjPPvgw/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1516847289540?e=2147483647&v=beta&t=wzzR0yddHfIYjHhx53WrpZ3TYsVkR-Mq-zKLMmD2baE'),
          ),
        ),
        title: const Text('Mi Amor ❤️'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
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
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble(message: message)
                    : MyMessageBubble(message: message);
                },
                itemCount: chatProvider.messageList.length,
              )
            ),
            // Caja de texto
            MessageFieldBox(
              // onValue: (value) => chatProvider.sendMessage(value),
              //The next line do the same work of the upper line
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}