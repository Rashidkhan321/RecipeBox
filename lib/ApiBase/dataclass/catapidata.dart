import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:recipebox/ApiBase/modal/catmodal.dart';

import '../modal/recipemodal.dart';

class catapi{

  Future<catmodal> getdata() async{

    final response =await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/list.php?c=list'));

    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){

      return catmodal.fromJson(data);

    }
    else{
      return throw Exception('no data');
    }


  }


}