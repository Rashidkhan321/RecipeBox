import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:recipebox/ApiBase/modal/subcatmodal.dart';

import '../modal/recipemodal.dart';

class subcatapidata{

  Future<subcatmodal> getdata(String query) async{

    final response =await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=$query'));

    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){

      return subcatmodal.fromJson(data);

    }
    else{
      return throw Exception('no data');
    }


  }


}