import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class Message extends Equatable {
  final int id;
  final int senderId;
  final int receiverId;
  final String message;
  final DateTime dateTime;
  final String timeString;

  const Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.dateTime,
    required this.timeString,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, senderId, receiverId, message, DateTime, timeString];

  static List<Message> messages = [
    Message(
      id: 1,
      senderId: 1,
      receiverId: 2,
      message:
          "Hey, Can I walk you home, coz my mom told me to follow my dreams. ",
      dateTime: DateTime.now(),
      timeString: "4:48pm",
    ),
    Message(
      id: 2,
      senderId: 2,
      receiverId: 1,
      message: "That's super smooth, never heard, fuck me daddy.",
      dateTime: DateTime.now(),
      timeString: "4:48pm",
    ),
    Message(
      id: 3,
      senderId: 1,
      receiverId: 2,
      message: "Shoot me your address. ",
      dateTime: DateTime.now(),
      timeString: "4:48pm",
    ),
    Message(
      id: 4,
      senderId: 2,
      receiverId: 1,
      message: "765 Ortega Park",
      dateTime: DateTime.now(),
      timeString: "4:48pm",
    ),
    Message(
      id: 5,
      senderId: 1,
      receiverId: 2,
      message: "I will be there in 10 minuts. ETA--> 30 minutes",
      dateTime: DateTime.now(),
      timeString: "4:48pm",
    ),
    Message(
      id: 6,
      senderId: 1,
      receiverId: 3,
      message: "I have a hot and smart girlfriend",
      dateTime: DateTime.now(),
      timeString: "4:48pm",
    ),
    Message(
      id: 7,
      senderId: 3,
      receiverId: 1,
      message: "I have a hot and smart girlfriend",
      dateTime: DateTime.now(),
      timeString: "4:48pm",
    ),
    Message(
      id: 8,
      senderId: 1,
      receiverId: 4,
      message: "I have a hot and smart girlfriend",
      dateTime: DateTime.now(),
      timeString: "4:48pm",
    ),
    Message(
      id: 9,
      senderId: 4,
      receiverId: 1,
      message: "I have a hot and smart girlfriend",
      dateTime: DateTime.now(),
      timeString: "4:48pm",
    ),
    Message(
      id: 10,
      senderId: 1,
      receiverId: 5,
      message: "I have a hot and smart girlfriend",
      dateTime: DateTime.now(),
      timeString: "4:48pm",
    ),
    Message(
      id: 11,
      senderId: 5,
      receiverId: 1,
      message: "I have a hot and smart girlfriend",
      dateTime: DateTime.now(),
      timeString: "4:48pm",
    ),
  ];
}
