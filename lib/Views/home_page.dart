import 'package:flutter/material.dart';
import 'package:practice_project/Utils/Components/Status_avatar.dart';
import 'package:practice_project/Utils/Components/post_container.dart';
import 'package:practice_project/Utils/Components/share_post_section.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Map<String, dynamic>> storyBar = [
    {
      "userName": 'Drake',
      "profileURl": 'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250',
      "isViewed": false,
      "isLive": true,
    },
    {
      "userName": 'Randy',
      "profileURl": 'https://i.pravatar.cc/250?u=mail@ashallendesign.co.uk',
      "isViewed": false,
      "isLive": false,
    },
    {
      "userName": 'Jerry',
      "profileURl": 'https://placebeard.it/250/250',
      "isViewed": false,
      "isLive": false,
    },
    {
      "userName": 'Root',
      "profileURl": 'https://robohash.org/mail@ashallendesign.co.uk',
      "isViewed": true,
      "isLive": false,
    },
    {
      "userName": 'Smith',
      "profileURl": 'http://placebear.com/250/250',
      "isViewed": false,
      "isLive": false,
    },

  ];
  int selectedIndex = 0;
  List <String> tabNames= ["For You","Following","Community"];
  TextEditingController postShareController = TextEditingController();



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Friendo"),
        backgroundColor: Colors.grey.shade200,
        actions: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(100)
            ),
            child: Icon(
              Icons.notifications_none_rounded, color: Colors.black, size: 20,),
          ),
          const SizedBox(width: 8,),
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(100)
            ),
            child: Icon(Icons.email_outlined, color: Colors.black, size: 20,),
          ),
          const SizedBox(width: 20,),
        ],
      ),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [

            const  SizedBox(height: 10,),
            SizedBox(
               height: 100,
               child: Padding(
                 padding: const EdgeInsets.only(left: 10.0,right: 10),
                 child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                   itemCount: storyBar.length + 1,
                   clipBehavior: Clip.none,
                   itemBuilder: (context, index) {
                     if (index == 0) {
                       return Padding(
                         padding: const EdgeInsets.all(5.0),
                         child: Column(
                           children: [
                             CircleAvatar(
                               radius: 28,
                               backgroundColor: Colors.black,
                               child: Icon(
                                 Icons.add,
                                 color: Colors.white,
                                 size: 32,
                               ),
                             ),
                             const SizedBox(height: 13.5),
                             const Text(
                               "Add Story",
                               style: TextStyle(
                                 fontSize: 12,
                                 fontWeight: FontWeight.w600,
                                 color: Colors.black87,
                               ),
                             ),
                           ],
                         ),
                       );
                     }

                     final storyIndex = index - 1;

                     return StatusAvatar(
                       profileURl: storyBar[storyIndex]['profileURl'],
                       isViewed: storyBar[storyIndex]['isViewed'],
                       isLive: storyBar[storyIndex]['isLive'],
                       userName: storyBar[storyIndex]['userName'],
                     );
                   },
                 ),
               ),
             ),
            const SizedBox(height: 10,),
            Container(
              height: 55,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final tabWidth = constraints.maxWidth / tabNames.length;

                  return Stack(
                    children: [

                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeOutCubic,
                        left: tabWidth * selectedIndex,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          width: tabWidth,
                          margin: const EdgeInsets.symmetric(vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),


                      Row(
                        children: List.generate(tabNames.length, (index) {
                          final isSelected = selectedIndex == index;

                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Center(
                                child: Text(
                                  tabNames[index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.grey.shade500,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 10,),

            Expanded(
              child: SingleChildScrollView(

                child: Column(
                  spacing: 10,
                children: [
                  SharePostSection(controller: postShareController),
                  const SizedBox(height: 10,),
                  PostContainer(
                    profileURL:"https://i.pravatar.cc/250?u=mail@ashallendesign.co.uk",
                    timeAgo: '2 hr ago',
                    description:"A nature wanderer experiences a thousand worlds - but the one who never steps outside feels only a single view of life.",
                    postURL:'assets/nature1.png', userName: "Tracy Ritchie",),
                  PostContainer(
                    profileURL:"https://robohash.org/mail@ashallendesign.co.uk",
                    timeAgo: '1 hr ago',
                    description:"A nature wanderer experiences a thousand worlds - but the one who never steps outside feels only a single view of life.",
                    postURL:'assets/nature1.png', userName: "Randy",),
                  SizedBox(height: 30)
                ],
              ),),
            )


          ],
        ),
      ),
    );
  }



}
