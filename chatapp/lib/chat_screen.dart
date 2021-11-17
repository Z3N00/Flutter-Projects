import 'package:chatapp/chat_message.dart';
import 'package:flutter/material.dart';
import 'chat_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}



class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];


  void _handleSubmitted(String text){
    _textController.clear();
    ChatMessage message= ChatMessage(text: text);
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _textComposerWidget(){
    return IconTheme(
      data: const IconThemeData(
        color: Colors.blueGrey
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child:  Row(
          children: [
            Flexible(

                child: TextField(

                decoration: const InputDecoration.collapsed(hintText: "Send a message", fillColor: Colors.red),
                controller: _textController,
                onSubmitted: _handleSubmitted,
            ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: ()=>_handleSubmitted(_textController.text),
              )
            )
            ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(child: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          reverse: true,
          itemBuilder: (_, int index) => _messages[index],
          itemCount: _messages.length,
        )
        ),
        const Divider(height: 1.0),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textComposerWidget(),
        )
      ],
    );
  }
}


