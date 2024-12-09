import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../fruit/FruitAndVeg.dart';

class FruitPage extends StatelessWidget {
  FruitItem fruitorVeg ;
  FruitPage({super.key, required this.fruitorVeg});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent[100],
      appBar: AppBar(),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(height: 300.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                         fruitorVeg.imageUrlInternet!
                      ),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(blurRadius: 8.0)
                    ]
                  ) ,
                 ),
              ),// Image

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10),


                  ),
                  child:  Text(fruitorVeg.name!,
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Comforta',
                    ),),

                  ),
              ),// Name
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Center(
                    child: Text(fruitorVeg.botanicalName!,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: "Comforta"
                    ),),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Center(child: Text(fruitorVeg.otherName!,
                  style: TextStyle(
                    fontFamily: "Comforta",
                  ),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Center(child: Text(fruitorVeg.description!,
                  style: TextStyle(
                    fontFamily: "Comforta"
                  ),),

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Center(child: Text(fruitorVeg.health!,
                  style: TextStyle(
                    fontFamily: "Comforta"
                  ),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Center(child: Text(fruitorVeg.uses!,
                  style: TextStyle(
                    fontFamily: "Comforta"
                  ),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Center(child: Text(fruitorVeg.propagation!,
                  style: TextStyle(
                    fontFamily: "Comforta"
                  ),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Center(child: Text(fruitorVeg.soil!,
                  style: TextStyle(
                    fontFamily: "Comforta"
                  ),)),
                ),
              ),




            ],
          )
        ],
      ),

    );
  }
}
