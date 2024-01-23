

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel/core/result/result.dart';
import 'package:hotel/domain/model/cart_room.dart';
import 'package:hotel/domain/model/room.dart';
import 'package:hotel/domain/model/tourist.dart';
import 'package:hotel/domain/usecase/add_room_to_cart.dart';
import 'package:hotel/domain/usecase/get_tourists.dart';


part 'booking_page_event.dart';
part 'booking_page_state.dart';

class BookingPageBloc extends Bloc<BookingPageEvent, BookingPageState> {
  final GetTouristsUseCase _getTouristsUseCase;
  final AddRoomToCartUseCase _addRoomToCartUseCase;


  BookingPageBloc(this._getTouristsUseCase, this._addRoomToCartUseCase) : super(const BookingPageLoading()) {
    on<GetTouristsEvent>(_onGetTourists);
    on<DateSelectedEvent>(_onDateSelected);
    on<TouristSelectedEvent>(_onTouristSelected);
    on<AddToCartClickedEvent>(_onAddToCartClicked);
  }

  void _onAddToCartClicked(AddToCartClickedEvent event, Emitter<BookingPageState> emit) async {
    if (
    (state as BookingPageContent).selectedTouristId != null &&
        (state as BookingPageContent).fromDay != null &&
        (state as BookingPageContent).toDay != null
    ) {
      print('in booking page bloc touristId:${(state as BookingPageContent).selectedTouristId ?? "null"} ');
      await _addRoomToCartUseCase(
          CartRoom(
            touristId: (state as BookingPageContent).selectedTouristId!,
            title: event.room.title,
            imageUrl: event.room.imageUrl,
            pricePerDay: event.room.pricePerDay,
            capacity: event.room.capacity,
            fromDay: (state as BookingPageContent).fromDay!,
            toDay: (state as BookingPageContent).toDay! ,
          )
      );
    }

  }

  void _onGetTourists(GetTouristsEvent event, Emitter<BookingPageState> emit) async {

    await emit.forEach(_getTouristsUseCase(), onData: (value) {
      switch(value) {
        case Success(): {

          return BookingPageContent(tourists: value.data, isButtonActive: false);
        }
        case Failure(): {
          return BookingPageError(value.errorMessage);
        }
      }
    });

  }

  void _onDateSelected(DateSelectedEvent event, Emitter<BookingPageState> emit) {
    emit((state as BookingPageContent).copyWith(
      fromDay: event.fromDay,
      toDay: event.toDay,
    ));

    emit((state as BookingPageContent).copyWith(
      isButtonActive: isButtonActive(),
    ));
  }

  void _onTouristSelected(TouristSelectedEvent event, Emitter<BookingPageState> emit)  {
    emit((state as BookingPageContent).copyWith(
      selectedTouristId: event.selectedTouristId,
    ));
    emit((state as BookingPageContent).copyWith(
      isButtonActive: isButtonActive(),
    ));
  }

  bool isButtonActive() {
    if (state is BookingPageContent &&
        (state as BookingPageContent).selectedTouristId != null &&
        (state as BookingPageContent).fromDay != null &&
        (state as BookingPageContent).toDay != null
    ) {
      return true;
    }
    return false;
  }

}
