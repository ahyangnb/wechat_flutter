import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:wechat_flutter/im/other/update_entity.dart';
import 'package:wechat_flutter/provider/global_model.dart';
import 'package:wechat_flutter/tools/commom/check.dart';
import 'package:wechat_flutter/tools/wechat_flutter.dart';
import 'package:wechat_flutter/ui/dialog/update_dialog.dart';

/// 随机头像 [Random avatar]
void postSuggestionWithAvatar(BuildContext context) async {
  final model = Provider.of<GlobalModel>(context);

  Req.getInstance().get(
    API.cat,
    (v) async {
      String avatarUrl = v['url'];
      showToast(context, '设置头像成功');
      model.avatar = avatarUrl;
      model.refresh();
      await SharedUtil.instance.saveString(Keys.faceUrl, avatarUrl ?? '');
    },
  );
}

/// 检查更新 [check update]
void updateApi(BuildContext context) async {
  if (Platform.isIOS) return;
  Req.getInstance().get(
    API.update,
    (v) async {
      final packageInfo = await PackageInfo.fromPlatform();

      UpdateEntity model = UpdateEntity.fromJson(v);
      int currentVersion = int.parse(removeDot(packageInfo.version));
      int netVersion = int.parse(removeDot(model.appVersion));
      if (currentVersion >= netVersion) {
        debugPrint('当前版本是最新版本');
        return;
      }
      showDialog(
          context: context,
          builder: (ctx2) {
            return UpdateDialog(
              version: model.appVersion,
              updateUrl: model.downloadUrl,
              updateInfo: model.updateInfo,
            );
          });
    },
  );
}

/// 上传头像 [uploadImg]
uploadImgApi(BuildContext context, base64Img, Callback callback) async {
  Req.getInstance().post(
    API.uploadImg,
    (v) {
      print('code::${v['code']}');
      print('URL::${v['result']['URL']}');
      if (v['code'] == 200) {
        callback(v['result']['URL']);
      } else {
        callback(null);
      }
    },
    errorCallBack: (String msg, int code) {
      showToast(context, msg);
    },
    params: {"image_base_64": base64Img},
  );
}
