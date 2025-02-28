import 'package:educational_practice/model/Country.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

late List<CountryInfo> allCountry;
bool isBlack = false;
late CountryInfo currentCountry;
