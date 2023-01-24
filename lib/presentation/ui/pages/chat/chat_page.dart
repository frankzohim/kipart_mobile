import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ki_part/presentation/ui/pages/chat/chat_controller.dart';
import 'package:ki_part/presentation/widgets/chat_widget.dart';

class ChatPage extends GetWidget<ChatController> {
  const ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(title: Text("Vos messages"), ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                  ],
                ),
              ),

            ),
            Padding(
              padding: EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Rechercher...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.grey.shade100
                      )
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: controller.chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return ConversationList(
                  name: controller.chatUsers[index].name!,
                  messageText: controller.chatUsers[index].messageText!,
                  imageUrl: controller.chatUsers[index].imageURL!,
                  time: controller.chatUsers[index].time!,
                  isMessageRead: (index == 0 || index == 3)?true:false,
                );
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFFC98010),
        unselectedItemColor: Color(0xFFF8C200),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_work),
            label: "Promotions",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: "GeoMap",
          ),
        ],
      ),
    );
  }
}
