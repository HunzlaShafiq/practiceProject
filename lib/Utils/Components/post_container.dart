import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostContainer extends StatelessWidget {
  final String userName;
  final String profileURL;
  final String timeAgo;
  final String description;
  final String postURL;




  const PostContainer({super.key, required this.profileURL, required this.timeAgo, required this.description, required this.postURL, required this.userName});

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
              backgroundImage: NetworkImage(profileURL),
            ),
            title: Text(userName),
            subtitle: Text(timeAgo,style: TextStyle(color: Colors.grey.shade500),),
            trailing: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: const Color(0xffFF5205)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.add, size: 18, color: Color(0xffFF5205)),
                  SizedBox(width: 4),
                  Text(
                    'Follow',
                    style: TextStyle(color: Color(0xffFF5205)),
                  ),
                ],
              ),
            ),

          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              description,
              style: TextStyle(color: Colors.grey,fontSize: 13),

            ),

          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  postURL,height: 110,
                  width: double.infinity,
                  fit: BoxFit.cover,)
            ),
          ),
          Divider(color: Colors.grey.shade300,),
          const SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              spacing: 12,
              children: [
                socialMediaStats(FontAwesomeIcons.heart, "10K"),
                socialMediaStats(FontAwesomeIcons.message, "172"),
                socialMediaStats(FontAwesomeIcons.paperPlane, "80"),
                socialMediaStats(FontAwesomeIcons.arrowsRotate, "12"),
                Spacer(),
                socialMediaStats(Icons.bookmark, "19"),
              ],
            ),
          ),
          const SizedBox(height: 20,)
        ],

      ),
    );
  }

  Widget socialMediaStats (IconData icon, String count){
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: Colors.grey.shade600,
        ),
        const SizedBox(width: 3),
        Text(
          count,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

}
