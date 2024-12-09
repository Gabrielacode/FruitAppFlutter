import 'package:flutter/material.dart';
import 'package:fuitapp/fruit/FruitAndVeg.dart';
import 'package:fuitapp/fruit/FruitVegApi.dart';
import 'package:logo_n_spinner/logo_n_spinner.dart';

import 'MainPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[400],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text("verdura",
            style: TextStyle(
             fontFamily: "Verdura",
              fontSize: 65.0,
              color: Colors.lightGreen[700],
              fontWeight: FontWeight.w400

            )),
            HomeButton(),
          ]
        ),
      )
    );
  }
}

class HomeButton extends StatefulWidget {
  const HomeButton({super.key});



  @override
  State<HomeButton> createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  bool errorLoadingMainPage = false;
  late String errorMessage;
  
  void loadMainPage(BuildContext context) async{
    showDialog(context: context, builder: (context){

   return Dialog(

          child: LogoandSpinner(
           imageAssets: "assets/logo/homePageLoadingLogo.jpg",
          
           arcColor: Colors.amberAccent, ),
        );
 });
    var result = await FruitAndVegApi().searchFruitOrVeg("all");
    print (result);
    if(result.errorMessage !=null){
      print("Is String");
      Navigator.pop(context);
      errorMessage = result.errorMessage!;
      setState(() {
        errorLoadingMainPage = true;
      });
    }else {
      print("Is Not");
      Navigator.pop(context);
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => MainPage(allFruits: result)));
    }
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
      Opacity(
      opacity: 0.75,
      child: ElevatedButton(
          onPressed: (){
            loadMainPage(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.amber,


          ),
          child: Text("view",
            style: TextStyle(
              fontFamily: "Comforta",
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),)
      ),
    ),
        SizedBox(height:10.0),
        Text((errorLoadingMainPage)?errorMessage:""),
      ],
    );
  }
}
