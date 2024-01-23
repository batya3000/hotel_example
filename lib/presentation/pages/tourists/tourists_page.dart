import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/core/constants/constants.dart';
import 'package:hotel/core/design/colors.dart';
import 'package:hotel/core/design/icons.dart';
import 'package:hotel/domain/model/tourist.dart';
import 'package:hotel/injector.dart';
import 'package:hotel/presentation/pages/tourists/bloc/tourists_page_bloc.dart';
import 'package:hotel/presentation/widgets/error_ui.dart';
import 'package:hotel/presentation/widgets/loading_ui.dart';
import 'package:hotel/presentation/widgets/tourist_list/tourist_list.dart';


class TouristsPage extends StatelessWidget {
  const TouristsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TouristsPageBloc>(
      create: (context) => getIt<TouristsPageBloc>()
        ..add(const GetTouristsEvent()),
      child: Scaffold(
        body: _buildBody(),
        floatingActionButton: _buildFloatingActionButton(),
      ),
    );
  }


  Widget _buildBody() {
    return Container(
      width: double.infinity,
      color: surfaceColor,
      child: _buildPage(),
    );
  }

  Widget _buildPage() {
    return BlocBuilder<TouristsPageBloc, TouristsPageState>(
        builder: (context, state) {

          if (state is TouristsPageLoading) {

            return const LoadingUI();

          }
          if(state is TouristsPageError) {

            return ErrorUI(
                errorMessage: state.errorMessage,
                onTap: () => _onRefresh(context)
            );
          }
          if(state is TouristsPageContent) {

            if (state.tourists.isNotEmpty) {

              return TouristList(
                tourists: state.tourists,
                onTouristClicked: (tourist) => _onTouristClicked(context, tourist),
              );
            } else {

              return const Center(child: Text("Вы пока не добавили туриста..."));
            }
          }

          return const SizedBox();

        },
    );
  }

  Widget _buildFloatingActionButton() {
    return Builder(
      builder: (context) => FloatingActionButton(
        onPressed: () => _onFloatingActionButtonPressed(context),
        child: iconAddWhite20,
      ),
    );
  }

  void _onFloatingActionButtonPressed(BuildContext context) {
    Navigator.pushNamed(context, touristEditPageRoute);
  }

  void _onRefresh(BuildContext context) {
    context.read<TouristsPageBloc>()
        .add(const GetTouristsEvent());
  }

  void _onTouristClicked(BuildContext context, Tourist tourist) {
    Navigator.pushNamed(context, touristEditPageRoute, arguments: tourist);
  }
}
