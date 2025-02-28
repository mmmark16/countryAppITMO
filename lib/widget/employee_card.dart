import 'package:educational_practice/global.dart';
import 'package:flutter/material.dart';

import '../page/employee_page.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: GestureDetector(
        onTap: () {
          currentCountry = allCountry[index];
          FocusScope.of(context).requestFocus(new FocusNode());
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const EmployeePage(),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
              color:
                  isBlack ? Colors.blueGrey : Color.fromRGBO(135, 206, 250, 1),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: 80,
          width: MediaQuery.of(context).size.width / 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Text(
                    'Название страны:',
                    style: Theme.of(context).textTheme.headline1,
                  )),
              Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    allCountry[index].name.official ??
                        "Ошибка получения данных",
                    style: Theme.of(context).textTheme.headline1,
                    overflow: TextOverflow.ellipsis,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
