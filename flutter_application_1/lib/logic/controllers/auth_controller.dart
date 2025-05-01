import 'dart:convert';
import 'dart:io';

import 'package:flutter_application_1/Routes/route.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';


class AuthController extends GetxController {
  var isLoading = false.obs;
  final name = ''.obs;
  final phone = ''.obs;
  File? pickedImage;
  final picker = ImagePicker();

  final email = ''.obs;
  final password = ''.obs;
   bool isVisibilty = false;

   final GetStorage authBox = GetStorage();
   void visibility() {
    isVisibilty = !isVisibilty;

    update();
  }
    String? validateEmail(String value) {
    if (value.isEmpty) return "البريد الإلكتروني مطلوب";
    if (!GetUtils.isEmail(value)) return "البريد الإلكتروني غير صالح";
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) return "كلمة المرور مطلوبة";
    if (value.length < 6) return "كلمة المرور قصيرة جداً";
    return null;
  }

String? validatePhone(String value) {
  if (value.isEmpty) return "رقم الهاتف مطلوب";

  // تحقق أن الرقم يحتوي فقط على أرقام
  if (!RegExp(r'^[0-9]+$').hasMatch(value)) return "رقم الهاتف غير صالح";


  if (value.length != 10) return "رقم الهاتف يجب أن يكون 10 أرقام";

  if (!value.startsWith('05')) return "رقم الهاتف يجب أن يبدأ بـ 05";

  return null;
}
String? validateName(String value) {
  if (value.isEmpty) return "الاسم مطلوب";

  // تحقق أن الاسم يحتوي فقط على حروف ومسافات
  if (!RegExp(r'^[\u0621-\u064Aa-zA-Z\s]+$').hasMatch(value)) {
    return "الاسم يجب أن يحتوي على حروف فقط";
  }


  if (value.length < 2) return "الاسم قصير جدًا";

  return null;
}
///////////////////////////Signup///////////////////////

 Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedImage = File(pickedFile.path);
      update();
    }
  }

  Future<void> register() async {
       String? emailError = validateEmail(email.value);
    String? passwordError = validatePassword(password.value);
       String? phoneError = validatePhone(phone.value);
    String? nameError = validateName(name.value);
 if (emailError != null || passwordError != null) {
      Get.snackbar("خطأ", "${emailError ?? ''}\n${passwordError ?? ''}");
      return;
    }

    if (emailError != null || passwordError != null || phoneError != null || nameError  != null || pickedImage == null) {
      Get.snackbar('خطأ', "${emailError ?? ''}\n${passwordError ?? ''} \n${phoneError ?? ''} \n${nameError ?? ''} يرجى اختيار صورة");
      return;
    }

    isLoading.value = true;

    try {
      var request = http.MultipartRequest('POST', Uri.parse('https://student.valuxapps.com/api/register'));

      request.headers.addAll({
        'lang': 'ar',
        'Content-Type': 'application/json',
      });

      request.fields['name'] = name.value;
      request.fields['phone'] = phone.value;
      request.fields['email'] = email.value;
      request.fields['password'] = password.value;

      request.files.add(await http.MultipartFile.fromPath('image', pickedImage!.path));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      isLoading.value = false;

      if (response.statusCode == 200) {
        Get.snackbar('نجاح', 'تم تسجيل الحساب بنجاح');
        // Get.off(ProfilePage()); 
        // انتقال لصفحة الملف الشخصي مثلا
      } else {
        var body = jsonDecode(response.body);
        Get.snackbar('خطأ', body['message'] ?? 'حدث خطأ');
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('خطأ', 'فشل الاتصال بالخادم');
    }
  }











 ////////////////////// login////////////////////////////


  Future<void> login() async {
    // التحقق من القيم
    String? emailError = validateEmail(email.value);
    String? passwordError = validatePassword(password.value);

    if (emailError != null || passwordError != null) {
      Get.snackbar("خطأ", "${emailError ?? ''}\n${passwordError ?? ''}");
      return;
    }

    isLoading.value = true;

    try {
      final response = await http.post(
        Uri.parse('https://yourapi.com/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email.value,
          'password': password.value,
        }),
      );

      isLoading.value = false;

      final body = jsonDecode(response.body);

      switch (response.statusCode) {
        case 200:
          Get.snackbar("نجاح", "تم تسجيل الدخول");
          // يمكن حفظ التوكن هنا مثلاً body['token']
             authBox.write("token",  body['token']);
          break;

        case 400:
          Get.snackbar("خطأ", "بيانات ناقصة: ${body['message'] ?? ''}");
          break;

        case 401:
          Get.snackbar("خطأ", "بيانات خاطئة: ${body['message'] ?? ''}");
          break;

        case 404:
          Get.snackbar("خطأ", "الحساب غير موجود");
          break;

        case 500:
          Get.snackbar("خطأ", "خطأ في الخادم، حاول لاحقاً");
          break;

        default:
          Get.snackbar("خطأ", "حدث خطأ غير متوقع");
          break;
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("خطأ", "فشل الاتصال بالخادم");
  }

    }
Future<void> logout() async {
    final token = authBox.read('token');

    if (token == null) {
      Get.snackbar('خطأ', 'المستخدم غير مسجل دخول');
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('https://student.valuxapps.com/api/logout'),
        headers: {
          'lang': 'ar',
          'Content-Type': 'application/json',
          'Authorization': token,
        },
        body: jsonEncode({
          'fcm_token': '', // إذا كنتِ لا تستخدمين FCM يمكنك تركه فارغًا أو تجاهله
        }),
      );

      if (response.statusCode == 200) {
        // حذف البيانات من التخزين
        await authBox.remove('token');

        Get.snackbar('نجاح', 'تم تسجيل الخروج بنجاح');
        
        // الانتقال إلى صفحة تسجيل الدخول
          Get.offNamed(Routes.loginScreen); // تأكدي من أن لديك Route معرف باسم /login
      } else {
        Get.snackbar('خطأ', 'فشل تسجيل الخروج: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('خطأ', 'مشكلة في الاتصال بالسيرفر');
    }



}

    }
// Firebase Authentcation

//   void signUpUsingFirebase({
//     required String email,
//     required String password,
//     required String name,
//   }) async {
//     // showLoading(context);

//     //   // var formData = formkey.currentState;
//     //   // if (formData!.validate()) {
//     //   //   formData.save();
//     try {
//       await auth
//           .createUserWithEmailAndPassword(email: email, password: password)
//           .then((value) {
//         displayUserName.value = name;
//         auth.currentUser!.updateDisplayName(name);
//       });
//       update();
//       Get.offNamed(Routes.nav);
//     } on FirebaseAuthException catch (error) {
//       String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
//       String message = '';

//       if (error.code == 'weak-password') {
//         message = ' Provided Password is too weak.. ';
//       } else if (error.code == 'email-already-in-use') {
//         message = ' Account Already exists for that email.. ';
//       } else {
//         message = error.message.toString();
//       }

//       Get.snackbar(
//         title,
//         message,
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: mainColor,
//         colorText: Colors.white,
//       );
//     } catch (error) {
//       Get.snackbar(
//         'Error!',
//         error.toString(),
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: mainColor,
//         colorText: Colors.white,
//       );
//     }
//   }

//   void logInUsingFirebase({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       await auth
//           .signInWithEmailAndPassword(email: email, password: password)
//           .then((value) =>
//               displayUserName.value = auth.currentUser!.displayName!);

//       isSignedIn = true;
//       authBox.write("auth", isSignedIn);

//       update();
//       Get.offNamed(Routes.nav);
//     } on FirebaseAuthException catch (error) {
//       String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
//       String message = '';

//       if (error.code == 'user-not-found') {
//         message =
//             ' Account does not exists for that $email.. Create your account by signing up..';
//       } else if (error.code == 'wrong-password') {
//         message = ' Invalid Password... PLease try again! ';
//       } else {
//         message = error.message.toString();
//       }
//       Get.snackbar(
//         title,
//         message,
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: mainColor,
//         colorText: Colors.white,
//       );
//     } catch (error) {
//       Get.snackbar(
//         'Error!',
//         error.toString(),
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: mainColor,
//         colorText: Colors.white,
//       );
//     }
//   }

//   void resetPassword(String email) async {
//     try {
//       await auth.sendPasswordResetEmail(email: email);

//       update();
//       Get.back();
//     } on FirebaseAuthException catch (error) {
//       String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
//       String message = '';

//       if (error.code == 'user-not-found') {
//         message =
//             ' Account does not exists for that $email.. Create your account by signing up..';
//       } else {
//         message = error.message.toString();
//       }
//       Get.snackbar(
//         title,
//         message,
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: mainColor,
//         colorText: Colors.white,
//       );
//     } catch (error) {
//       Get.snackbar(
//         'Error!',
//         error.toString(),
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: mainColor,
//         colorText: Colors.white,
//       );
//     }
//   }

//   void signOutFromApp() async {
//     try {
//       await auth.signOut();
//       // await googleUser.signOut();

//       displayUserName.value = '';
//       displayUserPhoto.value = '';
//       displayUserEmail.value = '';
//       isSignedIn = false;
//       authBox.remove("auth");
//       update();
//       Get.offNamed(Routes.loginScreen);
//     } catch (error) {
//       Get.snackbar(
//         'Error!',
//         error.toString(),
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: mainColor,
//         colorText: Colors.white,
//       );
//     }
//   }
// }
