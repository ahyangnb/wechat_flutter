# log 
* 2020.02.16 适配flutter v1.12.13和Androidx，修复Android运行问题

* 2019.12.30 取消extended_text_field

# wechat_flutter

wechat_flutter是flutter版微信，目前已实现即时通讯基本功能，支持安卓和IOS，具体下载体验。
![start.gif](https://github.com/fluttercandies/wechat_flutter/blob/master/assets/git/start.gif)

# 效果图
|![1.gif](https://github.com/fluttercandies/wechat_flutter/blob/master/assets/git/1.jpg)| ![2.gif](https://github.com/fluttercandies/wechat_flutter/blob/master/assets/git/2.gif) | ![3.gif](https://github.com/fluttercandies/wechat_flutter/blob/master/assets/git/3.gif)|
| --- | --- | --- |
| ![4.gif](https://github.com/fluttercandies/wechat_flutter/blob/master/assets/git/4.gif) | ![5.gif](https://github.com/fluttercandies/wechat_flutter/blob/master/assets/git/5.gif) | ![6.gif](https://github.com/fluttercandies/wechat_flutter/blob/master/assets/git/6.gif) |
| ![7.gif](https://github.com/fluttercandies/wechat_flutter/blob/master/assets/git/7.gif) | ![8.gif](https://github.com/fluttercandies/wechat_flutter/blob/master/assets/git/8.gif) | ![9.gif](https://github.com/fluttercandies/wechat_flutter/blob/master/assets/git/9.gif) |
下载体验(Android)：[点击下载](http://www.flutterj.com/app-release.apk)

<img src="http://www.flutterj.com/download.png" style="zoom:50%;" />

IOS的直接拉下项目直接跑即可,

# 运行安卓androidx.core:core问题
##### 错误信息：
```
Android dependency 'androidx.core:core' has different version for 
the compile (1.0.0) and runtime (1.0.2) classpath. You should 
manually set the same version via DependencyResolution
```
##### 解决方案
项目最下方的`External Libraries` => `Flutter Plugins` => `image_picker-0.6.1+2`
=> `android` => `build.gradle` 然后最下方有`androidx.core:core:版本`。

直接改为`androidx.core:core:1.0.0`，
![](assets/git/core.png)
```
android {
    compileSdkVersion 28

    defaultConfig {
        minSdkVersion 16
        testInstrumentationRunner "androidx.test.runner.AndroidJUnitRunner"
    }
    lintOptions {
        disable 'InvalidPackage'
    }
    dependencies {
        implementation 'androidx.core:core:1.0.0'
        implementation 'androidx.annotation:annotation:1.0.0'
    }
}
```
然后permission_handler也一样改下。


# 特性

* [x] 文字消息
* [x] 图片消息
* [x] 语音消息
* [x] 删除会话
* [x] 语言国际化
* [x] 账号注册
* [x] 账号登陆
* [x] 自动登陆
* [x] 会话列表
* [x] 通讯录
* [x] 更改头像
* [x] 显示头像
* [x] 显示昵称
* [x] 更改昵称
* [x] 搜索好友
* [x] 添加好友
* [x] 删除好友
* [x] 视频拍摄
* [ ] 视频消息
* [ ] 位置消息
* [ ] 创建群聊
* [ ] 扫一扫
* [ ] 设置备注
* [ ] 发送表情


# 使用教程

*  使用命令（拉取项目）：$ git clone https://github.com/fluttercandies/wechat_flutter.git
*  然后命令（获取依赖）：$ flutter packages get  (IOS执行IOS部分再执行下一步)
*  最后命令（运行）：$ flutter run

IOS
*  进入项目IOS目录：$ cd ios/
*  更新Pod（非必须）：$ pod update
*  安装Pod：$ pod install

# 我的Flutter环境
```
q1deMacBook-Pro:~ q1$ flutter doctor -v
[✓] Flutter (Channel unknown, v1.12.13, on Mac OS X 10.14.5 18F2059, locale
    zh-Hans-CN)
    • Flutter version 1.12.13 at /Users/q1/flutter
    • Framework revision cf37c2cd07 (3 months ago), 2019-11-25 12:04:30 -0800
    • Engine revision b6b54fd606
    • Dart version 2.7.0

[✓] Android toolchain - develop for Android devices (Android SDK version 29.0.2)
    • Android SDK at /Users/q1/Library/Android/sdk
    • Android NDK location not configured (optional; useful for native profiling
      support)
    • Platform android-29, build-tools 29.0.2
    • ANDROID_HOME = /Users/q1/Library/Android/sdk
    • Java binary at: /Applications/Android
      Studio.app/Contents/jre/jdk/Contents/Home/bin/java
    • Java version OpenJDK Runtime Environment (build
      1.8.0_202-release-1483-b49-5587405)
    • All Android licenses accepted.

[✓] Xcode - develop for iOS and macOS (Xcode 11.3)
    • Xcode at /Applications/Xcode.app/Contents/Developer
    • Xcode 11.3, Build version 11C29
    • CocoaPods version 1.8.4

[✓] Android Studio (version 3.5)
    • Android Studio at /Applications/Android Studio.app/Contents
    • Flutter plugin version 42.1.1
    • Dart plugin version 191.8593
    • Java version OpenJDK Runtime Environment (build
      1.8.0_202-release-1483-b49-5587405)

[✓] Connected device (2 available)
    • Android SDK built for x86 • emulator-5554                        •
      android-x86 • Android 10 (API 29) (emulator)
    • iPhone 11 Pro Max         • 083FB0DB-0531-41FA-8C94-EADF5F884353 • ios
      • com.apple.CoreSimulator.SimRuntime.iOS-13-3 (simulator)

• No issues found!
```

# 关于项目太久没更
最近工作太繁忙，基本没啥时间更新，然后之前是做其他开源项目，导致这个项目太久没实质性进展，
不好意思哈各位，从现在开始进入维护状态。
![](assets/git/cui.png)

# Future

*  后期会把项目里所遇到的问题及解决的思路写成博客给大家学习。
*  仿微信录制音频开源库：https://github.com/yxwandroid/flutter_plugin_record

# Flutter微信群

<img src="assets/git/left_group.png" height="200" width="210" style="zoom:30%;" />

[上图无法显示点我](http://www.flutterj.com/left_group.png)

Flutter教程网：www.flutterj.com

Flutter交流QQ群：[874592746](https://jq.qq.com/?_wv=1027&k=5coTYqE)

# 公众号
<img src="http://www.flutterj.com/public.jpg" height="200" width="200" style="zoom:30%;" />

关注公众号“`Flutter前线`”，各种Flutter项目实战经验技巧，干活知识，Flutter面试题答案，等你来领取。

# 贡献者

<img src="http://www.flutterj.com/circle-cropped.png" height="150" width="150" style="zoom:30%;" />
