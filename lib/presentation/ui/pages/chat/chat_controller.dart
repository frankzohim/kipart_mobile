import 'package:flutter/material.dart';
import 'package:ki_part/data/models/chat.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {

  final List<ChatModel> chatUsers = [
    ChatModel(name:"General Voyages",messageText: "Votre départ dans 30 min",imageURL: "images/userImage1.jpeg", time: "Maintenant"),
    ChatModel(name:"KiPART", messageText: "Mot de passe mise à jour", imageURL: "images/userImage2.jpeg", time: "Hier"),
    ChatModel(name: "KiPART", messageText: "Ticket payé avec succès", imageURL: "images/userImage3.jpeg", time: "20 Jan"),
    ChatModel(name: "Buca Voyages", messageText: "Embarquement dans 15 min", imageURL: "images/userImage4.jpeg", time: "28 Déc"),
    ChatModel(name: "Touristique Voyages", messageText: "Vous êtes bien arrivées", imageURL: "images/userImage5.jpeg", time: "23 Déc"),
    ChatModel(name: "Finex", messageText: "Colis retiré", imageURL: "images/userImage6.jpeg", time: "17 Nov"),
    ChatModel(name: "Global Voyage", messageText: "Tickets encore disponible", imageURL: "images/userImage7.jpeg", time: "24 Oct"),
    ChatModel(name: "Buca Voyages", messageText: "Colis envoyé", imageURL: "images/userImage8.jpeg", time: "18 Sep"),
  ];

  @override
  void onReady() {
    super.onReady();
  }

  @override
  onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
