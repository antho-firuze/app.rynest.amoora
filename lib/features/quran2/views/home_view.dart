import 'package:amoora/utils/my_ui.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyUI(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(40),
              child: TabBar(
                tabs: [
                  Tab(
                    text: 'SURAH',
                  ),
                ],
              ),
            ),
          ),
          body: Container(),
        ),
      ),
    );
  }
}
