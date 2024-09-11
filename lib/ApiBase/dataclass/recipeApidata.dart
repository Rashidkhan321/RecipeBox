import 'dart:convert';

import 'package:http/http.dart'as http;

import '../modal/recipemodal.dart';

class apidata{

  Future<recipemodal> getdata() async{

    final response =await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?f=b'));

    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){

      return recipemodal.fromJson(data);

    }
    else{
      return throw Exception('no data');
    }


  }


}