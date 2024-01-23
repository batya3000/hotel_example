import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/core/constants/constants.dart';
import 'package:hotel/core/design/styles.dart';
import 'package:hotel/domain/model/room.dart';
import 'package:hotel/injector.dart';
import 'package:hotel/presentation/pages/rooms/bloc/rooms_page_bloc.dart';
import 'package:hotel/presentation/widgets/error_ui.dart';
import 'package:hotel/presentation/widgets/loading_ui.dart';
import 'package:hotel/presentation/widgets/room_list/room_list.dart';

class RoomsPage extends StatelessWidget {
  const RoomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildPage(),
    );
  }

  Widget _buildPage() {

    return BlocProvider<RoomsPageBloc>(
        create: (context) => getIt<RoomsPageBloc>()
            ..add(const GetRoomsEvent()),
      child: BlocBuilder<RoomsPageBloc, RoomsPageState>(
          builder: (context, state) {
            if(state is RoomsPageLoading) {
              return const LoadingUI();
            }
            if(state is RoomsPageError) {
              return ErrorUI(
                  errorMessage: state.errorMessage,
                  onTap: () => _onRefresh(context)
              );
            }
            if(state is RoomsPageContent) {
              if (state.rooms.isNotEmpty) {
                return RoomList(
                  rooms: state.rooms,
                  onRoomClicked: (room) => _onRoomClicked(context, room),
                );
              } else {
                return const Center(child: Text("Свободных номеров нет...", style: bodyTextStyle));
              }
            }
            return const SizedBox();
          }
      ),
    );
    // return B
  }

  void _onRefresh(BuildContext context) {
    context.read<RoomsPageBloc>()
        .add(const GetRoomsEvent());
  }

  void _onRoomClicked(BuildContext context, Room room) {
    Navigator.pushNamed(context, bookingPageRoute, arguments: room);
  }
}
