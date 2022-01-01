// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quanlyxe_benxe/addxe.dart';
import 'package:quanlyxe_benxe/login.dart';
import 'package:quanlyxe_benxe/xedetail.dart';


class QuanLyXe extends StatelessWidget {
  String userName;
  QuanLyXe({ Key? key, required this.userName }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QLXHome(userName: userName),
    );
  }
}
class QLXHome extends StatefulWidget {
  final String userName;
  const QLXHome({ Key? key, required this.userName }) : super(key: key);

  @override
  _QLXHomeState createState() => _QLXHomeState();
}

class _QLXHomeState extends State<QLXHome> {
    List _items = [];
  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["xe"];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
           IconButton(
            icon: const Icon(Icons.logout,),
            onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const ThiCuoiKy())),
          ),
        ],
        centerTitle: true,
        title: const Text('Danh sách thông tin xe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Align(
              child: Text('Xin chào, '+widget.userName,),
              alignment: Alignment.centerRight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: const Text('Hiển thị danh sách'),
                  onPressed: readJson,
                ),
                ElevatedButton(
                  child: const Text('Thêm thông tin xe'),
                  onPressed: (){
                    Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ThemXe(userName: widget.userName,)));
                  } 
                )
              ],
            ),

            // Display the data loaded from sample.json
            _items.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 300,
                              child: Card(
                                margin: const EdgeInsets.all(5),
                                child: ListTile(
                                  leading: Text('${index+1}'),
                                  title: Row(
                                    children: [
                                      const Text('Biển số xe: ',style: TextStyle(color: Colors.redAccent),),
                                      Text(_items[index]["bsx"]),
                                    ],
                                  ),
                                  subtitle: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            'Ngày vào: ',
                                            style: TextStyle(color: Colors.blueAccent),
                                          ),
                                          Text(_items[index]["nv"]),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Giờ Vào: ',
                                            style: TextStyle(color: Colors.blueAccent),
                                          ),
                                          Text(_items[index]["gv"]),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Ngày Ra: ',
                                            style: TextStyle(color: Colors.green),
                                          ),
                                          _items[index]["nr"]==null?const Text('Xe Chưa Ra'):Text(_items[index]["nr"]),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Giờ Ra: ',
                                            style: TextStyle(color: Colors.green),
                                          ),
                                          _items[index]["gr"] == null
                                              ? const Text('Xe Chưa Ra')
                                              : Text(_items[index]["gr"]),
                                        ],
                                      ),
                                    ],
                                  ),
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => Chitiet(bsx: _items[index]["bsx"],nv: _items[index]["nv"], gv: _items[index]["gv"],nr: _items[index]["nr"] ?? "null",gr: _items[index]["gr"] ?? "null",tx: _items[index]["tx"],cmt: _items[index]["cmt"],td: _items[index]["td"],hx: _items[index]["hx"],)
                                    ),);
                                  },
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                              onPressed: (){
                                showDialog(
                                  context: context, 
                                  builder: (context) {
                                    return AlertDialog(
                                      content: const Text('Xác nhận xoá ?'),
                                      actions: [
                                        TextButton(
                                          onPressed: (){
                                            Navigator.pop(context,'Yes');
                                            showDialog(
                                              context: context, 
                                              builder: (context) {
                                                return AlertDialog(
                                                  content: const Text('Đã xoá thành công !!'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: (){
                                                        Navigator.pop(context,'OK');
                                                      }, 
                                                      child: const Text('OK')
                                                    )
                                                  ],
                                                );
                                              }
                                            );
                                          }, 
                                          child: const Text('Yes'),
                                        ),
                                        TextButton(
                                              onPressed: (){
                                                Navigator.pop(
                                                    context, 'No');
                                                },
                                              child: const Text('No'),
                                        ),
                                      ],
                                    );
                                  }
                                );
                              }, 
                              child: const Icon(Icons.close)
                            )
                          ],
                        );
                      },
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}