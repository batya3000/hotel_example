part of 'booking_page_bloc.dart';

abstract class BookingPageState extends Equatable {
  const BookingPageState();
}

class BookingPageLoading extends BookingPageState {
  const BookingPageLoading();

  @override
  List<Object> get props => [];
}


class BookingPageContent extends BookingPageState {
  final String? fromDay;
  final String? toDay;
  final List<Tourist> tourists;
  final int? selectedTouristId;
  final bool isButtonActive;

  const BookingPageContent({this.fromDay, this.toDay, required this.tourists, this.selectedTouristId, required this.isButtonActive});

  BookingPageContent copyWith({String? fromDay, String? toDay, List<Tourist>? tourists, int? selectedTouristId, bool? isButtonActive}) =>
      BookingPageContent(
        fromDay: fromDay ?? this.fromDay,
        toDay: toDay ?? this.toDay,
        tourists: tourists ?? this.tourists,
        selectedTouristId: selectedTouristId ?? this.selectedTouristId,
        isButtonActive: isButtonActive ?? this.isButtonActive
      );

  @override
  List<Object?> get props => [fromDay, toDay, tourists, selectedTouristId, isButtonActive];
}

class BookingPageError extends BookingPageState {
  final String errorMessage;

  const BookingPageError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}