import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: 'FirstButton',
            onPressed: () => PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: Scaffold(
                  appBar: AppBar(
                    title: const Text('First'),
                  ),
                  body: Container(
                      alignment: Alignment.center,
                      child: const Text("First screen"))),
              withNavBar: true, // OPTIONAL VALUE. True by default.
              //Material transition
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            ),
            child: const Text('1'),
          ),
          FloatingActionButton(
            heroTag: 'SecondButton',
            onPressed: () => PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: Scaffold(
                  appBar: AppBar(),
                  body: Container(
                      alignment: Alignment.center,
                      child: const Text("Second screen"))),
              withNavBar: false, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            ),
            child: const Text("2"),
          )
        ],
      ),
    );
  }
}

class Bonjour extends StatelessWidget {
  const Bonjour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bonjour'),
      ),
      body: Container(
          alignment: Alignment.center, child: const Text("Bonjour screen")),
    );
  }
}
