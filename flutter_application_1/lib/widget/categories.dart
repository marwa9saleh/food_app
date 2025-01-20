import 'package:flutter/material.dart';


class Categories extends StatelessWidget {
  Categories({super.key, required this.image, required this.title, required this.textColor,  this.backgroundColor});
  final String image,title;
  final Color textColor;
  // final void Function()?onTap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return  

       Padding(
          padding: EdgeInsets.only(right: 20),
           child: Column(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  padding:EdgeInsets.all(8) ,
                  decoration: BoxDecoration(
                    
                   image: DecorationImage(
      image: NetworkImage(image),
      fit: BoxFit.cover, // تغطي الصورة كامل الـ Container
    ),
                  
                    borderRadius: BorderRadius.circular(400),
                   
                 
                  ),
                 
    
           
                
                 
                ),
                  SizedBox(height:2),
                 SizedBox(
                 child:Text(title,
                 style: TextStyle(
                  color: textColor,
      
                 ),
                 maxLines: 1,
                 overflow: TextOverflow.ellipsis,
                 ), 
                 
                  // width: 20,
                  
                  ),
                
           
              ],
            ),
         );
  
  }
}