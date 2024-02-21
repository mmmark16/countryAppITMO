import 'package:shared_preferences/shared_preferences.dart';
import '../global.dart';


initBD() async{
  prefs = await SharedPreferences.getInstance();
  allFavorite = await prefs.getStringList("favorite") ?? <String>["false","false","false","false","false","false","false","false","false","false","false","false"];
  for (int i = 0; i<allPerson.length; i++){
    if (allFavorite[i] == "true"){
      allPerson[i].favorite = true;
    } else {
      allPerson[i].favorite = false;
    }
  }
  allRating = await prefs.getStringList("rating") ?? <String>["0","0","0","0","0","0","0","0","0","0","0","0"];
}