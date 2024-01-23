part of 'rooms_page_bloc.dart';

abstract class RoomsPageState extends Equatable {
  const RoomsPageState();
}

class RoomsPageLoading extends RoomsPageState {
  const RoomsPageLoading();

  @override
  List<Object> get props => [];
}


class RoomsPageContent extends RoomsPageState {
  final List<Room> rooms;

  const RoomsPageContent(this.rooms);

  @override
  List<Object> get props => [rooms];
}

class RoomsPageError extends RoomsPageState {
  final String errorMessage;

  const RoomsPageError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}