import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
// class Album {
//   final int userId;
//   final int id;
//   final String title;

//   Album({
//     required this.userId,
//     required this.id,
//     required this.title,
//   });

//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }

class Nutritionpage extends StatefulWidget {
  Nutritionpage({Key? key}) : super(key: key);

  @override
  _NutritionpageState createState() => _NutritionpageState();
}

class _NutritionpageState extends State<Nutritionpage> {
  var futurenutri;
  // ignore: prefer_typing_uninitialized_variables
  var fooditem;
  // ignore: prefer_typing_uninitialized_variables
  var nutri;
  TextEditingController search = TextEditingController();
  List fooditemoutput = [];
  String? replaceWhitespaces(String s, String replace) {
    // ignore: unnecessary_null_comparison
    if (s == null) {
      return null;
    }
    var s1 = s.replaceAll(',', "%2C");

    return s1.replaceAll(' ', replace);
  }

  Future<dynamic> getData() async {
    var response = await http.get(
        Uri.parse(
            'https://nutrition-by-api-ninjas.p.rapidapi.com/v1/nutrition?query=$fooditem'),
        headers: {
          'x-rapidapi-host': 'nutrition-by-api-ninjas.p.rapidapi.com',
          'x-rapidapi-key': 'b5e366e646msh24e4c9775b01424p1a625fjsnf41e0d7c9961'
        });
    setState(() {
      futurenutri = jsonDecode(response.body);
      print(futurenutri);
    });

    // print(nutri);

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    // fooditem = search.text;
    // print(fooditem);
    // getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            fooditem = replaceWhitespaces(search.text, "%20");

            futurenutri = getData();
          });
        },
      ),
      appBar: AppBar(
        title: Text("Nutrition fetch"),
      ),
      body: Column(
        children: [
          CupertinoTextField(controller: search),
        ],
      ),
    );
  }
}

// class Nutrition {
//   String? name;
//   double? calories;
//   double? servingSizeG;
//   double? fatTotalG;
//   double? fatSaturatedG;
//   int? proteinG;
//   int? sodiumMg;
//   int? potassiumMg;
//   int? cholesterolMg;
//   int? carbohydratesTotalG;
//   int? fiberG;
//   int? sugarG;

//   Nutrition(
//       {this.name,
//       this.calories,
//       this.servingSizeG,
//       this.fatTotalG,
//       this.fatSaturatedG,
//       this.proteinG,
//       this.sodiumMg,
//       this.potassiumMg,
//       this.cholesterolMg,
//       this.carbohydratesTotalG,
//       this.fiberG,
//       this.sugarG});

//   Nutrition.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     calories = json['calories'];
//     servingSizeG = json['serving_size_g'];
//     fatTotalG = json['fat_total_g'];
//     fatSaturatedG = json['fat_saturated_g'];
//     proteinG = json['protein_g'];
//     sodiumMg = json['sodium_mg'];
//     potassiumMg = json['potassium_mg'];
//     cholesterolMg = json['cholesterol_mg'];
//     carbohydratesTotalG = json['carbohydrates_total_g'];
//     fiberG = json['fiber_g'];
//     sugarG = json['sugar_g'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['calories'] = this.calories;
//     data['serving_size_g'] = this.servingSizeG;
//     data['fat_total_g'] = this.fatTotalG;
//     data['fat_saturated_g'] = this.fatSaturatedG;
//     data['protein_g'] = this.proteinG;
//     data['sodium_mg'] = this.sodiumMg;
//     data['potassium_mg'] = this.potassiumMg;
//     data['cholesterol_mg'] = this.cholesterolMg;
//     data['carbohydrates_total_g'] = this.carbohydratesTotalG;
//     data['fiber_g'] = this.fiberG;
//     data['sugar_g'] = this.sugarG;
//     return data;
//   }
// }

// Future<Nutrition> fetchfooddata() async {
//   var response = await http.get(
//       Uri.parse(
//           'https://nutrition-by-api-ninjas.p.rapidapi.com/v1/nutrition?query=1%20egg%2C%20chicken%20tikka%2C%20apple'),
//       headers: {
//         'x-rapidapi-host': 'nutrition-by-api-ninjas.p.rapidapi.com',
//         'x-rapidapi-key': 'b5e366e646msh24e4c9775b01424p1a625fjsnf41e0d7c9961'
//       });

//   if (response.statusCode == 200) {
//     print(response);
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Nutrition.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }
