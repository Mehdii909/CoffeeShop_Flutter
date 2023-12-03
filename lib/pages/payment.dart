import 'package:coffeeshop_flutter/const.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../const.dart';
import 'home_page.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int _type = 1;
  TextEditingController _tableNumberController = TextEditingController();
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? _qrViewController;

  void _handleRadio(Object? e) => setState(() {
        _type = e as int;
      });

  @override
  void dispose() {
    _qrViewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 40),
              Container(
                width: size.width,
                height: 55,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  border: _type == 1
                      ? Border.all(width: 1, color: Colors.black)
                      : Border.all(width: 0.3, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.transparent,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio(
                              value: 1,
                              groupValue: _type,
                              onChanged: _handleRadio,
                              activeColor: Colors.brown,
                            ),
                            Text(
                              "Debit Card",
                              style: _type == 1
                                  ? TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)
                                  : TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                            ),
                          ],
                        ),
                        Image.asset(
                          "lib/images/credit-card.png",
                          width: 45,
                          height: 45,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: size.width,
                height: 55,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  border: _type == 2
                      ? Border.all(width: 1, color: Colors.black)
                      : Border.all(width: 0.3, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(0, 12, 12, 12),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio(
                              value: 2,
                              groupValue: _type,
                              onChanged: _handleRadio,
                              activeColor: Colors.brown,
                            ),
                            Text(
                              "Pay Cash",
                              style: _type == 2
                                  ? TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)
                                  : TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                            ),
                          ],
                        ),
                        Image.asset(
                          "lib/images/money.png",
                          width: 45,
                          height: 45,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "\50TND",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Divider(
                height: 20,
                color: cafeBrown,
              ),
              SizedBox(height: 30), // Added space between total and QR code // Added space between Pay Cash and QR Code
             
              SizedBox(height: 30), // Added space between -OR- and QR Code
              // QR Code Scanner
              Container(
                width: size.width,
                height: 200,
                margin: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Off-white shade
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                ),
                 child: Stack(
                  children: [
                    QRView(
                      key: _qrKey,
                      onQRViewCreated: (QRViewController controller) {
                        _qrViewController = controller;
                        controller.scannedDataStream.listen((scanData) {
                          // Implement your logic when QR code is scanned
                        });
                      },
                    ),
                    Center(
                      child: Icon(
                        Icons.qr_code,
                        size: 50,
                        color: Colors.black,
                      ),
                    ),
                  ], 
                ),
              ),
               // -OR- text
              Text(
                "-OR-",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.withOpacity(0.6),
                ),
              ),
              // Table Number Input
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: _tableNumberController,
                  decoration: InputDecoration(
                    labelText: 'Enter Table Number',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              // Proceed Button
             GestureDetector(
  onTap: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Thank you!"),
          content: Text("Your order is on the way."),
        );
      },
    );

    // Add a delay of 2 seconds before navigating to HomePage
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  },
  child: Container(
    padding: const EdgeInsets.all(25),
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.brown,
      borderRadius: BorderRadius.circular(12),
    ),
    child: const Center(
      child: Text(
        "Proceed",
        style: TextStyle(color: Colors.white),
      ),
    ),
  ),
),

              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
