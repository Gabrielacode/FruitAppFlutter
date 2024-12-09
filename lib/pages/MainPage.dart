import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuitapp/fruit/FruitVegApi.dart';
import 'package:fuitapp/pages/FruitPage.dart';
import 'package:logo_n_spinner/logo_n_spinner.dart';

import '../fruit/FruitAndVeg.dart';

class MainPage extends StatelessWidget {
  SearchResultQuery<SearchResult>? allFruits ;

  MainPage({super.key, this.allFruits }){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body:SafeArea(
        child:  MainPageBody(allFruits: allFruits,),) ,

    );
  }
}

class MainPageBody extends StatefulWidget {
   SearchResultQuery<SearchResult>? allFruits ;
  MainPageBody({super.key, required this.allFruits});


  @override
  State<MainPageBody> createState() => _MainPageBodyState();
}

class _MainPageBodyState extends State<MainPageBody> {
   bool gridViewOn = false;
   String? errorMessage ;

 void  loadFruitPageofItem(BuildContext context, String fruitItemName) async{
   showDialog(context: context, builder: (context){
     return LogoandSpinner(imageAssets: "assets/logo/homePageLoadingLogo.jpg");
   });
   FruitItem item  = await FruitAndVegApi().getFruitorVeg(fruitItemName);
   Navigator.pop(context);
   Navigator.push(context, MaterialPageRoute(builder: (context)=>FruitPage(fruitorVeg: item,)));
 }
   @override
  void initState() {
     errorMessage = widget.allFruits?.errorMessage;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            Text((gridViewOn)?"List View":"Grid View"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Switch(value: gridViewOn, onChanged: (newValue){
                     setState(() {
             gridViewOn = newValue;
                     });
                   }),
          )

        ],),
        Divider(height: 6.0,),
        Expanded(
          child: (gridViewOn == true)?
          GridView.builder(
              itemCount: widget.allFruits?.resultList?.length??0,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 3.0,crossAxisSpacing: 3.0),
              itemBuilder: (context , index){
                return GestureDetector(
                  child: GridTile(
                    child: Text(widget.allFruits?.resultList?[index]?.name??"No Name"),

                  ),
                  onTap :(){
                    loadFruitPageofItem(context, widget!.allFruits!.resultList![index]!.name!);
                  },
                );
              }):
          ListView.builder(
              itemCount:widget.allFruits?.resultList?.length??0 ,
              itemBuilder: (context, index){
                return
                  ListTile(
                      title: Text(widget.allFruits!.resultList![index]!.name!),
                      onTap: ()  {
                        loadFruitPageofItem(context,widget.allFruits!.resultList![index]!.name!);
                      }
                  );

              }),
        ),


      ],
    );
  }
}

