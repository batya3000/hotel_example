


import 'package:flutter/material.dart';
import 'package:hotel/core/design/dimensions.dart';
import 'package:hotel/domain/model/room.dart';
import 'package:hotel/presentation/widgets/room_list/room_item.dart';

class RoomList extends StatelessWidget {
  final List<Room> rooms;
  final void Function(Room room) onRoomClicked;

  const RoomList({super.key, required this.rooms, required this.onRoomClicked});

  @override
  Widget build(BuildContext context) {
    final safeBottomPadding = MediaQuery.of(context).padding.bottom + height16;

    return ListView.separated(
        itemCount: rooms.length,
        padding: EdgeInsets.only(
            top: padding16,
            left: padding16,
            right: padding16,
            bottom: safeBottomPadding
        ),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: height16);
        },
        itemBuilder: (BuildContext context, int index) {
          return RoomItem(
              room: rooms[index],
              onItemClicked: () => onRoomClicked(rooms[index])
          );
        }
    );
  }

}
