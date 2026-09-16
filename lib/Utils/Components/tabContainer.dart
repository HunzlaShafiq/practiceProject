import 'package:flutter/material.dart';

class TabContainer extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTab;
  const TabContainer({super.key,required this.text, required this.isSelected, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onTab,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color:isSelected ? Colors.black: Colors.grey.shade400)
          ),
          child: Text(text,
            style: TextStyle(
            color:isSelected ? Colors.black: Colors.grey.shade400,
            fontSize: 20,
              fontFamily: "inconslata"),),
        ),
      ),
    );
  }
}
