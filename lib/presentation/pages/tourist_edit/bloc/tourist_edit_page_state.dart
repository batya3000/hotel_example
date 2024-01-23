part of 'tourist_edit_page_bloc.dart';

abstract class TouristEditPageState extends Equatable {
  const TouristEditPageState();

}

class TouristEditPageLoading extends TouristEditPageState {
  @override
  List<Object> get props => [];
}


class TouristEditPageContent extends TouristEditPageState {
  final int? id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final List<CartRoom> rooms;
  final bool isButtonActive;

  const TouristEditPageContent({this.id, required this.firstName, required this.lastName, required this.phone, required this.email, required this.rooms, required this.isButtonActive});


  TouristEditPageContent copyWith({String? firstName, String? lastName, String? phone, String? email, bool? isButtonActive}) =>
      TouristEditPageContent(
        id: id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        rooms: rooms,
        isButtonActive: isButtonActive ?? this.isButtonActive
      );

  @override
  List<Object?> get props => [id, firstName, lastName, phone, email, rooms, isButtonActive];
}
