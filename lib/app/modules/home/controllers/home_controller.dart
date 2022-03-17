import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:residigital/app/models/resi_model.dart';
import 'package:screenshot/screenshot.dart';

class HomeController extends GetxController {
  final url = Uri.parse('https://ops.jmiot.org/apii/resii');
  late File imageFile;
  var lengthdataResi = 0.obs;
  ScreenshotController screenshotController = ScreenshotController();
  var noTicket = TextEditingController();
  var showData = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void dispose() {
    super.dispose();
  }

  Future<List<ResiModel>> getData() async {
    final response = await http.post(
      url,
      body: {'no_kartu': noTicket.text},
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse['status'] == true) {
        List listResponse = jsonResponse['data'];
        var lenghthdata = listResponse
            .map((resi) => new ResiModel.fromJson(resi))
            .toList()
            .length;
        print(jsonResponse['status']);
        print(listResponse);
        showData.value = true;
        lengthdataResi.value = lenghthdata;
        return listResponse
            .map((resi) => new ResiModel.fromJson(resi))
            .toList();
      } else {
        print(jsonResponse);
        lengthdataResi.value = 0;
        showData.value = false;
        return <ResiModel>[];
      }
    }

    throw Exception('Failed to load from API');
  }
}
