import 'package:flutter/material.dart';
import 'package:furniture/common/Appcolor.dart';
import 'package:furniture/common/globaltext.dart';
import 'package:furniture/view/addpaymentscreen.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class payment {
  String title;
  String image;

  payment({
    required this.title,
    required this.image,
  });
}

List<payment> Payment = [
  payment(
    title: 'Use as default payment method',
    image: 'assets/image/Payment card.jpg',
  ),
  payment(
    title: 'Use as default payment method',
    image: 'assets/image/Payment card.png',
  ),
];

class _PaymentScreenState extends State<PaymentScreen> {
  bool isselected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Payment method',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColor.blackcolor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: Payment.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image(
                      image: AssetImage(Payment[index].image),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: isselected,
                          onChanged: (index) {
                            setState(
                              () {
                                isselected = index!;
                              },
                            );
                          },
                        ),
                        Globaltext(
                          text: Payment[index].title,
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Get.to(
            Addpayment(),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
