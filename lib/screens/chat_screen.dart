import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isInboxView = true; // Toggle between Inbox and Chat
  String? selectedUserName;
  String? selectedUserAvatar;

  final List<Map<String, String>> inboxMessages = [
    {
      'name': 'User 1',
      'lastMessage': 'Hi there! How are you?',
      'avatar': 'https://avatar.iran.liara.run/public/1',
      'time': '10:30 AM',
    },
    {
      'name': 'User 2',
      'lastMessage': 'Let’s catch up later!',
      'avatar': 'https://avatar.iran.liara.run/public/2',
      'time': '10:25 AM',
    },
    {
      'name': 'User 3',
      'lastMessage': 'Did you check the document?',
      'avatar': 'https://avatar.iran.liara.run/public/3',
      'time': 'Yesterday',
    },
    {
      'name': 'User 4',
      'lastMessage': 'Great meeting today!',
      'avatar': 'https://avatar.iran.liara.run/public/4',
      'time': '2 days ago',
    },
    {
      'name': 'User 5',
      'lastMessage': 'Let me know your thoughts.',
      'avatar': 'https://avatar.iran.liara.run/public/5',
      'time': '3 days ago',
    },
  ];

  final List<Map<String, String>> chatMessages = [
    {
      'sender': 'User',
      'message': 'Hi! How are you doing?',
      'time': '10:30 AM',
      'avatar': 'https://avatar.iran.liara.run/public/6',
    },
    {
      'sender': 'You',
      'message': 'I am doing great! What about you?',
      'time': '10:32 AM',
      'avatar': '',
    },
    {
      'sender': 'User',
      'message': 'I am fine as well. Let’s catch up soon!',
      'time': '10:34 AM',
      'avatar': 'https://avatar.iran.liara.run/public/6',
    },
  ];

  void openChat(String userName, String userAvatar) {
    setState(() {
      selectedUserName = userName;
      selectedUserAvatar = userAvatar;
      isInboxView = false;
    });
  }

  void goBackToInbox() {
    setState(() {
      isInboxView = true;
      selectedUserName = null;
      selectedUserAvatar = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isInboxView
          ? _buildInboxView()
          : _buildChatView(selectedUserName!, selectedUserAvatar!),
    );
  }

  Widget _buildInboxView() {
    return ListView.builder(
      itemCount: inboxMessages.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(inboxMessages[index]['avatar']!),
          ),
          title: Text(
            inboxMessages[index]['name']!,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(inboxMessages[index]['lastMessage']!),
          trailing: Text(
            inboxMessages[index]['time']!,
            style: TextStyle(color: Colors.grey),
          ),
          onTap: () {
            openChat(
              inboxMessages[index]['name']!,
              inboxMessages[index]['avatar']!,
            );
          },
        );
      },
    );
  }

  Widget _buildChatView(String userName, String userAvatar) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: chatMessages.length,
            itemBuilder: (context, index) {
              bool isSender = chatMessages[index]['sender'] == 'You';
              return Row(
                mainAxisAlignment:
                    isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isSender)
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        chatMessages[index]['avatar'] ?? userAvatar,
                      ),
                      radius: 20,
                    ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    constraints: BoxConstraints(maxWidth: 250),
                    decoration: BoxDecoration(
                      color: isSender
                          ? Colors.purple[300]
                          : Colors.grey[800], // Bubble colors
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft:
                            isSender ? Radius.circular(15) : Radius.zero,
                        bottomRight:
                            isSender ? Radius.zero : Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chatMessages[index]['message']!,
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Text(
                          chatMessages[index]['time']!,
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  if (isSender)
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://avatar.iran.liara.run/public/5', // Replace with sender's avatar if needed
                      ),
                      radius: 20,
                    ),
                ],
              );
            },
          ),
        ),
        _buildMessageInputField(),
      ],
    );
  }

  Widget _buildMessageInputField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      color: Colors.grey[900],
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message...',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.purple[300]),
            onPressed: () {
              // Handle send message logic
            },
          ),
        ],
      ),
    );
  }
}
