import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/common/dao/LoginDao.dart';
import 'package:cloud_music_mobile/models/UserInfo.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  String phone;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手机号登录'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 40),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: _inputStyle("+86 请输入手机号码", Icons.phone_iphone, (val) {
                phone = val;
              }),
            ),
            _inputStyle("请输入密码", Icons.lock_outline, (val) {
              password = val;
            }),
            Container(
              margin: EdgeInsets.only(top: 32),
              child: FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '登录',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                onPressed: () {
                  UserInfo userInfo = _getUserInfo({"phone": phone, "password": password});
                  Fluttertoast.showToast(
                    msg: "This is Center Short Toast",
                    // toastLength: Toast.LENGTH_SHORT,
                    // gravity: ToastGravity.CENTER,
                    // timeInSecForIos: 1,
                    // backgroundColor: Colors.red,
                    // textColor: Colors.white,
                    fontSize: 16.0
                );
                },
                shape: StadiumBorder(),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                padding: EdgeInsets.only(top: 12, bottom: 12),
              ),
            )
          ],
        ),
      ),
    );
  }

  _inputStyle(hintText, iconData, onChanged) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          iconData,
          color: Colors.black26,
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black26),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black26)),
      ),
      cursorColor: Theme.of(context).primaryColor,
      autofocus: true,
      style: TextStyle(color: Colors.black87),
      onChanged: onChanged,
    );
  }

  _getUserInfo(Map data) async {
    return await LoginDao.logoin(data);
  }
}
