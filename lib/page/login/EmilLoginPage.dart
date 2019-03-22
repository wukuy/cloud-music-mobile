import 'package:flutter/material.dart';

class EmilLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('邮箱登录'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 40),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: _inputStyle(context, "请输入邮箱账号", Icons.email),
            ),
            _inputStyle(context, "请输入密码", Icons.lock_outline),
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
                onPressed: () {},
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

  _inputStyle(context, hintText, iconData) {
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
    );
  }
}
