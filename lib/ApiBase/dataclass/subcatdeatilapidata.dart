import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:recipebox/ApiBase/modal/catmodal.dart';
import 'package:recipebox/ApiBase/modal/subcatdeatilmodal.dart';

import '../modal/recipemodal.dart';

class subcatdeatilapidata{

  Future<subcatdetailmodal> getdata(String id) async{

    final response =await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id'));

    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){

      return subcatdetailmodal.fromJson(data);

    }
    else{
      return throw Exception('no data');
    }


  }


}