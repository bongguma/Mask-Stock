import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mask_stock/model/store.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Store>? storeList = [];

  Future fetch() async {
    var uri = 'https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json?name=%EB%8C%80%EC%A7%80%EC%95%BD%EA%B5%AD';

    // get 방식이 비동기로 받아와 await 키워드가 존재하지 않을 시, response값 안에 데이터가 없을 수도 있다.
    var response = await http.get(Uri.parse(uri));
    
    final jsonResult = jsonDecode(utf8.decode(response.bodyBytes));
    final storeListData = jsonResult['stores'];

    // 동일한 데이터가 쌓일 수 있으므로 한 번 clear 진
    storeList!.clear();
    storeListData.foreach((jsonData) {
      storeList!.add(Store.fromJson(jsonData));
    });

    // log('Response statusCode :: ${response.statusCode}');  // 성공여부
    // log('Response body :: ${response.body}');  // 통신 데이터 출력
    log('storeList json result :: ${jsonResult['stores']}'); // json형식 storeList

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('마스크 재고 존재 장소 전체 : ${0}'),
      ),
      body: Container(
        child: TextButton(
          onPressed: () async {
            await fetch();

            // 만약 내가 여기서 storeList 데이터를 출력하고 싶을 때에는 onPressed 비동기가 필수
            log('storeList :: ${storeList!.toString()}');
          }, child: Text('Click!!'),
          
        ),
      ),
    );
  }
}
