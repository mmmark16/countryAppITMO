import 'package:dio/dio.dart';
import '../global.dart';
import '../model/Country.dart';


Future getCountry() async {
  var dio = Dio();
  try {
    var response = await dio.get(
      "https://restcountries.com/v3.1/all",
    );
    if (response.statusCode == 200) {
      final _json = response.data;
      allCountry = List<CountryInfo>.from(
          _json.map((model) => CountryInfo.fromJson(model)));
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
