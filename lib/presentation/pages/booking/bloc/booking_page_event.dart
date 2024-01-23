part of 'booking_page_bloc.dart';

abstract class BookingPageEvent  {
  const BookingPageEvent();

}

class GetTouristsEvent extends BookingPageEvent {
  const GetTouristsEvent();

  @override
  List<Object?> get props => [];
}

class DateSelectedEvent extends BookingPageEvent {
  final String fromDay;
  final String toDay;
  const DateSelectedEvent({required this.fromDay, required this.toDay});

  @override
  List<Object?> get props => [fromDay, toDay];
}


class TouristSelectedEvent extends BookingPageEvent {
  final int selectedTouristId;
  const TouristSelectedEvent(this.selectedTouristId);

  @override
  List<Object?> get props => [selectedTouristId];
}

class AddToCartClickedEvent extends BookingPageEvent {
  final Room room;
  const AddToCartClickedEvent(this.room);

  @override
  List<Object?> get props => [room];
}


