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
        onTap: (){
          currentPerson = allPerson[index];
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const EmployeePage(),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(135, 206, 250, 1),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 56,
                height: 56,
                child: Image.network(allPerson[index].avatar ?? "https://googleflutter.com/sample_image.jpg"),
              ),
              Text('Имя сотрудника:', style: TextStyle(fontSize: 16),),
              Text(allPerson[index].firstName ?? "Ошибка получения данных",  style: TextStyle(fontSize: 16),),
            ],
          ),
        ),
      ),
    );
  }
}
