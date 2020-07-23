import 'package:flutter/material.dart';
import 'package:food_app/src/scoped-model/main_model.dart';
//import 'package:food_app/src/scoped-model/food_model.dart';
import 'package:food_app/src/widgets/bought_foods.dart';
import 'package:food_app/src/widgets/food_category.dart';
import 'package:food_app/src/widgets/home_top_info.dart';
import 'package:food_app/src/widgets/search_field.dart';
import 'package:food_app/src/models/food_model.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatefulWidget{
  // final FoodModel foodModel;
  // HomePage(this.foodModel);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  // List<Food> _foods = foods;

  @override
  void initState() {
    //widget.foodModel.fetchFoods();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:ListView(
        padding: EdgeInsets.only(left:20.0, right:20.0),
        children: <Widget>[
          HomePageTopInfo(),
          Foodcategory(),
          SizedBox(height:10.0),
          SearchField(),
          SizedBox(height:10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Frequently bought foods",
                style:TextStyle(
                  fontSize:18.0,
                  fontWeight: FontWeight.bold,
                )
              ),
              GestureDetector(
                onTap: (){

                },
                child: Text("View All",
                  style:TextStyle(
                    fontSize:18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent
                  )
                ),
              ),
            ],
          ),
          SizedBox(height:20.0),
          ScopedModelDescendant<MainModel>(
            builder: (BuildContext context, Widget child, MainModel model){
              return Column(
                children: model.foods.map(_buildFoodItems).toList(),            
              );
            },
          ),          
        ],
      ),
    );
  }

  Widget _buildFoodItems(Food food){
    return Container(
      margin: EdgeInsets.only(bottom:20.0),
      child:BoughtFoods(
        id:food.id,
        name: food.name,
        imagePath: "assets/images/lunch.jpeg",//food.imagePath,
        category: food.category,
        price: food.price,
        discount: food.discount,
        ratings: food.ratings,
      ),
    );
  }
}