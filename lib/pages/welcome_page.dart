import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';


import 'nav_pages/main_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  List images=[
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PageView.builder(
          itemCount: images.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context,index){ //kaydırmalı sayfa
            return Container(
              width: double.maxFinite, //ekranın tümünü kaplamak için
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("img/${images[index]}") ,
                  fit: BoxFit.cover //Ekranı kaplaması için.
                ),
              ),
              child: Container( //containerin faydası margin ve padding verebiliyoruz.
                margin: const EdgeInsets.only(top: 150,left: 20,right: 20) ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "Trips"),
                        AppText(text: "Mountain",size: 30,),
                        SizedBox(height:20 ,),

                        Container( // Paragraf var belli bir kelimeden sonra alta geçmesi için genişlik verdim.
                          width: 180,
                          child: AppText(text:"Mountain hikes give you an incredible sense of freedom along with endurance tests",size: 14,color: AppColors.textColor2,),
                        ),
                        SizedBox(height: 40,),
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
                          } ,
                            child: ResponsiveButton(width: 120,))


                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots) { //**************
                        return Container(
                          margin: EdgeInsets.only(bottom: 2),
                          width: 10,
                          height: index==indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                            color: index==indexDots ? AppColors.mainColor : AppColors.mainColor.withOpacity(0.3), //opacity=opaklık
                            borderRadius: BorderRadius.circular(8),

                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),

            );
          }) ,
    );
  }
}

