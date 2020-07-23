import 'package:flutter/material.dart';
import 'package:food_app/src/admin/pages/add_food_item.dart';
import 'package:food_app/src/pages/favorite_page.dart';
import 'package:food_app/src/pages/home_page.dart';
import 'package:food_app/src/pages/order_page.dart';
import 'package:food_app/src/pages/profile_page.dart';
//import 'package:food_app/src/scoped-model/food_model.dart';
import 'package:food_app/src/scoped-model/main_model.dart';

class MainScreen extends StatefulWidget{
  final MainModel model;
  MainScreen({this.model});

  @override
  _MainScreenState createState()=>_MainScreenState();
}

class _MainScreenState extends State<MainScreen>{
  List<Widget> pages;
  Widget currentPage;
  int currentTabIndex = 0;
  HomePage homePage;
  OrderPage orderPage;
  FavoritePage favoritePage;
  ProfilePage profilePage;

  @override
  void initState() {
    //widget.foodModel.fetchFoods();
    widget.model.fetchFoods();

    homePage = HomePage();
    orderPage = OrderPage();
    favoritePage = FavoritePage();
    profilePage = ProfilePage();

    pages = [homePage, favoritePage, orderPage, profilePage];
    currentPage = homePage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.white,
          elevation:0,
          iconTheme: IconThemeData(color:Colors.black),
        ),
        drawer:Drawer(
          child:Column(
            children: <Widget>[
              ListTile(
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder:(BuildContext)=>AddFoodItem())
                  );
                },
                leading: Icon(Icons.list),
                title:Text("Add Food Item", style:TextStyle(fontSize:16.0),),
              ),
            ],
          ),
        ),
        resizeToAvoidBottomPadding: false,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index){
            setState(() {
              currentTabIndex = index;
              currentPage = pages[index];
            });
          },
          currentIndex: currentTabIndex,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title:Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              title:Text("Explore"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title:Text("Orders"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title:Text("Profile"),
            ),
          ],
        ),
        body: currentPage,
      ),
    );
  }
}