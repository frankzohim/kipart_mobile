import 'package:flutter/cupertino.dart';

class ChatModel {
  String? name;
  String? messageText;
  String? imageURL;
  String? time;

  ChatModel(
      {@required this.name,
        @required this.messageText,
        @required this.imageURL,
        @required this.time});

  }
