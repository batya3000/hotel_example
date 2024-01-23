part of 'tourists_page_bloc.dart';

abstract class TouristsPageState extends Equatable {
  const TouristsPageState();
}

class TouristsPageLoading extends TouristsPageState {
  const TouristsPageLoading();

  @override
  List<Object> get props => [];
}


class TouristsPageContent extends TouristsPageState {
  final List<Tourist> tourists;

  const TouristsPageContent(this.tourists);

  @override
  List<Object> get props => [tourists];
}

class TouristsPageError extends TouristsPageState {
  final String errorMessage;

  const TouristsPageError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}