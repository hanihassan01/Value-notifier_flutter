import 'package:flutter/material.dart';
import 'package:valuenotifier/one.dart';
import 'package:valuenotifier/three.dart';
import 'package:valuenotifier/two.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List screen = [const Homme(), const Menu(), const Settings()];

  ValueNotifier notifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: notifier,
        builder: (context, value, _) {
          return Scaffold(
            body: screen[value],
            appBar: AppBar(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
              title: Center(
                  child: const Text(
                "value notifier ",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
              )),
              titleTextStyle:
                  TextStyle(color: Color.fromARGB(255, 255, 248, 248)),
              backgroundColor: Color.fromARGB(255, 73, 133, 82),
              actions: [
                PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(child: Text("Profile")),
                      PopupMenuItem(
                        child: Text("Add Location"),
                      )
                    ];
                  },
                )
              ],
            ),
            backgroundColor: Color.fromARGB(255, 210, 229, 245),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.auto_awesome_mosaic), label: "menu"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "settings")
              ],
              currentIndex: notifier.value,
              onTap: (value) {
                notifier.value = value;
              },
            ),
          );
        });
  }
}