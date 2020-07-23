import 'package:flutter/material.dart';
import 'package:food_app/src/pages/signin_page.dart';
import 'package:food_app/src/widgets/order_card.dart';

class OrderPage extends StatefulWidget{
  @override
  _OrderPageState createState()=> _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal:10.0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          OrderCard(),
          OrderCard(),
          OrderCard(),
          OrderCard(),
          OrderCard(),
          OrderCard(),
        ],
      ),
      bottomNavigationBar: _buildTotalContainer(),
    );
  }

  Widget _buildTotalContainer(){
    return Container(
      height:220.0,
      margin: EdgeInsets.only(top:20.0),
      padding: EdgeInsets.symmetric(horizontal:10.0),
      child: Column(
        children:<Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Cart Total", style: TextStyle(fontSize:16.0, fontWeight:FontWeight.bold, color:Colors.black),),
              Text("23.0", style: TextStyle(fontSize:16.0, fontWeight:FontWeight.bold, color:Colors.black),),
            ],
          ),
          SizedBox(height:10.0),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Discount", style: TextStyle(fontSize:16.0, fontWeight:FontWeight.bold, color:Colors.black),),
              Text("3.0", style: TextStyle(fontSize:16.0, fontWeight:FontWeight.bold, color:Colors.black),),
            ],
          ),
          SizedBox(height:10.0),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Tax", style: TextStyle(fontSize:16.0, fontWeight:FontWeight.bold, color:Colors.black),),
              Text("0.5", style: TextStyle(fontSize:16.0, fontWeight:FontWeight.bold, color:Colors.black),),
            ],
          ),
          Divider(height:40.0, color:Color(0xFFD3D3D3),),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Sub Total", style: TextStyle(fontSize:16.0, fontWeight:FontWeight.bold, color:Colors.black),),
              Text("26.5", style: TextStyle(fontSize:16.0, fontWeight:FontWeight.bold, color:Colors.black),),
            ],
          ),
          SizedBox(height:20),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => SignInPage()));
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height:50.0,
              decoration: BoxDecoration(
                color:Colors.blue,
                borderRadius: BorderRadius.circular(25.0)
              ),
              child: Center(
                child: Text(
                  "Proceed to Checkout",
                  style: TextStyle(
                    color:Colors.white,
                    fontWeight:FontWeight.bold,
                    fontSize:18.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height:20.0
          ),
        ],
      ),
    );
  }
}