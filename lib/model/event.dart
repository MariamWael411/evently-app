import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  static const String collectionName = 'Events';
  String name;
  String title;
  String description;
  String image;
  int index;
  String id;
  DateTime date;
  bool isFavorite;
  String userId;
  String imageDark;

  Event({
    required this.name,
    required this.title,
    required this.description,
    required this.image,
    required this.date,
    required this.index,
    this.id = '',
    required this.userId,
    this.isFavorite = false,
    required this.imageDark

  });

  Event.fromJson(Map<String, dynamic> data)
    : this(
        name: data['name'],
        image: data['image'],
        title: data['title'],
        index: data['index'],
        date: (data['date'] as Timestamp).toDate(),
        description: data['description'],
        id: data['id'],
        userId: data['user_id'],
        isFavorite: data['is_favorite'],
      imageDark: data['image_dark']
      );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'title': title,
      'description': description,
      'image': image,
      'index': index,
      'id': id,
      'date': date,
      'user_id': userId,
      'is_favorite': isFavorite,
      'image_dark': imageDark
    };
  }
}
