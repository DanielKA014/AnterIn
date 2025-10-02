import 'dart:async';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  final String driverName;
  final List<Map<String, String>> initialMessages;

  const MessageScreen({
    super.key,
    required this.driverName,
    required this.initialMessages,
  });

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _messages.addAll(widget.initialMessages);
  }

  void _handleSubmitted(String text) {
    if (text.isEmpty) return;
    _textController.clear();
    setState(() {
      _messages.add({"sender": "user", "text": text});
    });
    _scrollToBottom();
    _simulateDriverResponse(text);
  }

  void _simulateDriverResponse(String userMessage) {
    String response;
    if (userMessage.toLowerCase().contains("halo") || userMessage.toLowerCase().contains("hi")) {
      response = "Halo juga! Ada yang bisa saya bantu?";
    } else if (userMessage.toLowerCase().contains("dimana")) {
      response = "Saya sedang dalam perjalanan, sebentar lagi sampai.";
    } else if (userMessage.toLowerCase().contains("terima kasih")) {
      response = "Sama-sama, hati-hati di jalan ya!";
    } else {
      response = "Oke, saya terima pesannya.";
    }

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _messages.add({"sender": "driver", "text": response});
      });
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.driverName),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUser = message["sender"] == "user";
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blue[100] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      message["text"]!,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),
          _buildTextComposer(),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: const InputDecoration.collapsed(
                  hintText: "Kirim pesan"),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => _handleSubmitted(_textController.text),
            color: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}