import 'package:project/data/model.dart';
import 'package:project/feature/message/component/message_trending.dart';
import 'package:project/feature/message/component/story_trending.dart';
import 'package:project/feature/notification/component/notification_trending.dart';

class FakeData {
  static List<String> fakeImage = [
    "https://i.pinimg.com/736x/2e/3d/68/2e3d6845011de0d24c13dd1e1028a2ff.jpg",
    "https://i.pinimg.com/736x/60/63/da/6063da107454d50c1d7786cc2c2bac75.jpg",
    "https://i.pinimg.com/236x/89/8a/0c/898a0cd6c6332d0773e69df2882b2868.jpg"
  ];
  static List<String> fakeGrid = [
    "https://i.pinimg.com/736x/2e/3d/68/2e3d6845011de0d24c13dd1e1028a2ff.jpg",
    "https://i.pinimg.com/736x/60/63/da/6063da107454d50c1d7786cc2c2bac75.jpg",
    "https://i.pinimg.com/236x/89/8a/0c/898a0cd6c6332d0773e69df2882b2868.jpg",
    "https://i.pinimg.com/736x/2e/3d/68/2e3d6845011de0d24c13dd1e1028a2ff.jpg",
    "https://i.pinimg.com/736x/60/63/da/6063da107454d50c1d7786cc2c2bac75.jpg",
    "https://i.pinimg.com/236x/89/8a/0c/898a0cd6c6332d0773e69df2882b2868.jpg",
  ];
  static String fakeDes =
      "1. Reduce your intake of sour and spicy foods, high in fat, caffeinated beverages and orange juice, reduce the ";
// Use in Message Screen
  static List<StroyTrendingModel> storyTrendingItem = [
    StroyTrendingModel(
      id: '1',
      thumnail:
          'https://i.pinimg.com/564x/7a/55/a7/7a55a706eae0f33b9ab81f3595f4ac76.jpg',
      name: 'Net',
      isOnline: false,
    ),
    StroyTrendingModel(
      id: '2',
      thumnail:
          'https://i.pinimg.com/236x/dc/04/aa/dc04aaae4d9a84ad7c4a3be7bc4e9766.jpg',
      name: 'Nha',
      isOnline: false,
    ),
    StroyTrendingModel(
      id: '3',
      thumnail:
          'https://i.pinimg.com/236x/f5/9e/e4/f59ee4d21909ed6503e89b4a70d91650.jpg',
      name: 'Bath',
      isOnline: true,
    ),
    StroyTrendingModel(
      id: '4',
      thumnail:
          'https://i.pinimg.com/236x/68/5e/4b/685e4b4dc7e00480f7d5756cb54f3acf.jpg',
      name: 'Lay',
      isOnline: true,
    ),
  ];
  //Message Screen
  static List<MessageTrendingModel> messagetrending = [
    MessageTrendingModel(
      id: "1",
      messsage: "Hello Tos Phik ot all Bro",
      thumnail:
          'https://i.pinimg.com/236x/68/5e/4b/685e4b4dc7e00480f7d5756cb54f3acf.jpg',
      name: "Mrr Net",
      isRead: false,
    ),
    MessageTrendingModel(
      id: "1",
      messsage: "Hello Tos Phik ot all Bro",
      thumnail:
          'https://i.pinimg.com/236x/68/5e/4b/685e4b4dc7e00480f7d5756cb54f3acf.jpg',
      name: "Mrr Net",
      isRead: false,
    ),
    MessageTrendingModel(
      id: "1",
      messsage: "Hello Tos Phik ot all Bro",
      thumnail:
          'https://i.pinimg.com/236x/68/5e/4b/685e4b4dc7e00480f7d5756cb54f3acf.jpg',
      name: "Mrr Net",
      isRead: true,
    ),
    MessageTrendingModel(
      id: "1",
      messsage: "Hello Tos Phik ot all Bro",
      thumnail:
          'https://i.pinimg.com/236x/68/5e/4b/685e4b4dc7e00480f7d5756cb54f3acf.jpg',
      name: "Mrr Net",
      isRead: true,
    )
  ];
  //Notification Screen
  static List<NotificationTrendingModel> notificationItesm = [
    NotificationTrendingModel(
        id: "1",
        title:
            "Hello Danet we have something to tell youWe want to tell You that some thing Happend to you",
        subtitle: "We want to tell You that some thing Happend to you",
        date: "Auguest 12 ,2022 at 12:00 pm"),
    NotificationTrendingModel(
        id: "1",
        title: "Hello Danet we have something to tell you",
        subtitle: "We want to tell You that some thing Happend to you",
        date: "Auguest 12 ,2022 at 12:00 pm"),
    NotificationTrendingModel(
        id: "1",
        title:
            "Hello Danet we have something to tell youWe want to tell You that some thing Happend to you",
        subtitle: "We want to tell You that some thing Happend to you",
        date: "Auguest 12 ,2022 at 12:00 pm"),
    NotificationTrendingModel(
        id: "1",
        title: "Hello Danet we have something to tell you",
        subtitle: "We want to tell You that some thing Happend to you",
        date: "Auguest 12 ,2022 at 12:00 pm"),
  ];
  // Use in Search Screen

  static List<SearchModel> searchItems = [
    SearchModel(
      id: "1",
      title: "What do you want to find here is what u want to find ",
      subtitle:
          "Did you come here for something in   Riker-bashing And blowing into",
      thumnail:
          "https://i.pinimg.com/236x/68/5e/4b/685e4b4dc7e00480f7d5756cb54f3acf.jpg",
    ),
    SearchModel(
      id: "1",
      title: "What do you want to find here is what u want to find ",
      subtitle:
          "Did you come here for something in   Riker-bashing And blowing into",
      thumnail:
          "https://i.pinimg.com/236x/68/5e/4b/685e4b4dc7e00480f7d5756cb54f3acf.jpg",
    ),
    SearchModel(
      id: "1",
      title: "What do you want to find here is what u want to find ",
      subtitle:
          "Did you come here for something in   Riker-bashing And blowing into",
      thumnail:
          "https://i.pinimg.com/236x/68/5e/4b/685e4b4dc7e00480f7d5756cb54f3acf.jpg",
    ),
    SearchModel(
      id: "1",
      title: "What do you want to find here is what u want to find ",
      subtitle:
          "Did you come here for something in   Riker-bashing And blowing into",
      thumnail:
          "https://i.pinimg.com/236x/68/5e/4b/685e4b4dc7e00480f7d5756cb54f3acf.jpg",
    ),
    SearchModel(
      id: "1",
      title: "What do you want to find here is what u want to find ",
      subtitle:
          "Did you come here for something in   Riker-bashing And blowing into",
      thumnail:
          "https://i.pinimg.com/236x/68/5e/4b/685e4b4dc7e00480f7d5756cb54f3acf.jpg",
    )
  ];
  // Message DetailScreen
  static List<MessageDetailModel> messageItem = [
    MessageDetailModel(
      thumnail:
          "https://i.pinimg.com/236x/68/5e/4b/685e4b4dc7e00480f7d5756cb54f3acf.jpg",
      message: "Hello Phik Ot All Bro",
      isSender: false,
      time: "12:00",
    ),
    MessageDetailModel(
      thumnail:
          "https://i.pinimg.com/236x/68/5e/4b/685e4b4dc7e00480f7d5756cb54f3acf.jpg",
      message: "Phik ter Boo",
      isSender: true,
      time: "12:00",
    ),
    MessageDetailModel(
      thumnail:
          "https://i.pinimg.com/236x/68/5e/4b/685e4b4dc7e00480f7d5756cb54f3acf.jpg",
      message: "Mean Zeii ot jg ",
      isSender: false,
      time: "12:00",
    ),
    MessageDetailModel(
      thumnail:
          "https://i.pinimg.com/236x/68/5e/4b/685e4b4dc7e00480f7d5756cb54f3acf.jpg",
      message: "Mean Ter Bro",
      isSender: true,
      time: "12:00",
    ),
    MessageDetailModel(
      thumnail:
          "https://i.pinimg.com/236x/68/5e/4b/685e4b4dc7e00480f7d5756cb54f3acf.jpg",
      message:
          "Jg Jam yub jam tv hz phik nv na mun tv call brab mun png srul reab jom klun oy hz hz tv mg",
      isSender: false,
      time: "12:00",
    )
  ];
}
