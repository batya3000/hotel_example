import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel/core/design/colors.dart';
import 'package:hotel/core/design/dimensions.dart';
import 'package:hotel/core/design/icons.dart';
import 'package:hotel/core/design/styles.dart';
import 'package:hotel/core/util/utils.dart';
import 'package:hotel/domain/model/room.dart';
import 'package:hotel/injector.dart';
import 'package:hotel/presentation/pages/booking/bloc/booking_page_bloc.dart';
import 'package:hotel/presentation/widgets/cached_image.dart';
import 'package:hotel/presentation/widgets/content_card.dart';
import 'package:hotel/presentation/widgets/error_ui.dart';
import 'package:hotel/presentation/widgets/loading_ui.dart';
import 'package:hotel/presentation/widgets/content_sector.dart';
import 'package:hotel/presentation/widgets/select_tourist_dialog.dart';


class BookingPage extends StatelessWidget {
  final Room room;

  const BookingPage({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookingPageBloc>(
      create: (context) => getIt<BookingPageBloc>()
        ..add(const GetTouristsEvent()),
      child: Scaffold(
        backgroundColor: surfaceColor,
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          onTap: () => _onBackButtonTapped(context),
          behavior: HitTestBehavior.opaque,
          child: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      title: const Text("Бронирование"),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<BookingPageBloc, BookingPageState>(
      builder: (context, state) {

        if (state is BookingPageLoading) {
          return const LoadingUI();

        }
        if(state is BookingPageError) {
          return ErrorUI(
              errorMessage: state.errorMessage,
              onTap: () {  }
          );
        }

        if(state is BookingPageContent) {

          return Stack(
            children: [
              _buildContent(context, state),
              const SizedBox(height: height8),
              Align(
                alignment: Alignment.bottomCenter,
                child: _buildButtons(context, state),
              )
            ],
          );
        }

        return const SizedBox();
      },
    );
  }

  Widget _buildButtons(BuildContext context, BookingPageContent state) {
    return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: _buildSaveButton(context, state),
          ),
        )
    );
  }

  Widget _buildContent(BuildContext context, BookingPageContent state) {
    return ContentSector(
        backgroundColor: surfaceColor,
        bottomPadding: padding90,
        topPadding: padding8,
        children: [
          _buildInfoSector(context, state),
          const SizedBox(height: height8),
          _buildTouristSector(context, state),
          const SizedBox(height: height8),
          _buildTotalSector(state)
        ]

    );
  }

  Widget _buildInfoSector(BuildContext context, BookingPageContent state) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(),
              const SizedBox(height: height16),
              Text(room.title, style: subtitleTextStyle,),
              const SizedBox(height: height12),
              _buildMoneyTag(),
              const SizedBox(height: height12),
              _buildCapacityTag(),
              const SizedBox(height: height12),
              const Text("Даты поездки", style: subtitleTextStyle),
              const SizedBox(height: height12),
              _buildDateSelector(context, state)
            ],
          )
      ),
    );
  }

  Widget _buildTouristSector(BuildContext context, BookingPageContent state) {
    return ContentCard(
        childPadding: padding16,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Выбранный турист", style: subtitleTextStyle,),
              const SizedBox(height: height20),
              _buildTouristSelector(context, state)
            ]
        )
    );
  }



  Widget _buildDateSelector(BuildContext context, BookingPageContent state) {
    Color selectorBackgroundColor;
    String selectorText;
    if(state.fromDay != null && state.toDay != null) {
      selectorBackgroundColor = primaryColor;
      selectorText = getFormattedRange(state.fromDay!, state.toDay!);

    } else {
      selectorBackgroundColor = gray2Color;
      selectorText = "Выберите даты поездки";
    }

    return _buildSelectorChip(
        icon: iconCalendarWhite16,
        color: selectorBackgroundColor,
        text: selectorText,
        onClicked: () => _showDateRangeDialog(context, state)
    );
  }

  Widget _buildTouristSelector(BuildContext context, BookingPageContent state) {
    Color selectorBackgroundColor;
    String selectorText;
    if(state.selectedTouristId != null) {
      var tourist = state.tourists.firstWhere((tourist) => tourist.id == state.selectedTouristId!);
      selectorBackgroundColor = primaryColor;
      selectorText = "${tourist.firstName} ${tourist.lastName}";
    } else {
      selectorBackgroundColor = gray2Color;
      selectorText = "Выберите туриста";
    }

    return _buildSelectorChip(
        icon: iconPersonWhite16,
        color: selectorBackgroundColor,
        text: selectorText,
        onClicked: () => _showTouristDialog(context, state)
    );
  }

  Widget _buildSelectorChip({
    required SvgPicture icon,
    required String text,
    required Color color,
    required void Function() onClicked
  }) {
    return SizedBox(
      //width: double,
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius12)
          ),
          color: color ,
          child: InkWell(
              onTap: onClicked,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: padding8, horizontal: padding12),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    icon,
                    const SizedBox(width: width8),
                    Text(text, style: bodyTextStyle.copyWith(color: whiteColor, fontWeight: FontWeight.w500))
                  ],
                ),
              )
          )
      ),
    );
  }

  Widget _buildTotalSector(BookingPageContent state) {
    int totalMoney = 0;
    if (state.fromDay != null && state.toDay != null) {
      totalMoney = getTotalMoney(state.fromDay!, state.toDay!, room.pricePerDay);
    }

    return ContentCard(
        childPadding: padding16,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Сумма к оплате", style: subtitleTextStyle,),
              const SizedBox(height: height20),
              _buildTotalItem(
                  leadingText: "Оплата за номер",
                  totalMoney: totalMoney,
                  textStyle: bodyTextStyle.copyWith(color: gray2Color)
              ),
              const SizedBox(height: height12),
              _buildTotalItem(
                  leadingText: "Оплата сборов",
                  totalMoney: 229,
                  textStyle: bodyTextStyle.copyWith(color: gray2Color)
              ),
              const SizedBox(height: height12),
              _buildTotalItem(
                  leadingText: "Оплата за номер",
                  totalMoney: totalMoney + 229,
                  textStyle: bodyTextStyle.copyWith(fontWeight: FontWeight.w600)
              ),
            ]
        )
    );
  }

  Widget _buildTotalItem({
    required String leadingText,
    required int totalMoney,
    required TextStyle textStyle,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(leadingText, style: textStyle),
        Text("$totalMoney ₽", style: textStyle),
      ],
    );
  }

  Widget _buildMoneyTag() {
    return Row(
      children: [
        iconMoney16,
        const SizedBox(width: width8),
        Text("От ${room.pricePerDay} ₽ / ночь", style: bodyTextStyle,)
      ],
    );
  }

  Widget _buildCapacityTag() {
    String capacity;
    switch(room.capacity) {
      case 1:
        capacity = "Одноместный";
      default:
        capacity = "${room.capacity}-х местный";

    }
    return Row(
      children: [
        iconPerson16,
        const SizedBox(width: width8),
        Text(capacity, style: bodyTextStyle)
      ],
    );
  }

  void _showDateRangeDialog(BuildContext context, BookingPageContent state) {

    showDateRangePicker(
        context: context,
        barrierColor: Colors.red,

        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365))
    ).then((DateTimeRange? range) {
      if (range != null) {
        context.read<BookingPageBloc>()
            .add(DateSelectedEvent(
          fromDay: range.start.toIso8601String(),
          toDay: range.end.toIso8601String(),
        ));
      }
    });
  }

  void _showTouristDialog(BuildContext parentContext, BookingPageContent state) {
    showDialog(
        context: parentContext,
        builder: (context) {
          return SelectTouristDialog(
            tourists: state.tourists,
            initialSelectedTouristId: state.tourists.indexWhere((element) => element.id == state.selectedTouristId),
            onDismiss: () =>
                Navigator.pop(parentContext),

            onTouristSelected: (int index) {
              parentContext.read<BookingPageBloc>()
                  .add(TouristSelectedEvent(state.tourists[index].id!));
              Navigator.pop(parentContext);
            },
          );
        }
    );
  }

  Widget _buildImage() {
    return Card(
        child: CachedImage(
            imageUrl: room.imageUrl,
            width: double.infinity,
            height: height165
        )
    );
  }

  Widget _buildSaveButton(BuildContext context, BookingPageContent state) {
    if (state.isButtonActive) {
      return SizedBox(
        height: height50,
        child: ElevatedButton(
            onPressed: () {
              context.read<BookingPageBloc>()
                  .add(AddToCartClickedEvent(room));
              Navigator.pop(context);
            },
            child: const Text("Добавить в корзину", style: buttonTextStyle)
        ),
      );
    } else {
      return SizedBox(
        height: height50,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: grayColor,
            ),
            onPressed: null,
            child: Text("Выберите даты и туриста", style: buttonTextStyle.copyWith(color: gray2Color))
        ),
      );
    }
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

}
