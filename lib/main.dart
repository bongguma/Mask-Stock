import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_stock/model/store.dart';
import 'package:mask_stock/screen/search_screen.dart';
import 'package:mask_stock/screen/stocklist_screen.dart';
import 'package:mask_stock/viewmodel/store_vm.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider.value(
    value: StoreViewModel(),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<GetPage> renderPages() {
    return [
      GetPage(
          name: '/stockList',
          page: () => StockListScreen(),
          transition: Transition.noTransition),
      GetPage(
          name: '/search',
          page: () => SearchScreen(),
          transition: Transition.noTransition),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/stockList',
      debugShowCheckedModeBanner: false,
      getPages: renderPages(),
    );
  }
}
