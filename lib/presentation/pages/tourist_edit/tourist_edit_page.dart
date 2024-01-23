import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/core/constants/constants.dart';
import 'package:hotel/core/design/colors.dart';
import 'package:hotel/core/design/dimensions.dart';
import 'package:hotel/core/design/icons.dart';
import 'package:hotel/core/design/styles.dart';
import 'package:hotel/domain/model/tourist.dart';
import 'package:hotel/injector.dart';
import 'package:hotel/presentation/pages/tourist_edit/bloc/tourist_edit_page_bloc.dart';
import 'package:hotel/presentation/widgets/content_card.dart';
import 'package:hotel/presentation/widgets/loading_ui.dart';
import 'package:hotel/presentation/widgets/content_sector.dart';


class TouristEditPage extends StatelessWidget {
  final Tourist? tourist;
  const TouristEditPage({super.key, this.tourist});


  @override
  Widget build(BuildContext context) {
    return BlocProvider<TouristEditPageBloc>(
      create: (context) => getIt<TouristEditPageBloc>()
        ..add(GetTouristEvent(tourist)),
      child: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) async {
          if (didPop) {
            return;
          }
          final NavigatorState navigator = Navigator.of(context);

          final bool? shouldPop = await _onNavigateBack(context);
          if (shouldPop ?? false) {
            navigator.pop();
          }
        },
        child: Scaffold(
          backgroundColor: surfaceColor,
          appBar: _buildAppBar(),
          body: _buildBody(),
        )
      )
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          behavior: HitTestBehavior.opaque,
          child: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      title: const Text("О туристе"),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<TouristEditPageBloc, TouristEditPageState>(
        builder: (context, state) {
          if (state is TouristEditPageLoading) {
            return const LoadingUI();
          }
          if (state is TouristEditPageContent) {
            return Stack(
              children: [
                _buildContentSector(context, state),
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
  Widget _buildContentSector(BuildContext context, TouristEditPageContent state) {
    return ContentSector(
        backgroundColor: whiteColor,
        bottomPadding: padding90,
        topPadding: padding8,
        children: [
          _buildTextFields(context, state),
        ]
    );
  }


  Widget _buildTextFields(BuildContext context, TouristEditPageContent state) {
    return Padding(
        padding: const EdgeInsets.all(padding16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(
              labelText: "Имя",
              text: state.firstName,
              onValueChanged: (String newValue) {
                context.read<TouristEditPageBloc>().add(FirstNameChangedEvent(newValue));
              }
            ),
            const SizedBox(height: height12),
            _buildTextField(
                labelText: "Фамилия",
                text: state.lastName,
                onValueChanged: (String newValue) {
                  context.read<TouristEditPageBloc>().add(LastNameChangedEvent(newValue));
                }
            ),
            const SizedBox(height: height12),
            _buildTextField(
                labelText: "Номер телефона",
                text: state.phone,
                onValueChanged: (String newValue) {
                  context.read<TouristEditPageBloc>().add(PhoneChangedEvent(newValue));
                }
            ),
            const SizedBox(height: height12),
            _buildTextField(
                labelText: "Почта",
                text: state.email,
                onValueChanged: (String newValue) {
                  context.read<TouristEditPageBloc>().add(EmailChangedEvent(newValue));
                }
            ),
          ],
        ),
    );
  }


  Widget _buildTextField({
    required String labelText,
    required String text,
    required void Function(String newValue) onValueChanged
  }) {
    return SizedBox(
      height: 52,
      child: TextFormField(
        initialValue: text,
        onChanged: (String newValue) => onValueChanged(newValue),
        style: fieldTextStyle,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          labelText: labelText
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context, TouristEditPageContent state) {
    return ContentCard(
        childPadding: padding16,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSaveButton(context, state),

            if(tourist != null) ...[
              const SizedBox(width: width16),
              _buildDeleteButton(context)
            ]

          ],
        )
    );

  }
  Widget _buildSaveButton(BuildContext context, TouristEditPageContent state) {
    if (state.isButtonActive) {
      return Expanded(
          flex: 3,
          child: SizedBox(
            height: height50,
            child: ElevatedButton(
                onPressed: () => _onSaveButtonTapped(context),
                child: const Text("Сохранить", style: buttonTextStyle)
            ),
          )
      );
    } else {
      return Expanded(
          flex: 3,
          child: SizedBox(
            height: height50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: grayColor,
                ),
                onPressed: null,
                child: Text("Сохранить", style: buttonTextStyle.copyWith(color: gray2Color))
            ),
          )
      );
    }

  }
  Widget _buildDeleteButton(BuildContext context) {
    return Expanded(
        flex: 1,
        child: SizedBox(
          height: height50,
          child: ElevatedButton(
              onPressed: () => _onDeleteButtonTapped(context),
              style: ElevatedButton.styleFrom(
                  backgroundColor: blackColor
              ),
              child: iconDeleteWhite16
          ),
        )
    );
  }
  void _onSaveButtonTapped(BuildContext context) {
    context.read<TouristEditPageBloc>()
        .add(const SaveTouristEvent());
    Navigator.pop(context, refreshArgument);
  }
  void _onDeleteButtonTapped(BuildContext context) {
    context.read<TouristEditPageBloc>()
        .add(const RemoveTouristEvent());
    Navigator.pop(context, refreshArgument);
  }

  Future <bool?> _onNavigateBack(BuildContext context) async {
    //print("onNavigateBack");

    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Предупреждение"),
            content: const Text("Вы уверены, что хотите выйти? \nИзменения не сохранятся."),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("Отмена", style: buttonTextStyle.copyWith(color: blackColor))
              ),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text("ОК", style: buttonTextStyle.copyWith(color: blackColor))
              ),
            ],
          );
        }
    );
  }

}
