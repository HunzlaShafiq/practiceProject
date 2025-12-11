import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:practice_project/Utils/Components/posts_grid.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =TabController(length: 3, vsync: this);
  }

  int selectedIndex = 0;

  final List<String> tabs = ["Post", "Video", "Tag"];
  final List<IconData> icons = [
    Icons.grid_view_rounded,
    Icons.play_circle_filled_rounded,
    Icons.person_pin_circle_rounded,
  ];

  final List<String> imageURLs =["assets/post1.jpg","assets/post2.png","assets/post3.png","assets/post4.png"];
  final List<String> postViewsCount =["1,450","8,450","5,050","3,493"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(top: 10.0,bottom: 10, left: 20),
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(100)
            ),
            child: Icon(Icons.arrow_back_ios_new,color: Colors.black,size: 20,),
          ),
        ),
        actions: [
          Container(
            height: 35,
            width: 35,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(100)
          ),
          child: Icon(Icons.graphic_eq,color: Colors.black,size: 20,),
        ),
          SizedBox(width: 20,)

        ],
        backgroundColor: Colors.grey.shade100,

      ),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              ListTile(
                horizontalTitleGap: 7,
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage("https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250")
                ),
                title: Text("Brooklyn Sorn"),
                subtitle: Text("@Brooklyn",style: TextStyle(color: Colors.grey.shade500),),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "Dream big, work hard, stay focused, and surround yourself with good energy.🙌",
                  style: TextStyle(fontSize: 13),
                ),
          
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  spacing: 8,
                  children: [
                    Container(
                      height: 65,
                      width: MediaQuery.of(context).size.width * .26,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 13.0,top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("600",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            Text("Following",style: TextStyle(color:Colors.grey.shade500,fontSize: 15),),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 65,
                      width: MediaQuery.of(context).size.width * .26,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 13.0,top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("120K",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            Text("Followers",style: TextStyle(color:Colors.grey.shade500,fontSize: 15),),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 65,
                      width: MediaQuery.of(context).size.width * .26,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 13.0,top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("24",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            Text("Posts",style: TextStyle(color:Colors.grey.shade500,fontSize: 15),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 210,
                    decoration: BoxDecoration(
                      color: Color(0xffFF5205),
                      borderRadius: BorderRadius.circular(50)
                  
                    ),
                    child: Center(
                      child: Text(
                        "Follow",
                        style: TextStyle(color: Colors.white,fontSize: 15),),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Icon(Icons.email_outlined,color: Colors.grey,),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Icon(Icons.exit_to_app,color: Colors.grey,),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Column(
                children: [
                  // ---------------- TAB BAR ---------------- //
                  Row(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(tabs.length, (index) {
                      final bool isSelected = selectedIndex == index;
          
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() => selectedIndex = index);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.white : Colors.transparent,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  icons[index],
                                  size: 20,
                                  color: isSelected ? Colors.black : Colors.grey.shade500,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  tabs[index],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight:
                                    isSelected ? FontWeight.bold : FontWeight.w500,
                                    color:
                                    isSelected ? Colors.black : Colors.grey.shade500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
          
                  const SizedBox(height: 15),
          
                  // ---------------- TAB CONTENT ---------------- //
                  IndexedStack(
                    index: selectedIndex,
                    children: [
                      PostsGrid(imageURLs: imageURLs, postViewsCount: postViewsCount),
                      _buildVideoPage(),
                      _buildTagPage(),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50),

          
          
              
          
          
          
            ],
          ),
        ),
      ),

    );
  }
}



Widget _buildVideoPage() {
  return Stack(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          "assets/post1.jpg",
          height: 250,
          width: 180,
          fit: BoxFit.fill,
        ),
      ),

      Positioned(
        bottom: 7,
        left: 7,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3), // glass effect
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.visibility_rounded, color: Colors.white, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    "1,450",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    ],
  );
}

Widget _buildTagPage() {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        "Tagged Posts",
        style: TextStyle(fontSize: 16),
      ),
    ),
  );
}

