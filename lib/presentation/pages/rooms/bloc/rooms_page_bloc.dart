
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel/core/result/result.dart';
import 'package:hotel/domain/model/room.dart';
import 'package:hotel/domain/usecase/get_rooms.dart';

part 'rooms_page_event.dart';
part 'rooms_page_state.dart';

class RoomsPageBloc extends Bloc<RoomsPageEvent, RoomsPageState> {
  final GetRoomsUseCase _getRoomsUseCase;


  RoomsPageBloc(this._getRoomsUseCase) : super(const RoomsPageLoading()) {
    on<GetRoomsEvent>(_onGetRooms);
  }

  void _onGetRooms(GetRoomsEvent event, Emitter<RoomsPageState> emit) async {
    final result = await _getRoomsUseCase();

    switch(result) {
      case Success(): {
        emit(RoomsPageContent(result.data));
      }
      case Failure(): {
        emit(RoomsPageError(result.errorMessage));
      }
    }
  }
}
