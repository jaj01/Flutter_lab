import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit Shopping',
      home: Scaffold(
        appBar: AppBar(title: Text('Fruit Shop', style: TextStyle(
          fontSize: 20, letterSpacing: 12
        )),
        backgroundColor: const Color.fromARGB(255, 255, 183, 207),
        ),
        body: ListView(
          children: [
            MyListItem(fruitname: 'Orange', imageurl: 'assets/images/orange.jpeg', price:200.00),
            MyListItem(fruitname: 'Mango', imageurl: 'assets/images/mango.jpeg', price:250.00),
            MyListItem(fruitname: 'Strawberry', imageurl: 'assets/images/strawberry1.jpeg', price:200.00),
            MyListItem(fruitname: 'Watermelon', imageurl: 'assets/images/watermelon.jpg', price:300.00),
            MyListItem(fruitname: 'Banana', imageurl: 'assets/images/banana.jpeg', price:120.00),

          ]

        )
      ,)
    ,);
  }
}
// for commit.
class MyListItem extends StatelessWidget {
  final String fruitname, imageurl;
  final double price;
  MyListItem({super.key, required this.fruitname, required this.imageurl, required this.price});
  final inrFormat = NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits:2);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey, width:0.5)
        ),
        elevation: 1,
        color: Colors.white,
        child: Row(children: [
          Container(
            padding: EdgeInsets.all(12),
          color: Colors.grey[200],
          width:200,
          height: 200,
          child: Image.asset(imageurl, width: 160, height: 150, fit: BoxFit.cover),
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(fruitname, style: TextStyle(fontSize: 20,
            fontWeight: FontWeight.w600
            ),),
            SizedBox(height: 20),
            Text(inrFormat.format(price), style: TextStyle(
              fontSize: 18,
            )),
            SizedBox(height: 20),
            ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white
            ), child: Text('Buy Now'),
            )
          ],)
        ],)
      ,);
  }
}