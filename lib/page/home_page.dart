import 'package:educational_practice/global.dart';
import 'package:educational_practice/initBase.dart';
import 'package:educational_practice/widget/employee_card.dart';
import 'package:flutter/material.dart';

import '../model/Person.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

  String filter = "";
  bool search = false;
  bool fav = false;
  List<Person> filterPerson = [];

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = new TextEditingController();

  @override
  initState() {
    super.initState();
    initBD();
    controller.addListener(() {
      this.setState(() {
        filter = controller.text;
        print(filter);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(175, 238, 238, 1),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: search
              ? Padding(
                  padding: new EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0),
                  child: new TextField(
                    style: new TextStyle(
                      fontSize: 18.0,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: new Icon(Icons.search),
                      suffixIcon: new IconButton(
                        icon: new Icon(Icons.close),
                        onPressed: () {
                          search = false;
                          setState(() {});
                          controller.clear();
                          FocusScope.of(context).requestFocus(new FocusNode());
                        },
                      ),
                      hintText: "Поиск...",
                    ),
                    controller: controller,
                  ))
              : Text(widget.title),
          actions: [
            !search
                ? IconButton(
                    onPressed: () {
                      search = true;
                      setState(() {});
                    },
                    icon: Icon(Icons.search))
                : Container(),
            IconButton(
                onPressed: () {
                  filterPerson.clear();
                  fav = !fav;
                  for(int i = 0; i<allPerson.length; i++){
                    if ((allPerson[i].favorite == true)){
                      filterPerson.add(allPerson[i]);
                    }
                  }
                  print(filterPerson);
                  setState(() {
                  });
                },
                icon: fav
                    ? Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
                    : Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: fav ? ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: filterPerson.length,
            itemBuilder: (BuildContext context, int index) {
              if (filter == "") {
                return EmployeeCard(
                  index: filterPerson[index].id!-1,
                );
              } else {
                if ((filterPerson[index]
                    .firstName
                    .toString()
                    .toLowerCase()
                    .contains(filter.toLowerCase()))) {
                  return EmployeeCard(
                    index: index,
                  );
                } else {
                  return Container();
                }
              }
            },
          ) : ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: allPerson.length,
            itemBuilder: (BuildContext context, int index) {
              if (filter == "") {
                return EmployeeCard(
                  index: index,
                );
              } else {
                if ((allPerson[index]
                    .firstName
                    .toString()
                    .toLowerCase()
                    .contains(filter.toLowerCase()))) {
                  return EmployeeCard(
                    index: index,
                  );
                } else {
                  return Container();
                }
              }
            },
          ),
        ));
  }
}
