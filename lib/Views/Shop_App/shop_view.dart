import 'package:flutter/material.dart';
import 'package:practice_project/Providers/shop_provider.dart';
import 'package:practice_project/Utils/Components/tabContainer.dart';
import 'package:provider/provider.dart';

class ShopView extends StatefulWidget {
  const ShopView({super.key});

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {

  List<String> categoriesNames=["ALL","MENS","JEWELERY","ELECTRONICS","WOMENS"];

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
          const SizedBox(height: 30,),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    color: const Color(0xff8ca972),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "30% OFF",
                              style: TextStyle(
                                  fontFamily: "inconslata",
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "02-23 July",
                              style: TextStyle(
                                  fontFamily: "inconslata", fontSize: 23,color: Colors.black54),
                            ),
                          ],
                        ),
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
          ),
          const SizedBox(height: 10,),
          Consumer<ShopProvider>(
            builder: (context,shopProvider,child) {
              return Column(
               children: [
                 SizedBox(
                   height: 50,
                   child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                     child: ListView.builder(
                       scrollDirection: Axis.horizontal,
                         itemCount:categoriesNames.length,
                         itemBuilder: (context, index) {
                       return TabContainer(
                         onTab: (){
                           shopProvider.changeIndex(index);
                         },
                           text: categoriesNames[index],
                           isSelected: shopProvider.selectedIndex==index );
                     }),
                   ),
                 ),
               ],
              );
            }
          )

        ],
      ),
    );
  }
}
