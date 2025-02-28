import 'package:educational_practice/model/Country.dart';
import 'package:flutter/material.dart';

import '../global.dart';
import '../widget/rowCurrentCountry.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isBlack
          ? Color.fromRGBO(75, 0, 130, 1)
          : Color.fromRGBO(175, 238, 238, 1),
      appBar: AppBar(
        backgroundColor: isBlack ? Colors.blueGrey : Colors.deepPurple.shade200,
        title: Text("Информация о стране"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              RowCurrentCountry(
                title: "Название:",
                info: currentCountry.name.official,
              ),
              RowCurrentCountry(
                title: "Независимость:",
                info:  currentCountry.independent ? "Независима" : "Зависима",
              ),
              RowCurrentCountry(
                title: "Столица:",
                info:   currentCountry.capital[0],
              ),
              RowCurrentCountry(
                title: "Регион расположения:",
                info:   currentCountry.region,
              ),
              RowCurrentCountry(
                title: "Основной язык в стране:",
                info:   currentCountry.languages["${currentCountry.languages.keys.first}"]!
              ),
              RowCurrentCountry(
                title: "Площадь км²",
                info:   currentCountry.area.toString(),
              ),
              RowCurrentCountry(
                title: "Площадь км²",
                info:   currentCountry.area.toString(),
              ),
              RowCurrentCountry(
                title: "Ссылки на карты",
                info:   "${currentCountry.maps.googleMaps} \n\n${currentCountry.maps.openStreetMaps}",
              ),RowCurrentCountry(
                title: "Население",
                info:   currentCountry.population.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
