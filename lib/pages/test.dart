import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:onepref/onepref.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';

import 'package:flutter/material.dart';
import 'package:lot_size_calculator_app/services/in_app_purchase.dart';

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            initPlatformState();
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const TestWidget(),
            //   ),
            // ).then((result) {});
          },
          child: const Text("Next"),
        ),
      ),
    );
  }
}

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  // late StreamSubscription<List<PurchaseDetails>> _subscription;

  late final List<ProductDetails> _products = [];
  late bool isPurchased;
  IApEngine iApEngine = IApEngine();
  List<ProductId> storeProductIds = [];

  @override
  void initState() {
    if (Platform.isAndroid) {
      storeProductIds
          .add(ProductId(id: "com.all_currency_pair.app", isConsumable: false));
    }
    if (Platform.isIOS) {
      storeProductIds
          .add(ProductId(id: "com.AllCurrencyPair.app", isConsumable: false));
    }
    // final Stream<List<PurchaseDetails>> purchaseUpdated =
    //     InAppPurchase.instance.purchaseStream;
    // _subscription = purchaseUpdated.listen((p) {
    //   _listenToPurchaseUpdated(p);
    // }, onDone: () {
    //   // _subscription.cancel();
    // }, onError: (error) {
    //   // handle error here.
    // });
    iApEngine.inAppPurchase.purchaseStream.listen((list) {
      listenPurchase(list);
    });
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            iApEngine.handlePurchase(_products[index], storeProductIds);
          },
          title: Text(
            _products[index].description,
          ),
          subtitle: Text(
            _products[index].title,
          ),
          tileColor: Colors.yellow,
        ),
      ),
    );
  }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        // _showPendingUI();
      } else {
        // if (purchaseDetails.status == PurchaseStatus.error) {
        //   _handleError(purchaseDetails.error!);
        // } else if (purchaseDetails.status == PurchaseStatus.purchased ||
        //     purchaseDetails.status == PurchaseStatus.restored) {
        //   bool valid = await _verifyPurchase(purchaseDetails);
        //   if (valid) {
        //     _deliverProduct(purchaseDetails);
        //   } else {
        //     _handleInvalidPurchase(purchaseDetails);
        //   }
        // }
        if (purchaseDetails.pendingCompletePurchase) {
          await InAppPurchase.instance.completePurchase(purchaseDetails);
        }
      }
    });
  }

  void getProducts() async {
    await iApEngine.getIsAvailable().then((value) async {
      if (value) {
        await iApEngine.queryProducts(storeProductIds).then((response) {
          if (response.notFoundIDs.isNotEmpty) {
            print(response.notFoundIDs);
          }
          setState(() {
            _products.addAll(response.productDetails);
          });
        });
      }
    });
  }

  Future<void> listenPurchase(List<PurchaseDetails> list) async {
    for (var purchase in list) {
      if (purchase.status == PurchaseStatus.restored ||
          purchase.status == PurchaseStatus.purchased) {
        if (Platform.isAndroid &&
            iApEngine
                .getProductIdsOnly(storeProductIds)
                .contains(purchase.productID)) {
          final InAppPurchaseAndroidPlatformAddition androidPlatformAddition =
              iApEngine.inAppPurchase
                  .getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();
          print("おおおおおおおおおお");
        }
        if (purchase.pendingCompletePurchase) {
          await iApEngine.inAppPurchase.completePurchase(purchase);
          print("ええええええええ");
        }
        print("悪化かかかかかk");
      } else {
        print("あああああああああ");
      }
    }
  }

  // Future<void> checkPurchases() async {
  //   QueryPurchaseDetailsResponse response =
  //       await InAppPurchase.instance.queryPastPurchases();
  //   for (PurchaseDetails purchase in response.pastPurchases) {
  //     if (purchase.productID == 'your_product_id_here') {
  //       // 購入済みの製品
  //       print('Product is purchased!');
  //     }
  //   }
  // }
}
