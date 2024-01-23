part of 'tourist_edit_page_bloc.dart';

abstract class TouristEditPageEvent extends Equatable {
  const TouristEditPageEvent();

}

class SaveTouristEvent extends TouristEditPageEvent {
  const SaveTouristEvent();

  @override
  List<Object?> get props => [];
}

class GetTouristEvent extends TouristEditPageEvent {
  final Tourist? tourist;

  const GetTouristEvent(this.tourist);

  @override
  List<Object?> get props => [tourist];
}

class RemoveTouristEvent extends TouristEditPageEvent {
  const RemoveTouristEvent();

  @override
  List<Object?> get props => [];
}

class FirstNameChangedEvent extends TouristEditPageEvent {
  final String newFirstName;

  const FirstNameChangedEvent(this.newFirstName);

  @override
  List<Object?> get props => [newFirstName];
}

class LastNameChangedEvent extends TouristEditPageEvent {
  final String newLastName;

  const LastNameChangedEvent(this.newLastName);

  @override
  List<Object?> get props => [newLastName];
}

class PhoneChangedEvent extends TouristEditPageEvent {
  final String newPhone;

  const PhoneChangedEvent(this.newPhone);

  @override
  List<Object?> get props => [newPhone];
}

class EmailChangedEvent extends TouristEditPageEvent {
  final String newEmail;

  const EmailChangedEvent(this.newEmail);

  @override
  List<Object?> get props => [newEmail];
}