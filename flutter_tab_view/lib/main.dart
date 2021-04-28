import 'package:flutter/material.dart';

void main() {
  runApp(TabbedApp());
}

class TabbedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
              title: Center(child: const Text("Maps")),
              bottom: TabBar(
                isScrollable: true,
                tabs: choices.map<Widget>((Choice choice) {
                  return Tab(
                    text: choice.title,
                    icon: Icon(choice.icon),
                  );
                }).toList(),
              )),
          body: TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ChoicePage(
                  choice: choice,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class Choice {
  final IconData icon;
  final String title;
  const Choice({this.icon, this.title});
}

final List<Choice> choices = [
  Choice(icon: Icons.directions_bike, title: "Bike"),
  Choice(icon: Icons.directions_car, title: "Car"),
  Choice(icon: Icons.directions_train, title: "Train"),
  Choice(icon: Icons.directions_walk, title: "Walk"),
  Choice(icon: Icons.directions_boat, title: "Boat"),
  Choice(icon: Icons.directions_subway, title: "Metro"),
];

class ChoicePage extends StatelessWidget {
  const ChoicePage({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            choice.icon,
            size: 150.0,
            color: textStyle.color,
          ),
          Text(
            choice.title,
            style: textStyle,
          )
        ],
      )),
    );
  }
}
