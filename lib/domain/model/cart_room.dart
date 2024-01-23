import 'package:equatable/equatable.dart';

class CartRoom extends Equatable {
  final int touristId;
  final String title;
  final String imageUrl;
  final int pricePerDay;
  final String fromDay;
  final String toDay;
  final int capacity;

  const CartRoom({
    required this.touristId,
    required this.title,
    required this.imageUrl,
    required this.pricePerDay,
    required this.fromDay,
    required this.toDay,
    required this.capacity
  });

  @override
  List<Object> get props => [touristId, title, imageUrl, pricePerDay, fromDay, toDay, capacity];
}