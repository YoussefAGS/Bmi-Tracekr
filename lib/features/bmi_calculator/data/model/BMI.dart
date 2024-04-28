import 'package:cloud_firestore/cloud_firestore.dart';

class Bmi {
  String? id;
  final double? weight;
  final double? height;
  final int? age;
  final String? userId;
  final DateTime? timestamp;
  final double? bmi;

  Bmi({
    required this.weight,
    required this.height,
    required this.age,
    required this.userId,
    required this.timestamp,
    required this.bmi,
    this.id = null,
  });

  Bmi.fromJson(Map<String, dynamic> map)
      : this(
          id: map['id'],
          weight: map['weight'],
          height: map['height'],
          age: map['age'],
          userId: map['userId'],
          timestamp:(map['timestamp'] as Timestamp).toDate(),
          bmi: map['bmi'],
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'weight': weight,
      'height': height,
      'age': age,
      'userId': userId,
      'timestamp': timestamp,
      'bmi': bmi,
    };
  }
}
