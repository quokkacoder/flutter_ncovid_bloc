import 'dart:convert';
import 'package:demo_bloc_corona/model/country.dart';
import 'package:http/http.dart' as http;

class CoronaApi{
  final String _url = 'https://coronavirus-19-api.herokuapp.com';

  @override
  Future<List<CountCountry>> getCountList() async {
    final urlGetCountries = '$_url/countries';

    try{
      var response = await http.get(urlGetCountries,);
      if(response.statusCode != 200){
        throw Exception('>>> Fetch corona error with status: ${response.statusCode}');
      }else{
        print(response.body);
        var data = List<CountCountry>();
        final responseJson = json.decode(response.body);
        for(dynamic x in responseJson) {
          final country = CountCountry.fromJson(x);
          data.add(country);
        }
        return data;
      }
    }catch(e){
      throw Exception('>>> Fetch corona error : ${e.toString()}');
    }
  }
}