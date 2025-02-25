import 'package:dio/dio.dart';
import '../global.dart';
import '../model/Country.dart';
import '../model/Person.dart';

Future getPerson1() async {
  var dio = Dio();
  try {
    var response = await dio.get(
      "https://reqres.in/api/users?page=1",
    );
    if (response.statusCode == 200) {
      final _json = response.data;
      allPerson1 = List<Person>.from(
          _json['data'].map((model) => Person.fromJson(model)));
      return "success";
    }
  } on DioError catch (e) {
    print("getPerson fail " +
        DateTime.now().toString() +
        " reason " +
        e.message.toString());
    return "error" + (e.message ?? "");
  }
}

Future getPerson2() async {
  var dio = Dio();
  try {
    var response = await dio.get(
      "https://reqres.in/api/users?page=2",
    );
    if (response.statusCode == 200) {
      final _json = response.data;
      allPerson2 = List<Person>.from(
          _json['data'].map((model) => Person.fromJson(model)));
      return "success";
    }
  } on DioError catch (e) {
    print("getPerson fail " +
        DateTime.now().toString() +
        " reason " +
        e.message.toString());
    return "error" + (e.message ?? "");
  }
}

Future getCountry() async {
  var dio = Dio();
  try {
    var response = await dio.get(
      "https://restcountries.com/v3.1/all",
    );
    if (response.statusCode == 200) {
      final _json = response.data;
      allCountry = List<CountryInfo>.from(
          _json['data'].map((model) => CountryInfo.fromJson(model)));
      return "success";
    }
  } on DioError catch (e) {
    print("getCountry fail " +
        DateTime.now().toString() +
        " reason " +
        e.message.toString());
    return "error" + (e.message ?? "");
  }
}
