part of 'rooms_page_bloc.dart';


abstract class RoomsPageEvent extends Equatable {
  const RoomsPageEvent();

}

class GetRoomsEvent extends RoomsPageEvent {
  const GetRoomsEvent();

  @override
  List<Object?> get props => [];
}