import 'package:flutter/material.dart';
import 'package:food_app/src/models/food_model.dart';
import 'package:food_app/src/scoped-model/main_model.dart';
import 'package:food_app/src/widgets/Button.dart';
import 'package:scoped_model/scoped_model.dart';

class AddFoodItem extends StatefulWidget {
  AddFoodItem({Key key}) : super(key: key);

  @override
  _AddFoodItemState createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {
  String title;
  String category;
  String description;
  String price;
  String discount;

  GlobalKey<FormState> _foodItemFormKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldStateKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldStateKey,
       body: SingleChildScrollView(
        child: Container(
           padding: EdgeInsets.symmetric(vertical:60.0, horizontal:16.0),
          //  width: MediaQuery.of(context).size.width,
          //  height: MediaQuery.of(context).size.height,
           child: Form(
             key: _foodItemFormKey,
             child: Column(
               children:<Widget>[
                 Container(
                   margin:EdgeInsets.only(bottom:15.0),
                   width: MediaQuery.of(context).size.width,
                   height: 170.0,
                   decoration: BoxDecoration(
                    //color:Colors.red,
                    borderRadius: BorderRadius.circular(10.0),
                    image:DecorationImage(
                      image:AssetImage(
                        "assets/images/noimage.png"
                      ),
                    ),
                   ),
                 ),
                 _buildTextFormField("Food Title"),
                 _buildTextFormField("Category"),
                 _buildTextFormField("Description", maxLine:3),
                 _buildTextFormField("Price", inputType:TextInputType.number),
                 _buildTextFormField("Discount", inputType:TextInputType.number),
                SizedBox(height: 55.0),
                ScopedModelDescendant(
                  builder: (BuildContext context, Widget child, MainModel model){
                    return GestureDetector(
                      onTap: (){
                        onSubmit(model);
                        if(model.isloading){
                          showLoadingIndicator();
                        }
                      },
                      child: Button(
                        btnText: "Add Food Item"
                      )
                    );
                  }
                ),
               ]
             ),
           ),
         ),
       ),
    );
  }

  Future<void> showLoadingIndicator(){
    return showDialog(
      context: context,
      barrierDismissible:false,
      builder:(BuildContext context){
        return AlertDialog(
          content:Row(
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(width: 10.0,),
              Text("Adding food item..."),
            ],
          ),          
        );
      },
    );
  }
  void onSubmit(MainModel model) async{
    if(_foodItemFormKey.currentState.validate()){
      _foodItemFormKey.currentState.save();

      final Food food = Food(
        name:title,
        category:category,
        description: description,
        price: double.parse(price),
        discount: double.parse(discount)
      );
      bool value = await model.addFood(food);
      if(value == true){
        Navigator.of(context).pop();
        SnackBar snackBar = SnackBar(
          content: Text("food item added successfully")
        );
        _scaffoldStateKey.currentState.showSnackBar(snackBar);
      }
      else{
        Navigator.of(context).pop();
        SnackBar snackBar = SnackBar(
          content: Text("Failed to add food item")
        );
        _scaffoldStateKey.currentState.showSnackBar(snackBar);        
      }
    }    
  }
  Widget _buildTextFormField(String hint, {int maxLine = 1, TextInputType inputType = TextInputType.text}){
    return                
    TextFormField(
      decoration: InputDecoration(
        hintText: "$hint"
      ),
      maxLines: maxLine,
      keyboardType: inputType,
      validator: (String value){
        var errMsg;
        if(value.isEmpty && hint == "Food Title"){
          errMsg = "The food title is required";
        }
        if(value.isEmpty && hint == "Category"){
          errMsg = "The category is required";
        }
        if(value.isEmpty && hint == "Description"){
          errMsg = "The description is required";
        }
        if(value.isEmpty && hint == "Price"){
          errMsg = "The price is required";
        }                       
        return errMsg;
      },
      onChanged: (String value){
        if(hint == "Food Title"){
          title = value;
        }
        if(hint == "Category"){
          category = value;
        }
        if(hint == "Description"){
          description = value;
        }
        if(hint == "Price"){
          price = value;
        }
        if(hint == "Discount"){
          discount = value;
        }
      },
    );
  }
}
