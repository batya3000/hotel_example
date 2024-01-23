
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:hotel/core/constants/constants.dart';
import 'package:hotel/data/data_sources/local/dao/tourist_dao.dart';
import 'package:hotel/data/data_sources/remote/rooms_api.dart';
import 'package:hotel/data/repository/room_repository_impl.dart';
import 'package:hotel/data/repository/tourist_repository_impl.dart';
import 'package:hotel/domain/repository/room_repository.dart';
import 'package:hotel/domain/repository/tourist_repository.dart';
import 'package:hotel/domain/usecase/add_room_to_cart.dart';
import 'package:hotel/domain/usecase/add_tourist.dart';
import 'package:hotel/domain/usecase/clear_cart.dart';
import 'package:hotel/domain/usecase/get_rooms.dart';
import 'package:hotel/domain/usecase/get_tourists.dart';
import 'package:hotel/domain/usecase/remove_room_from_cart.dart';
import 'package:hotel/domain/usecase/remove_tourist_by_id.dart';
import 'package:hotel/domain/usecase/update_tourist.dart';
import 'package:hotel/presentation/pages/booking/bloc/booking_page_bloc.dart';
import 'package:hotel/presentation/pages/cart/bloc/cart_page_bloc.dart';
import 'package:hotel/presentation/pages/rooms/bloc/rooms_page_bloc.dart';
import 'package:hotel/presentation/pages/tourist_edit/bloc/tourist_edit_page_bloc.dart';
import 'package:hotel/presentation/pages/tourists/bloc/tourists_page_bloc.dart';

import 'data/data_sources/local/database/app_database.dart';

final GetIt getIt = GetIt.instance;

Future<void> initializeGetIt() async {

  // ------------------------------------------
  // Data layer
  // ------------------------------------------

  final database = await $FloorAppDatabase
      .databaseBuilder(touristDatabase)
      .build();

  // Floor
  getIt.registerLazySingleton<TouristDao>(
      () => database.touristDao
  );


  // Dio
  getIt.registerLazySingleton<Dio>(
          () => Dio()
  );


  // Retrofit
  getIt.registerLazySingleton<RoomsApi>(
          () => RoomsApi(getIt())
  );

  // Repositories
  getIt.registerLazySingleton<RoomRepository>(
          () => RoomRepositoryImpl(getIt())
  );
  getIt.registerLazySingleton<TouristRepository>(
          () => TouristRepositoryImpl(getIt())
  );


  // ------------------------------------------
  // Presentation layer
  // ------------------------------------------

  getIt.registerFactory<RoomsPageBloc>(() =>
      RoomsPageBloc(getIt())
  );
  getIt.registerFactory<TouristsPageBloc>(() =>
      TouristsPageBloc(getIt())
  );
  getIt.registerFactory<CartPageBloc>(() =>
      CartPageBloc(getIt(), getIt(), getIt())
  );

  getIt.registerFactory<TouristEditPageBloc>(() =>
      TouristEditPageBloc(getIt(), getIt(), getIt())
  );
  getIt.registerFactory<BookingPageBloc>(() =>
      BookingPageBloc(getIt(), getIt())
  );

  // ------------------------------------------
  // Domain layer
  // ------------------------------------------


  // UseCases
  getIt.registerLazySingleton<GetRoomsUseCase>(
          () => GetRoomsUseCase(getIt())
  );
  getIt.registerLazySingleton<GetTouristsUseCase>(
          () => GetTouristsUseCase(getIt())
  );
  getIt.registerLazySingleton<AddTouristUseCase>(
          () => AddTouristUseCase(getIt())
  );
  getIt.registerLazySingleton<RemoveTouristByIdUseCase>(
          () => RemoveTouristByIdUseCase(getIt())
  );
  getIt.registerLazySingleton<UpdateTouristUseCase>(
          () => UpdateTouristUseCase(getIt())
  );
  getIt.registerLazySingleton<AddRoomToCartUseCase>(
          () => AddRoomToCartUseCase(getIt())
  );
  getIt.registerLazySingleton<RemoveRoomFromCartUseCase>(
          () => RemoveRoomFromCartUseCase(getIt())
  );
  getIt.registerLazySingleton<ClearCartUseCase>(
          () => ClearCartUseCase(getIt())
  );

}