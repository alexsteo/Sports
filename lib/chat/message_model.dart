import 'user_model.dart';

class Message {
  final User sender;
  final String
  time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.isLiked,
    required this.unread,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/images/greg.jpg',
);

// USERS
final User greg = User(
  id: 1,
  name: 'Greg',
  imageUrl: 'https://i.pinimg.com/736x/a3/9c/1e/a39c1e2636f0f319bc4a46d06ebed079.jpg',
);
final User james = User(
  id: 2,
  name: 'James',
  imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjaNcG-tBxvlbCZ5DU6nsHSaCY_j1IcDAw9w&usqp=CAU',
);
final User john = User(
  id: 3,
  name: 'John',
  imageUrl: 'https://st2.depositphotos.com/1009634/7235/v/600/depositphotos_72350117-stock-illustration-no-user-profile-picture-hand.jpg',
);
final User olivia = User(
  id: 4,
  name: 'Olivia',
  imageUrl: 'https://cdn.pixabay.com/photo/2017/06/13/12/53/profile-2398782_1280.png',
);
final User sam = User(
  id: 5,
  name: 'Sam',
  imageUrl: 'https://i.kym-cdn.com/photos/images/newsfeed/001/410/591/c86.png',
);
final User sophia = User(
  id: 6,
  name: 'Sophia',
  imageUrl: 'https://wallpapercave.com/wp/wp5756323.jpg',
);
final User steven = User(
  id: 7,
  name: 'Steven',
  imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTipha_cttrOgT3-_iJkmmJBQWMamZ1GnTDxg&usqp=CAU',
);

// FAVORITE CONTACTS
List<User> favorites = [sam, steven, olivia, john, greg];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: olivia,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: john,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sophia,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: steven,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sam,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: greg,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: currentUser,
    time: '5:30 PM',
    text: 'Can we delay everything by 10 minutes? I have to walk my dog',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:45 PM',
    text: 'Can I be of any help?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:15 PM',
    text: 'Looking forward to our game',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice to meet you',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:00 PM',
    text: 'Hello people',
    isLiked: false,
    unread: true,
  ),
];