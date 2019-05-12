import 'package:flutter/material.dart';
import 'package:cloud_music_mobile/assets/ConstDefine.dart';
import 'package:cloud_music_mobile/page/login/LoginPage.dart';
import 'package:cloud_music_mobile/page/login/EmilLoginPage.dart';
import 'package:cloud_music_mobile/page/login/RegisterPage.dart';
import 'package:cloud_music_mobile/page/HomePage.dart';

class LoginMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Logo(),
          Expanded(
            child: LoginMain(),
          ),
          OtherLogin(),
        ],
      ),
    );
  }
}

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 268,
      child: Center(
        child: Image.asset(
          ConstDefine.logo,
          width: 86,
          height: 86,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class LoginMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 35, right: 35),
      child: Column(
        children: <Widget>[
          _buttonStyle(context, '手机号登录', () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return LoginPage();
            }));
          }),
          Container(
            child: _buttonStyle(context, '注册', () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return RegisterPage();
              }));
            }),
            margin: EdgeInsets.only(top: 14, bottom: 10),
          ),
          FlatButton(
            child: Text(
              '游客试用',
              style: TextStyle(
                color: Colors.black54,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
                decorationColor: Colors.black45,
                fontSize: 12
              ),
              
            ),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  _buttonStyle(context, text, onPressed) {
    return OutlineButton(
      padding: EdgeInsets.only(top: 12, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 16),
          )
        ],
      ),
      shape: StadiumBorder(),
      onPressed: onPressed,
      borderSide: BorderSide(color: Theme.of(context).primaryColor),
    );
  }
}

class OtherLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            Text(
              '其他登陆方式',
              style: TextStyle(color: Colors.black54, fontSize: 12),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _otherLoginItemStyle(context, "微信", () {}, Colors.green),
                  _otherLoginItemStyle(context, "QQ", () {}, Colors.blue),
                  _otherLoginItemStyle(
                      context, "微博", () {}, Theme.of(context).primaryColor),
                  _otherLoginItemStyle(context, "网易邮箱", () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return EmilLoginPage();
                    }));
                  }, Theme.of(context).primaryColor)
                ],
              ),
            )
          ],
        ));
  }

  _otherLoginItemStyle(context, text, onPressed, iconColor) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 4),
          child: IconButton(
            icon: Icon(Icons.wallpaper),
            color: iconColor,
            onPressed: onPressed,
          ),
          width: 42,
          height: 42,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              shape: BoxShape.circle),
        ),
        Text(text, style: TextStyle(color: Colors.black54, fontSize: 10))
      ],
    );
  }
}
