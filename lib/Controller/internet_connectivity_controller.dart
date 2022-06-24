import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class InternetConnectivity extends GetxController{

  var connectionStatusValue = 0.obs;
  final Connectivity connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _streamSubscription;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initConnectivity();
    _streamSubscription = connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  // Function
  Future<void> initConnectivity() async{
    late ConnectivityResult result;

    try{
      result = await connectivity.checkConnectivity();
    }on PlatformException catch(e){
      print(e.toString());
    }
    return _updateConnectionStatus(result);
  }


  // User Defined Function for updating the status of connection
  _updateConnectionStatus(ConnectivityResult result){

    switch (result){
      case ConnectivityResult.wifi:
        connectionStatusValue.value = 1;
        break;
      case ConnectivityResult.mobile:
        connectionStatusValue.value = 2;
        break;
      case ConnectivityResult.none:
        connectionStatusValue.value = 0;
        break;
      default:
        Get.snackbar("Network Error", "Failed to get network connection");
        break;
    }
  }



  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }


}