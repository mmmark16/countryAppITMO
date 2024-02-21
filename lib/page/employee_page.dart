import 'package:educational_practice/global.dart';
import 'package:educational_practice/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({
    super.key,
  });

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  late bool _favorite;
  late int rating;

  @override
  initState() {
    super.initState();
    if (allFavorite[currentPerson.id! - 1] == "false"){
      _favorite = false;
    } else {
      _favorite = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: isBlack ? Color.fromRGBO(75, 0, 130, 1) : Color.fromRGBO(175, 238, 238, 1),
        appBar: AppBar(
          backgroundColor: isBlack ? Colors.blueGrey : Colors.deepPurple.shade200,
          title: Text("Информация"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                  onPressed: () async {
                    _favorite = !_favorite;
                    allFavorite[currentPerson.id! - 1] = _favorite.toString();
                    await prefs.setStringList("favorite", allFavorite);
                      allPerson[currentPerson.id! - 1].favorite = _favorite;
                    setState(() {
                    });
                  },
                  icon: _favorite
                      ? Icon(
                          Icons.favorite,
                    color: isBlack ? Colors.white : Colors.red,
                        )
                      : Icon(
                          Icons.favorite_border,
                    color: isBlack ? Colors.white : Colors.red,
                        )),
            )
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 36, bottom: 36),
                child: Image.network(currentPerson.avatar ??
                    "https://googleflutter.com/sample_image.jpg"),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: isBlack ? Colors.blueGrey : Color.fromRGBO(135, 206, 250, 1),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                width: MediaQuery.of(context).size.width / 1.5,
                child: Center(
                    child: Text(
                        "Имя сотрудника: ${currentPerson.firstName}" ??
                            "Ошибка получения данных",
                        style: Theme.of(context).textTheme.headline2)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: isBlack ? Colors.blueGrey : Color.fromRGBO(135, 206, 250, 1),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                width: MediaQuery.of(context).size.width / 1.5,
                child: Center(
                    child: Text(
                  "Фамилия сотрудника: ${currentPerson.lastName}" ??
                      "Ошибка получения данных",
                      style: Theme.of(context).textTheme.headline2,
                )),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: isBlack ? Colors.blueGrey : Color.fromRGBO(135, 206, 250, 1),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Text(
                      "Почта сотрудника: \n${currentPerson.email}" ?? "Ошибка получения данных",
                      style: Theme.of(context).textTheme.headline2),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: isBlack ? Colors.blueGrey : Color.fromRGBO(135, 206, 250, 1),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Text(
                      "Рейтинг сотрудника: ${allRating[currentPerson.id! - 1].toString()}/5" ?? "Ошибка получения данных",
                      style: Theme.of(context).textTheme.headline2),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text("Изменить оценку:",
                    style: Theme.of(context).textTheme.headline2),
                decoration: BoxDecoration(
                    color: isBlack ? Colors.blueGrey : Color.fromRGBO(135, 206, 250, 1),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () async {
                      allRating[currentPerson.id!-1] = "1";
                      await prefs.setStringList("rating", allRating);
                      setState(() {
                      });
                    },
                    child: Container(
                      width: 36,
                      decoration: BoxDecoration(
                          color: isBlack ? Colors.blueGrey : Color.fromRGBO(135, 206, 250, 1),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Center(
                          child: Text("1",
                              style: Theme.of(context).textTheme.headline2),
                        ),
                    ),
                  ),GestureDetector(
                    onTap: () async {
                      allRating[currentPerson.id!-1] = "2";
                      await prefs.setStringList("rating", allRating);
                      setState(() {
                      });
                    },
                    child: Container(
                      width: 36,
                      decoration: BoxDecoration(
                          color: isBlack ? Colors.blueGrey : Color.fromRGBO(135, 206, 250, 1),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Center(
                          child: Text("2",
                              style: Theme.of(context).textTheme.headline2),
                        ),
                    ),
                  ),GestureDetector(
                    onTap: () async {
                      allRating[currentPerson.id!-1] = "3";
                      await prefs.setStringList("rating", allRating);
                      setState(() {
                      });
                    },
                    child: Container(
                      width: 36,
                      decoration: BoxDecoration(
                          color: isBlack ? Colors.blueGrey : Color.fromRGBO(135, 206, 250, 1),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Center(
                          child: Text("3",
                              style: Theme.of(context).textTheme.headline2),
                        ),
                    ),
                  ),GestureDetector(
                    onTap: () async {
                      allRating[currentPerson.id!-1] = "4";
                      await prefs.setStringList("rating", allRating);
                      setState(() {
                      });
                    },
                    child: Container(
                      width: 36,
                      decoration: BoxDecoration(
                          color: isBlack ? Colors.blueGrey : Color.fromRGBO(135, 206, 250, 1),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Center(
                          child: Text("4",
                              style: Theme.of(context).textTheme.headline2),
                        ),
                    ),
                  ),GestureDetector(
                    onTap: () async {
                      allRating[currentPerson.id!-1] = "5";
                      await prefs.setStringList("rating", allRating);
                      setState(() {
                      });
                    },
                    child: Container(
                      width: 36,
                      decoration: BoxDecoration(
                          color: isBlack ? Colors.blueGrey : Color.fromRGBO(135, 206, 250, 1),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Center(
                          child: Text("5",
                              style: Theme.of(context).textTheme.headline2),
                        ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
