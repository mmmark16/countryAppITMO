import 'package:educational_practice/global.dart';
import 'package:educational_practice/widget/employee_card.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isBlack
          ? Color.fromRGBO(75, 0, 130, 1)
          : Color.fromRGBO(175, 238, 238, 1),
      appBar: AppBar(
        backgroundColor: isBlack ? Colors.blueGrey : Colors.deepPurple.shade200,
        title: Text(widget.title),
        actions: [
          PopupMenuButton<Text>(
              padding: EdgeInsets.zero,
              color: isBlack ? Colors.blueGrey : Colors.deepPurple.shade200,
              icon: isBlack
                  ? Icon(
                      Icons.brightness_2,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.sunny,
                      color: Colors.yellow,
                    ),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(child: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                            child: IconButton(
                          onPressed: () {
                            isBlack = true;
                            this.setState(() {});
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.brightness_2,
                            color: Colors.white,
                          ),
                        )),
                        IconButton(
                          onPressed: () {
                            isBlack = false;
                            this.setState(() {});
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.sunny,
                            color: Colors.yellow,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (MediaQuery.of(context).platformBrightness ==
                                Brightness.dark) {
                              isBlack = true;
                            } else {
                              isBlack = false;
                            }
                            this.setState(() {});
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.settings,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    );
                  }))
                ];
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: allCountry.length,
                itemBuilder: (BuildContext context, int index) {
                    return EmployeeCard(
                      index: index,
                    );
                },
              ),
      ),
    );
  }
}
