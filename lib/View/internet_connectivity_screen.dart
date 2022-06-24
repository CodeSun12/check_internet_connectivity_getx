import 'dart:async';

import 'package:check_internet_connectivity_getx/Controller/internet_connectivity_controller.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class InternetConnectivityScreen extends StatelessWidget {
  InternetConnectivityScreen({Key? key}) : super(key: key);

   var connectionController = Get.put(InternetConnectivity());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("Internet Connectivity", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Obx(() =>
             Center(
               child: Text(
                 connectionController.connectionStatusValue==1
                   ? "Wifi Connected"
                   : (connectionController.connectionStatusValue==2
                 ? "Mobile Connected" : "No Connection"
                 ),
                 style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black87),
               ),
             )
           )
         ],
        ),
      ),
    );
  }
}