import 'dart:async';
import 'dart:io';
import 'package:connectivity_checker/connectivity_checker.dart';
import 'package:flutter/material.dart';

const int DEFAULT_PORT = 53;
const Duration DEFAULT_TIMEOUT = Duration(seconds: 10);

class NetworkConnectivity {
  static NetworkConnectivity? _instance;

  BuildContext mContext;

  bool isConnected = true;
  StreamSubscription<ConnectivityStatus>? connectivitySubscription;

  NetworkConnectivity(this.mContext) {
    onCancelSubscription();
    checkState(mContext);
  }

  static NetworkConnectivity get instance => _instance!;

  static NetworkConnectivity create(BuildContext context) {
    _instance = NetworkConnectivity(context);
    return _instance!;
  }

  // static const Duration DEFAULT_TIMEOUT = Duration(seconds: 10);
  // static const int DEFAULT_PORT = 53;
  static const Duration DEFAULT_INTERVAL = Duration(seconds: 30);
  static final List<AddressCheckOptions> DEFAULT_ADDRESSES = [
    AddressCheckOptions(
      InternetAddress('1.1.1.1'),
      port: DEFAULT_PORT,
      timeout: DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('8.8.4.4'),
      port: DEFAULT_PORT,
      timeout: DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('208.67.222.222'),
      port: DEFAULT_PORT,
      timeout: DEFAULT_TIMEOUT,
    ),
  ];

  void checkState(BuildContext context) async {
    ConnectivityWrapper.instance.addresses = DEFAULT_ADDRESSES;
    ConnectivityWrapper.instance.checkInterval = DEFAULT_INTERVAL;

    connectivitySubscription = ConnectivityWrapper.instance.onStatusChange.listen((status) {
      debugPrint('-----------NetworkConnectivity---- Stream---> $status');
      switch (status) {
        case ConnectivityStatus.CONNECTED:
          isConnected = true;
          debugPrint('-----------NetworkConnectivity----- Stream--> connected');
          break;
        case ConnectivityStatus.DISCONNECTED:
          isConnected = false;
          debugPrint('-----------NetworkConnectivity----- Stream--> disconnected');
          break;
      }
    });

    isConnected = await ConnectivityWrapper.instance.isConnected;
  }

  StreamSubscription<ConnectivityStatus>? checkLiveInternet() {
    return connectivitySubscription;
  }

  Future<bool> isInternetConnected() async {
    debugPrint('-----------NetworkConnectivity----- isInternetConnected--');
    return await ConnectivityWrapper.instance.isConnected;
  }

  bool isInternetConnectedResult(ConnectivityStatus result) {
    debugPrint('-----------NetworkConnectivity----- isInternetConnectedResult-- $result');
    var checkConnection = true;
    switch (result) {
      case ConnectivityStatus.CONNECTED:
        checkConnection = true;
        debugPrint('-----------NetworkConnectivity----- isInternetConnectedResult-- connected');
        break;
      case ConnectivityStatus.DISCONNECTED:
        checkConnection = false;
        debugPrint('-----------NetworkConnectivity----- isInternetConnectedResult-- disconnected');
        break;
    }

    return checkConnection;
  }

  onCancelSubscription() {
    if (connectivitySubscription != null) {
      connectivitySubscription!.cancel();
    }
  }
}
