import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/Person.dart';

late SharedPreferences prefs;
late List<String> allFavorite;
late List<String> allRating;
late List<Person> allPerson1;
late List<Person> allPerson2;
late List<Person> allPerson;
bool isBlack = false;

combineList(){
  allPerson = new List.from(allPerson1)..addAll(allPerson2);
}
late Person currentPerson;
