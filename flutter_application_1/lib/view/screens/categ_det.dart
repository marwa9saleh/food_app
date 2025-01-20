import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/theme.dart';
import 'package:flutter_application_1/widget/range_values.dart';
import 'package:get/get.dart';

import '../../Routes/route.dart';

class CategDet extends StatelessWidget {
    final String categoryName;
    final String urlimage;
       final String desc;
  

   const CategDet({super.key, required this.categoryName,required this.urlimage,required this.desc});

@override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
          appBar: AppBar(
            shadowColor: Colors.white, 
                backgroundColor: Colors.white,
                elevation: 0,
          // leading:  InkWell(child: const Icon(Icons.arrow_back),
         
          // onTap: () {
          //   Get.to;
          // },) 
          ),
            body:
        
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  
                  child:  
                  
                  
                  Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: 
                       Image.network(urlimage,),),
                      const SizedBox(height: 20),
                        Text(
             categoryName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
               ),
              ),
             
              const SizedBox(height: 3),
              Text(
              desc,
              
                style: TextStyle(
               fontSize: 14,
                 color: Colors.grey[600],
              ),
              ),
               Row(children: [
              Icon(Icons.star, color: Colors.yellow[700]),
              const SizedBox(width: 8),
                Text(
              '4.9 -26 mins',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
               ),
              ),
               ],
                ),
              const SizedBox(height: 20),

 Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
Text('Spicy' ,
                style: TextStyle(
               fontSize: 14,
                 color: Colors.grey[600],
              ),
              ),
  Text('Portion' ,
                style: TextStyle(
               fontSize: 14,
                 color: Colors.grey[600],
              ),
              ),
  ],  
  ),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [

 
 
    
 
const range(),

              
  Column(

  children: [        
 
              Row(
                children: [
                  Container(
  width: 40,
  height: 40,
   decoration: ShapeDecoration(
            color: const Color(0xFFEF2A39),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
  child: const Icon(Icons.add,color: Colors.white,),),
          const SizedBox(width: 5,),
          Text(
  '2',
  style: TextStyle(
  color: Colors.grey[600],
    fontSize: 18,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    height: 0.08,
  ),
),
const SizedBox(width: 5,),
  Container(
  width: 40,
  height: 40,
   decoration: ShapeDecoration(
            color: const Color(0xFFEF2A39),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
  child: 
  const Icon(Icons.remove,  color: Colors.white,),),
                ],
              )


               ], 
              ),
], 
),


// Padding(padding: EdgeInsets.only(top:80),child: 
SizedBox(height: 50,),
Row(children: [
  
Container(
  padding: const EdgeInsets.all(20.0),
          width: 104,
          height: 70,
          decoration: ShapeDecoration(
            color: mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),),
  child:const Text(
  '\$9.99',
  style: TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
    // height: 0.06,
  
  ),
),),

const SizedBox(width:40,),


    GestureDetector(
      onTap: (){ 
         Get.offNamed(Routes.pay);
         },
    child: Container(
       padding: const EdgeInsets.only(top: 30),
     
            width: 239,
            height: 70,
            decoration: ShapeDecoration(
              color:five,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),),
               child: const Text(
          textAlign: TextAlign.center, 
    'ORDER NOW',
    style: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      height: 0.08,
    ),
    ),
              ),
  ),


  

],)      
            ],
                 )
                 
                 
                 
                 
                 ),


                 
            )
            
            
            
            );
       
  }
}
        