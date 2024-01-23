
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel/core/util/utils.dart';
import 'package:hotel/domain/model/cart_room.dart';
import 'package:hotel/domain/model/tourist.dart';
import 'package:hotel/domain/usecase/add_tourist.dart';
import 'package:hotel/domain/usecase/remove_tourist_by_id.dart';
import 'package:hotel/domain/usecase/update_tourist.dart';

part 'tourist_edit_page_event.dart';
part 'tourist_edit_page_state.dart';

class TouristEditPageBloc extends Bloc<TouristEditPageEvent, TouristEditPageState> {
  final UpdateTouristUseCase _updateTouristUseCase;
  final AddTouristUseCase _addTouristUseCase;
  final RemoveTouristByIdUseCase _removeTouristByIdUseCase;

  TouristEditPageBloc(this._updateTouristUseCase, this._addTouristUseCase, this._removeTouristByIdUseCase) : super(TouristEditPageLoading()) {
    on<SaveTouristEvent>(_onSaveButtonClicked);
    on<RemoveTouristEvent>(_onRemoveButtonClicked);

    on<GetTouristEvent>(_onGetTourist);

    on<FirstNameChangedEvent>(_onFirstNameChanged);
    on<LastNameChangedEvent>(_onLastNameChanged);
    on<PhoneChangedEvent>(_onPhoneChanged);
    on<EmailChangedEvent>(_onEmailChanged);
  }

  void _onSaveButtonClicked(SaveTouristEvent event, Emitter<TouristEditPageState> emit) async {
    if ((state as TouristEditPageContent).id == null) {
      await _addTouristUseCase(
          Tourist(
              id: null,
              firstName: (state as TouristEditPageContent).firstName,
              lastName: (state as TouristEditPageContent).lastName,
              phone: (state as TouristEditPageContent).phone,
              email: (state as TouristEditPageContent).email,
              rooms: const []
          )
      );
    } else {
      await _updateTouristUseCase(
          Tourist(
              id: (state as TouristEditPageContent).id,
              firstName: (state as TouristEditPageContent).firstName,
              lastName: (state as TouristEditPageContent).lastName,
              phone: (state as TouristEditPageContent).phone,
              email: (state as TouristEditPageContent).email,
              rooms: (state as TouristEditPageContent).rooms
          )
      );
    }
  }
  void _onRemoveButtonClicked(RemoveTouristEvent event, Emitter<TouristEditPageState> emit) async {
    if ((state as TouristEditPageContent).id != null) {
      await _removeTouristByIdUseCase(
          (state as TouristEditPageContent).id!
      );
    }
  }
  void _onGetTourist(GetTouristEvent event, Emitter<TouristEditPageState> emit) {
    emit(TouristEditPageContent(
        id: event.tourist?.id,
        firstName: event.tourist?.firstName ?? "",
        lastName: event.tourist?.lastName ?? "",
        phone: event.tourist?.phone ?? "",
        email: event.tourist?.email ?? "",
        rooms: event.tourist?.rooms ?? [],
        isButtonActive: false
    ));
  }

  void _onFirstNameChanged(FirstNameChangedEvent event, Emitter<TouristEditPageState> emit) {
    emit((state as TouristEditPageContent).copyWith(
        firstName: event.newFirstName.trim()
    ));
    emit((state as TouristEditPageContent).copyWith(
        isButtonActive: isButtonActive()
    ));
  }
  void _onLastNameChanged(LastNameChangedEvent event, Emitter<TouristEditPageState> emit) {
    emit((state as TouristEditPageContent).copyWith(
        lastName: event.newLastName.trim()
    ));
    emit((state as TouristEditPageContent).copyWith(
        isButtonActive: isButtonActive()
    ));
  }
  void _onPhoneChanged(PhoneChangedEvent event, Emitter<TouristEditPageState> emit) {
    emit((state as TouristEditPageContent).copyWith(
        phone: event.newPhone.trim()
    ));
    emit((state as TouristEditPageContent).copyWith(
        isButtonActive: isButtonActive()
    ));
  }
  void _onEmailChanged(EmailChangedEvent event, Emitter<TouristEditPageState> emit) {
    emit((state as TouristEditPageContent).copyWith(
        email: event.newEmail.trim()
    ));
    emit((state as TouristEditPageContent).copyWith(
        isButtonActive: isButtonActive()
    ));
  }

  bool isButtonActive() {

    if (state is TouristEditPageContent &&
        (state as TouristEditPageContent).firstName.length > 2 &&
        (state as TouristEditPageContent).lastName.length > 2 &&
        validatePhone((state as TouristEditPageContent).phone) &&
        validateEmail((state as TouristEditPageContent).email)
    ) {
      return true;
    }
    return false;
  }



}
