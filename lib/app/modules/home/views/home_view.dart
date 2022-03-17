import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:residigital/app/data/theme.dart';
import 'package:residigital/app/modules/home/views/resi_view.dart';

import '../controllers/home_controller.dart';
import 'package:lottie/lottie.dart';

class HomeView extends GetView<HomeController> {
  final HomeController HomeC = Get.put(HomeController());
  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   backgroundColor: ,
      //    actions: [
      //   IconButton(
      //     onPressed: () => {},
      //     icon: Icon(Icons.abc),
      //   )
      // ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  // margin: EdgeInsets.all(10),
                  // height: 400,
                  // width: 400,
                  // child: Lottie.asset('lib/app/images/login_page.json'),
                  child: Lottie.network(
                      'https://assets4.lottiefiles.com/packages/lf20_0akluyjw.json',
                      fit: BoxFit.cover)),
              SizedBox(
                height: 40,
              ),
              Form(
                key: formGlobalKey,
                child: TextFormField(
                  validator: (nilai) => nilai!.isNotEmpty || nilai == null
                      ? "input nomor kartu"
                      : null,
                  controller: HomeC.noTicket,
                  keyboardType: TextInputType.number,
                  // autofocus: true,
                  decoration: InputDecoration(
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    hintText: 'Input Nomor Kartu ...',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: buttonColorBlue,
                  minimumSize: Size(Get.width, 60),
                ),
                onPressed: () => {
                  HomeC.getData(),
                  Get.to(() => ResiView()),
                },
                child: Text(
                  'Cari Resi',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
