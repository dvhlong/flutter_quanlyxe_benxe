// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:quanlyxe_benxe/dsxe.dart';

void main(){
  runApp(ThiCuoiKy());
}
class ThiCuoiKy extends StatelessWidget {
  const ThiCuoiKy({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var fkey = GlobalKey<FormState>();
    var txtun = TextEditingController();
    var txtpw = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Đăng nhập hệ thống"),
      ),
            body: Form(
        key: fkey,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Đăng nhập",
              style: TextStyle(fontSize: 30, color: Colors.deepOrangeAccent),
            ),
            TextFormField(
              controller: txtun,
              validator: (value) {
                if (value == null || value.isEmpty)
                  return "Tên đăng nhập không được để trống";
                else
                  return null;
              },
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: "Vui lòng nhập tên đăng nhập",
                labelText: "Tên đăng nhập",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: true,
              controller: txtpw,
              validator: (value) {
                if (value == null || value.isEmpty)
                  return "Mật khẩu không được để trống";
                else if (value.length < 6)
                  return "Mật khẩu tối thiểu 6 kí tự";
                else
                  return null;
              },
              decoration: InputDecoration(
                icon: Icon(Icons.lock_open),
                hintText: "Vui lòng nhập mật khẩu",
                labelText: "Mật khẩu",
              ),
            ),
            Center(
              child: 
                ElevatedButton(
                    onPressed: () {
                      if (fkey.currentState!.validate()) {
                        print("Ok");
                        var userName = txtun.text;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => QuanLyXe(userName: userName)));
                      } else
                        print("Not OK");
                    },
                    child: Text("Đăng nhập")
                ),
            )
          ],
        ),
      ),
    );
  }
}