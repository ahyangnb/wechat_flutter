import 'package:get/get.dart';
import 'package:wechat_flutter/pages/contacts/group_select_page.dart';
import 'package:flutter/material.dart';
import 'package:wechat_flutter/tools/wechat_flutter.dart';

class LaunchGroupItem extends StatelessWidget {
  final String item;

  LaunchGroupItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: lineColor, width: 0.3),
        ),
      ),
      alignment: Alignment.centerLeft,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 15.0),
        ),
        onPressed: () {
          if (item == '选择一个群') {
            Get.to<void>(GroupSelectPage());
          } else {
            showToast( '敬请期待');
          }
        },
        child: Container(
          width: Get.width,
          padding: EdgeInsets.only(left: 20.0),
          child: Text(item),
        ),
      ),
    );
  }
}

class LaunchSearch extends StatelessWidget {
  final FocusNode? searchF;
  final TextEditingController? searchC;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onSubmitted;
  final GestureTapCallback? delOnTap;

  LaunchSearch({
    this.searchF,
    this.searchC,
    this.onChanged,
    this.onTap,
    this.onSubmitted,
    this.delOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Image.asset('assets/images/search_black.webp',
              color: mainTextColor),
        ),
        Expanded(
          child: TextField(
            focusNode: searchF,
            controller: searchC,
            style: TextStyle(textBaseline: TextBaseline.alphabetic),
            decoration: InputDecoration(
              hintText: '搜索',
              hintStyle: TextStyle(color: lineColor.withOpacity(0.7)),
              border: InputBorder.none,
            ),
            onChanged: onChanged,
            onTap: onTap ?? () {},
            textInputAction: TextInputAction.search,
            onSubmitted: onSubmitted,
          ),
        ),
        if (searchC != null && searchC!.text.isNotEmpty)
          InkWell(
            child: Image.asset('assets/images/ic_delete.webp'),
            onTap: () {
              searchC!.clear();
              if (delOnTap != null) delOnTap!();
            },
          )
        else
          Container()
      ],
    );
  }
}