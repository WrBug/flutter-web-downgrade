import 'package:flutter_web_downgrade/platform_channel/channel_utils.dart';

class ChannelTest {
  static final _channel = getChannel("test");

  static Future<String> getSystemName() async {
    return await _channel.invokeMethod("getSystemName");
  }

  static Future<List> getData() async {
    var result = await _channel.invokeMethod("getData");
    return result;
  }

  static showDialog(String content) {
    _channel.invokeMethod("alert", content);
  }
}
