import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../routes/route.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  // TODO: implement PaymentPage

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text("Payment".tr),
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          elevation: 0,
          leading: InkWell(
            child: const Icon(Icons.arrow_back),
            onTap: () {
              Get.offNamed(Routes.home);
            },
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Payment Method".tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                        value: 1,
                        onChanged: (value) {},
                        groupValue: null,
                      ),
                      Text('Amazon Pay'.tr),
                    ],
                  ),
                  const Image(
                    image: AssetImage('assets/images/amazon.png'),
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                        value: 1,
                        onChanged: (value) {},
                        groupValue: null,
                      ),
                      Text('Credit Card'.tr),
                    ],
                  ),
                  const Image(
                    image: AssetImage('assets/images/vm.png'),
                    width: 70,
                    // height: 40,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                        value: 1,
                        onChanged: (value) {},
                        groupValue: null,
                      ),
                      Text('PayPal'.tr),
                    ],
                  ),
                  const Image(
                    image: AssetImage('assets/images/pay.png'),
                    width: 70,
                    // height: 40,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                        value: 1,
                        onChanged: (value) {},
                        groupValue: null,
                      ),
                      Text('Google Pay'.tr),
                    ],
                  ),
                  const Image(
                    image: AssetImage('assets/images/gopay.png'),
                    width: 70,
                    // height: 70,
                    fit: BoxFit.cover,
                  ),
                ],
              ),

              //   PaymentOption(
              //     // title: "Amazon Pay",
              //     // image:  const Image(image:AssetImage('assets/images/amazon.png'),
              //     // width: 10,
              //     // height: 10,
              //     // fit: BoxFit.cover,),

              //     onTap: () {
              //       // Navigate to card payment page or logic
              //     }, title: 'Amazon Pay', imageUrl:'assets/images/amazon.png',
              //  ),
              //       const SizedBox(height: 16),
              //   PaymentOption(
              //       title: "Credit Card",
              //     imageUrl:'assets/images/vm.png',

              //     onTap: () {
              //       // Add PayPal payment logic
              //     },
              //   ),
              //       const SizedBox(height: 16),
              //   PaymentOption(
              //        title: "PayPal",
              //   imageUrl:'assets/images/pay.png',
              //      onTap: () {
              //       // Add Apple Pay payment logic
              //     },
              //     ),

              //       const SizedBox(height: 16),

              //    PaymentOption(
              //      title: "Google Pay",
              //    imageUrl:'assets/images/gopay.png',

              //     onTap: () {
              //       // Add Apple Pay payment logic
              //     },
              //   ),
              const SizedBox(height: 32),
              Text(
                "Enter Payment Details".tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: "Card Number".tr,
                  border: const UnderlineInputBorder(),
                  prefixIcon: const Icon(Icons.credit_card),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Expiry Date".tr,
                        border: const UnderlineInputBorder(),
                        hintText: "MM/YY",
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  const SizedBox(width: 18),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "CVV",
                        border: UnderlineInputBorder(),
                        hintText: "123",
                      ),
                      keyboardType: TextInputType.number,
                      obscureText: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              TextField(
                decoration: InputDecoration(
                  labelText: "Card Holder Name".tr,
                  border: const UnderlineInputBorder(),
                ),
              ),
              // const Spacer(),
              const SizedBox(height: 18),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sub-Total'.tr,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  const Text(
                    '\$300.50',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'shipping fee'.tr,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  const Text(
                    '\$15.00',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 30,
                color: Colors.black,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Payment'.tr,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  const Text(
                    '\$300.50',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 70),
              ElevatedButton(
                onPressed: () {
                  // Add payment processing logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Payment Successful!".tr)),
                  );
                },
                child: Text("Confirm Payment".tr,
                    style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class PaymentOption extends StatelessWidget {
//   final String title;
//   final String imageUrl;
  

//   final VoidCallback onTap;

//   const PaymentOption({
//     Key? key,
//         required this.title,
//     required this.imageUrl,

//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [

//         Row(
//                crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
// Text(title),
// Radio(value: value, groupValue: groupValue, onChanged:(value) {
  
// },)


//           ],
//         ),
//       const Icon(Icons.arrow_forward_ios),
     
     
//       ],
//       // leading:Text(title),
//       // title:image ,
//       // trailing: const Icon(Icons.arrow_forward_ios),
//       // onTap: onTap,
//     );
//   }
// }
