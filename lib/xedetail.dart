// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quanlyxe_benxe/editxe.dart';

class XeDetails extends StatelessWidget {
  const XeDetails({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Chitiet(bsx: '', cmt: '', gr: '', gv: '', hx: '', nr: '', nv: '', td: '', tx: '',),
    );
  }
}
class Chitiet extends StatefulWidget {
  final String bsx;
  final String gv;
  final String gr;
  final String nv;
  final String nr;
  final String tx;
  final String cmt;
  final String hx;
  final String td;
  const Chitiet({ Key? key, required this.bsx, required this.gv, required this.gr, required this.nv, required this.nr, required this.tx, required this.cmt, required this.hx, required this.td }) : super(key: key);

  @override
  _ChitietState createState() => _ChitietState();
}

class _ChitietState extends State<Chitiet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết thông tin xe'),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Suaxe(bsx: widget.bsx,gr: widget.gr,gv:widget.gv,nv:widget.nv,nr:widget.nr,hx:widget.hx,td:widget.td,tx:widget.tx,cmt:widget.cmt)));
            }, 
            icon: const Icon(Icons.edit)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const Text('Biển Số Xe: ', style: TextStyle(fontSize: 20)),
                Text(widget.bsx, style: TextStyle(fontSize: 20))
              ],
            ),
            Row(
              children: [const Text('Hãng Xe: ',style: TextStyle(fontSize: 20),), Text(widget.hx, style: const TextStyle(fontSize: 20))],
            ),
            Row(
              children: [const Text('Tuyến Đường: ', style: TextStyle(fontSize: 20)), Text(widget.td, style: TextStyle(fontSize: 20))],
            ),
            Row(
              children: [const Text('Tài Xế: ', style: TextStyle(fontSize: 20)), Text(widget.tx, style: TextStyle(fontSize: 20))],
            ),
            Row(
              children: [const Text('Chứng minh thư: ', style: TextStyle(fontSize: 20)), Text(widget.cmt, style: TextStyle(fontSize: 20))],
            ),
            Row(
              children: [const Text('Ngày vào bến: ', style: TextStyle(fontSize: 20)), Text(widget.nv, style: TextStyle(fontSize: 20))],
            ),
            Row(
              children: [const Text('Giờ vào bến: ', style: TextStyle(fontSize: 20)), Text(widget.gv, style: TextStyle(fontSize: 20))],
            ),
            Row(
              children: [const Text('Ngày ra bến: ', style: TextStyle(fontSize: 20)), widget.nr == "null" ? const Text('Xe chưa ra', style: TextStyle(fontSize: 20,color: Colors.red)) : Text(widget.nr, style: TextStyle(fontSize: 20))],
            ),
            Row(
              // ignore: unnecessary_null_comparison
              children: [const Text('Giờ ra bến: ', style: TextStyle(fontSize: 20)), widget.gr=="null"?const Text('Xe chưa ra', style: TextStyle(fontSize: 20,color: Colors.red)):Text(widget.gr, style: TextStyle(fontSize: 20))],
            ),
          ],
        ),
      ),
    );
  }
}