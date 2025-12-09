import 'dart:ui';

import 'package:flutter/material.dart';

class PostsGrid extends StatelessWidget {

  final List<String> imageURLs ;
  final List<String> postViewsCount;
  const PostsGrid({super.key,required this.imageURLs, required this.postViewsCount});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: imageURLs.length,
        physics:const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: .7
        ),
        itemBuilder: (child,index){

          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  imageURLs[index],
                  height: 240,
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
                            postViewsCount[index],
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
    );
  }
}
