import 'package:flutter/material.dart';

import '../global.dart';

class RowCurrentCountry extends StatelessWidget {
  final String title;
  final String info;
  const RowCurrentCountry({super.key, required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color:
            isBlack ? Colors.blueGrey : Color.fromRGBO(135, 206, 250, 1),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              child: Text(
                title,
                style: TextStyle(fontSize: 18),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.1,
              child: Text(
                info,
                style: TextStyle(fontSize: 18),
                maxLines: 10,
                overflow: TextOverflow.ellipsis, // Ellipsis for overflow
              ),
            )
          ],
        ),
      ),
    );
  }
}
