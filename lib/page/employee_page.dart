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

  @override
  initState() {
    super.initState();
    print("что в алл фаворите");
    print(allFavorite[currentPerson.id! - 1]);
    if (allFavorite[currentPerson.id! - 1] == "false"){
      _favorite = false;
    } else {
      _favorite = true;
    }
    print("что в _favorite");
    print(_favorite.toString());
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
                    print(allFavorite);
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

            ],
          ),
        ));
  }
}
