import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            ListTile(
              horizontalTitleGap: 7,
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage("https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250")
              ),
              title: Text("Hunzla Shafiq"),
              subtitle: Text("@hunzla132",style: TextStyle(color: Colors.grey.shade500),),
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
            )
          ],
        ),
      ),

    );
  }
}
