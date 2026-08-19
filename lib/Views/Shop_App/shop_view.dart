import 'package:flutter/material.dart';

class ShopView extends StatefulWidget {
  const ShopView({super.key});

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Find your\nfavorite bags"
                  ,style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    fontFamily:"Inconslata"),),
                Container(
                  height: 70,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.grey.shade400)
                  ),
                  child: Icon(Icons.search_rounded,size: 35,),
                )

              ],
            ),
          ),
          SizedBox(height: 30,),

          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    color: const Color(0xffD2EAC2),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("30% OFF",style: TextStyle(fontFamily: "inconsalata"),),
                          Text("02-23 July"),
                
                        ],
                      ),
                
                    ],
                  ),
                ),
              ),

              Positioned(
                right: 50,
                top: -10,
                child: Image.asset(
                  "assets/bag.png",
                  height: 150,
                  width: 115,

                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}
