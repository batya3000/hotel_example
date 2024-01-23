import 'package:flutter/material.dart';
import 'package:hotel/core/constants/constants.dart';
import 'package:hotel/core/design/styles.dart';


class BookedPage extends StatelessWidget {
  const BookedPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
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
      title: const Text("Заказ оплачен"),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildPage(),
        ],
      ),
    );
  }

  Widget _buildPage() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Забронировано", style: subtitleTextStyle),
        ],
      ),
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.of(context).pop();
  }
}
