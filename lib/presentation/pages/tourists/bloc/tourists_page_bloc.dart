

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel/core/result/result.dart';
import 'package:hotel/domain/model/tourist.dart';
import 'package:hotel/domain/usecase/get_tourists.dart';

part 'tourists_page_event.dart';
part 'tourists_page_state.dart';

class TouristsPageBloc extends Bloc<TouristsPageEvent, TouristsPageState> {
  final GetTouristsUseCase _getTouristsUseCase;


  TouristsPageBloc(this._getTouristsUseCase) : super(const TouristsPageLoading()) {

    on<GetTouristsEvent>(_onGetTourists);

  }

  void _onGetTourists(GetTouristsEvent event, Emitter<TouristsPageState> emit) async {
    await emit.forEach(_getTouristsUseCase(), onData: (value) {
      switch(value) {
        case Success(): {
          return TouristsPageContent(value.data);
        }
        case Failure(): {
          return TouristsPageError(value.errorMessage);
        }
      }
    });
  }

}
