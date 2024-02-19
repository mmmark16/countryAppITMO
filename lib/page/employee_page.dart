import 'package:educational_practice/global.dart';
import 'package:flutter/material.dart';

class EmployeePage extends StatelessWidget {
  const EmployeePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(175, 238, 238, 1),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Информация"),
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
                decoration: BoxDecoration(
                    color: Color.fromRGBO(135, 206, 250, 1),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                width: MediaQuery.of(context).size.width / 1.5,
                child: Center(
                    child: Text(
                        "Имя сотрудника: ${currentPerson.firstName}" ??
                            "Ошибка получения данных",
                        style: TextStyle(fontSize: 24))),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(135, 206, 250, 1),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                width: MediaQuery.of(context).size.width / 1.5,
                child: Center(
                    child: Text(
                  "Фамилия сотрудника: ${currentPerson.lastName}" ??
                      "Ошибка получения данных",
                  style: TextStyle(fontSize: 24),
                )),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(135, 206, 250, 1),
                      borderRadius: BorderRadius.all(Radius.circular(5))),

                  child: Text(
                      "Почта сотрудника: \n${currentPerson.email}" ??
                          "Ошибка получения данных",
                      style: TextStyle(fontSize: 24)),
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
