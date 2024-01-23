part of 'tourists_page_bloc.dart';


abstract class TouristsPageEvent  {
  const TouristsPageEvent();

}

class GetTouristsEvent extends TouristsPageEvent {
  const GetTouristsEvent();

  @override
  List<Object?> get props => [];
}