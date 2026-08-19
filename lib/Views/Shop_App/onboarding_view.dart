import 'package:flutter/material.dart';
import 'package:practice_project/Views/Shop_App/shop_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {

  bool _isPressed =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 10, // Half outside the screen
            top: MediaQuery.of(context).size.height / 2 - 350,
            child: Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                color: Color(0xff56af9b).withOpacity(0),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff56af9b).withOpacity(.2),
                    offset: const Offset(0, 0),
                    blurRadius: 10,
                    spreadRadius: 10,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: -150, // Half outside the screen
            top: MediaQuery.of(context).size.height / 2 - 300,
            child: Container(
              width: 210,
              height: 210,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 1,
                ),
              ),
            ),
          ),
          Positioned(
            right: -100, // Half outside the screen
            top: MediaQuery.of(context).size.height / 2 - 150,
            child: Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                color: Color(0xff56af9b).withOpacity(0),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff56af9b).withOpacity(.15),
                    offset: const Offset(0, 0),
                    blurRadius: 10,
                    spreadRadius: 10,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: -150, // Half outside the screen
            top: MediaQuery.of(context).size.height / 2 - 30,
            child: Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 1,
                ),
              ),
            ),
          ),
          Positioned(
            left: -80,
            top: MediaQuery.of(context).size.height / 2 - 30,
            child: Container(
              width: 190,
              height: 190,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(100)),
                color: Colors.grey.withOpacity(0),
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.15),
                    offset: const Offset(0, 0),
                    blurRadius: 10,
                    spreadRadius: 10,
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 100,),
              IntrinsicHeight(
                child: Row(
                  children: [
                    SizedBox(width: 30,),
                    RotatedBox(
                        quarterTurns: 3,
                        child: Text("Planto.Shop",style: TextStyle(fontSize: 20,fontFamily: "Inconslata"),)) ,
                    VerticalDivider(thickness: 1,color: Colors.grey,width: 25,),
                    Text("Wear a\nbag for\nEducation",
                      style: TextStyle(height: 1,
                          fontSize: 45,fontWeight: FontWeight.bold,fontFamily: "Inconslata"),)
                  ],
                ),
              ),

              const SizedBox(height: 30,),
              Image.network(
                  "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png",
                height: 300,
                width: 300,

              ),
              const SizedBox(height: 30,),
              Text(
                "Worldwide delivery",
                style: TextStyle(
                    fontFamily: "Inconslata",
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                "within 10-15 days",
                style: TextStyle(
                    fontFamily: "Inconslata",
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
              const SizedBox(height: 60,),
              GestureDetector(
                onTapDown: (_) => setState(() => _isPressed = true),
                onTapUp: (_) => setState(() => _isPressed = false),
                onTapCancel: () => setState(() => _isPressed = false),
                onTap: (){
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context)=>ShopView()));
                },
                child: AnimatedScale(
                  scale: _isPressed ? .95:1.0,
                  duration:const Duration(milliseconds: 100),
                  child: Container(
                    height: 70,
                    width: 70,

                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff56af9b),
                            offset: const Offset(0, 5),
                            blurRadius: 8,
                            spreadRadius: 0,
                          ),
                        ],
                      color: Color(0xff56af9b),
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: Center(child: Text("GO",style: TextStyle(
                        color: Colors.white,fontSize: 22),)),
                  ),
                ),
              )
            ],
          ),




        ],
      ),
    );
  }
}
