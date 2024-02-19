import 'model/Person.dart';

late List<Person> allPerson1;
late List<Person> allPerson2;
late List<Person> allPerson;

combineList(){
  allPerson = new List.from(allPerson1)..addAll(allPerson2);
}
late Person currentPerson;
