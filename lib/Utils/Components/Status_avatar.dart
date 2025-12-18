import 'package:flutter/material.dart';

class StatusAvatar extends StatelessWidget {
  final String profileURl;
  final String userName;
  final bool isViewed;
  final bool isLive;

  const StatusAvatar(
      {super.key,
      required this.profileURl,
      required this.isViewed,
      required this.isLive, required this.userName
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [

              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient:isViewed ? LinearGradient(
                    colors: [
                      Colors.grey,
                      Colors.grey,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ): LinearGradient(
                    colors: [
                      Color(0xFFFF8A00),
                      Color(0xFFFF3D00),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(
                      profileURl,
                    ),
                  ),
                ),
              ),

              isLive? Positioned(
                bottom: -6,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8,vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    "Live",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ) : SizedBox()
            ],
          ),
          const SizedBox(height: 6),
           Text(
            userName,
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
}
