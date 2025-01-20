import 'dart:convert';
import 'package:flutter_application_1/utils/reg_exp.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/data_model.dart';

class FoodApi{

  // String url='https://www.themealdb.com/api/json/v1/1/categories.php';
    static Future<List<FoodModel>>fetchData()async{
    // List<FoodModel>mylist=[];
      var response = await http.get(Uri.parse(baseUrl));
    // final responce=await http.get(Uri.parse(url));
    if(response.statusCode==200){
        //  return (json.decode(response.body) as List)
        //   .map((e) => FoodModel.fromjson(e))
        //   .toList();



           var jsonData = json.decode(response.body);


    return (jsonData['categories'] as List)
        .map((e) => FoodModel.fromjson(e))
        .toList();
      // var data= jsonDecode(response.body);
      // for (var d in data) {
      //   FoodModel da=FoodModel.fromjson(d);
      //   mylist.add(da);
     

      // }
      // return mylist;
    }
    else{
     throw Exception('${response.statusCode}');
    }
    
    }
  }
