import 'package:flutter/material.dart';
import 'package:wechat_flutter/tools/wechat_flutter.dart';
import 'package:wechat_flutter/im/login_handle.dart';

class SetPage extends StatefulWidget {
  const SetPage({Key key}) : super(key: key);

  @override
  State<SetPage> createState() => _SetPageState();
}

class _SetPageState extends State<SetPage> {
  List items = [
    "账号与安全",
    "青少年模式",
    "关怀模式",
    "消息通知",
    "通用",
    "朋友权限",
    "个人信息权限",
    "个人信息收集清单",
    "第三方信息共享清单",
    "帮助与反馈",
    "关于微信",
    "插件",
  ];

  List itemsEnd = [
    "切换账号",
    "退出登录",
  ];

  void actionHandle(e) {
    switch (e) {
      case "退出登录":
        loginOut(context);
        break;
      default:
        break;
    }
  }

  bool isNotBorder(String value) {
    return value == "账号与安全" ||
        value == "关怀模式" ||
        value == "通用" ||
        value == "第三方信息共享清单" ||
        value == "关于微信" ||
        value == "插件";
  }

  bool isTopMargin(String value) {
    return value == "青少年模式" ||
        value == "消息通知" ||
        value == "帮助与反馈" ||
        value == "插件";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarColor,
      appBar: ComMomBar(title: "设置"),
      body: ListView(
        children: items.map<Widget>((e) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isTopMargin(e))
                new Container(
                    width: double.infinity, height: 10, color: appBarColor),
              if (e == "朋友权限")
                Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, bottom: 6, top: 15),
                  child: Text(
                    '隐私',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
              Material(
                color: Colors.white,
                child: InkWell(
                  onTap: () => actionHandle(e),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color:
                              Colors.grey.withOpacity(isNotBorder(e) ? 0 : 0.2),
                        ),
                      ),
                    ),
                    child: Text(
                      e,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }).toList()
          ..add(Space())
          ..addAll(
            itemsEnd.map((e) {
              return Container(
                margin: EdgeInsets.only(top: e == "退出登录" ? 10 : 0),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 15)),
                  ),
                  onPressed: () => actionHandle(e),
                  child: Text(
                    e,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
              );
            }).toList(),
          )
          ..add(Space()),
      ),
    );
  }
}
