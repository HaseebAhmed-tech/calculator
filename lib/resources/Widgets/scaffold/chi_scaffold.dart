import 'dart:async';

import 'package:connectivity_checker/connectivity_checker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../utils/connectivity/internet_connectivity.dart';

class CHIScaffold extends StackedView<CHIScaffoldViewModel> {
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;

  const CHIScaffold({
    this.backgroundColor,
    this.appBar,
    required this.body,
    this.floatingActionButton,
    this.bottomSheet,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset,
    Key? key,
  }) : super(key: key);

  @override
  bool get disposeViewModel {
    return true;
  }

  @override
  bool get initialiseSpecialViewModelsOnce {
    return true;
  }

  @override
  Widget builder(
      BuildContext context, CHIScaffoldViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: appBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Stack(
        children: [
          Padding(
            padding: !viewModel.isConnected
                ? const EdgeInsets.only(top: 30)
                : const EdgeInsets.only(top: 0),
            child: body!,
          ),
          Visibility(
            visible: !viewModel.isConnected,
            child: Container(
              color: Colors.red,
              width: double.infinity,
              height: 30,
              child: const Center(
                  child: Text(
                'No Internet Connection',
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
              )),
            ),
          )
        ],
      ),
      floatingActionButton: floatingActionButton,
      bottomSheet: bottomSheet,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  @override
  CHIScaffoldViewModel viewModelBuilder(BuildContext context) {
    final vm = CHIScaffoldViewModel();
    vm.checkConnectivity();
    return vm;
  }
}

class CHIScaffoldViewModel extends BaseViewModel {
  bool isConnected = true;
  static late StreamSubscription connectivitySubscription;

  // void checkState(BuildContext context) async {
  //   ConnectivityWrapper.instance.addresses = NetworkConnectivity.DEFAULT_ADDRESSES;
  //   ConnectivityWrapper.instance.checkInterval = NetworkConnectivity.DEFAULT_INTERVAL;

  //   connectivitySubscription = ConnectivityWrapper.instance.onStatusChange.listen((status) {
  //     debugPrint('-----liveInternet-----CHI Scaffold-----------------$status');
  //     switch (status) {
  //       case ConnectivityStatus.CONNECTED:
  //         isConnected = true;
  //         notifyListeners();
  //         debugPrint('-----liveInternet-----CHI Scaffold-----------------connected');
  //         break;
  //       case ConnectivityStatus.DISCONNECTED:
  //         isConnected = false;
  //         notifyListeners();
  //         debugPrint('-----liveInternet-----CHI Scaffold-----------------disconnected');
  //         break;
  //     }
  //   });
  //   isConnected = await ConnectivityWrapper.instance.isConnected;
  //   notifyListeners();
  // }
  Future checkConnectivity() async {
    ConnectivityWrapper.instance.addresses =
        InternetConnectivity.DEFAULT_ADDRESSES;

    connectivitySubscription =
        ConnectivityWrapper.instance.onStatusChange.listen((status) {
      debugPrint('InternetConnectivity ---- Internet ---> $status');
      switch (status) {
        case ConnectivityStatus.CONNECTED:
          isConnected = true;
          notifyListeners();
          debugPrint('InternetConnectivity ----- Internet --> connected');
          break;
        case ConnectivityStatus.DISCONNECTED:
          isConnected = false;
          notifyListeners();
          debugPrint('InternetConnectivity ----- Internet --> disconnected');
          break;
      }
    });

    isConnected = await ConnectivityWrapper.instance.isConnected;
    notifyListeners();
  }

  @override
  void dispose() {
    debugPrint('-----liveInternet-----CHI Scaffold-----------------dispose');
    connectivitySubscription.cancel();
    super.dispose();
  }
}
