import 'package:equatable/equatable.dart';
import 'package:hotel/domain/model/cart_room.dart';


  class Tourist extends Equatable {
    final int? id;
    final String phone;
    final String email;
    final String firstName;
    final String lastName;
    final List<CartRoom> rooms;

    const Tourist({required this.id, required this.phone, required this.email, required this.firstName, required this.lastName, required this.rooms});

    @override

    List<Object?> get props => [id, phone, email, firstName, lastName, rooms];

  }