

import 'package:equatable/equatable.dart';

class Room extends Equatable {

  final int id;
  final String title;
  final String imageUrl;
  final int pricePerDay;
  final int capacity;

  const Room({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.pricePerDay,
    required this.capacity
  });

  @override
  List<Object> get props => [id, title, imageUrl, pricePerDay, capacity];
}