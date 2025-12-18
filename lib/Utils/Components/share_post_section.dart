import 'package:flutter/material.dart';

class SharePostSection extends StatelessWidget {
  final TextEditingController controller;
  const SharePostSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
          ListTile(
            horizontalTitleGap: 7,
            leading: CircleAvatar(
              backgroundImage: NetworkImage("https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250"),
            ),
            title: Text("Brooklyn Som"),
            subtitle: Text("@Broklyn",style: TextStyle(color: Colors.grey.shade500),),
            trailing: SizedBox(
              width: 77,
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 3,
                    children: [
                      Icon(Icons.public,size: 18,color: Colors.grey.shade500,),
                      Text('Public',style: TextStyle(color: Colors.grey.shade500),),
                      Icon(Icons.keyboard_arrow_down_rounded,size: 18,color: Colors.grey.shade500,)

                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: "What's on your mind?",
                  hintStyle: TextStyle(color: Colors.grey.shade500,fontSize: 15),
                  suffixIcon: SizedBox(
                    width: 70,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 7,
                      children: [
                        Icon(Icons.emoji_emotions_outlined,color: Colors.grey.shade500,size: 25,),
                        Icon(Icons.link,color: Colors.grey.shade500,size: 25),
                      ],
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color:Colors.grey.shade500 )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color:Colors.transparent)
                  )
              ),
            ),
          )

        ],
      ),
    );
  }
}
