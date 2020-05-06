import 'dart:convert';

import 'package:food_app/src/models/food_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class FoodModel extends Model{
  List<Food> _foods = [];

  List<Food> get foods{
    return List.from(_foods);
  }

  void addFood(Food food){
    _foods.add(food);
  }

  void fetchFoods(){
    http.get("http://192.168.0.13:8012/flutter_food_api/api/foods/getfoods.php")
        .then((http.Response response){
          //print("fetching data: ${response.body}");

          final List fetchedData = json.decode(response.body);
          final List<Food> fetchedFoodItems = [];

          print(fetchedData);
          fetchedData.forEach((data){
            Food food = Food(
              id: data["id"],
              name: data["name"],
              category: data["category_id"],
              price: double.parse(data["price"]),
              discount: double.parse(data["discount"]),
              imagePath: data["imagepath"],
              ratings: double.parse(data["ratings"]),
            );
            fetchedFoodItems.add(food);
          });
          _foods = fetchedFoodItems;
        });
  }
}