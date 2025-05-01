import 'package:flutter/material.dart';



import 'package:flutter_application_1/Utils/theme.dart';

class AuthTextFormField extends StatelessWidget {
  // final TextEditingController controller;
  final bool obscureText;
  final Function onChanged;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  const AuthTextFormField({
    // required this.controller,
    required this.obscureText,
    required this.onChanged,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.hintText,
    super.key, required TextInputType keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    
      obscureText: obscureText,
      cursorColor: Colors.black,
 
      onChanged: (value) {
        return onChanged(value);
      },
      decoration: InputDecoration(
          labelText: hintText,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: mainColor),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: secondColor,
            ),
          )),
    );
  }
}


// import 'package:flutter/material.dart';

// class InputStyle extends StatelessWidget {
//   final TextEditingController controller;
//   final bool obscureText;
//   final Function validator;
//   final String title;
//   final String hintext;
//   final Widget suffixIcon;
//   const InputStyle({
//     required this.title,
//     required this.hintext,
//     required this.controller,
//     required this.obscureText,
//     required this.validator,
//     super.key,
//     required this.suffixIcon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(40, 5, 20, 10),
//       child: Row(children: [
//         Text(
//           "$title:",
//           style: const TextStyle(
//             fontSize: 18,
//           ),
//         ),
//         const SizedBox(width: 10),
//         const SizedBox(height: 30),
//         Expanded(
//           child: Container(
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                       offset: Offset(0, 3))
//                 ]),
//             child: TextFormField(
//               controller: controller,
//               obscureText: obscureText,
//               validator: (value) {
//                 return validator(value);
//               },
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                 suffixIcon: suffixIcon,
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.only(left: 10),
//                 hintText: hintext,
//               ),
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }
