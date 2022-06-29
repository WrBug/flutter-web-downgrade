import 'package:flutter/services.dart';
import 'base_channel.dart';

Channel createChannel(name) => NativeChannel(name);

class NativeChannel extends Channel {
  late MethodChannel platform;

  NativeChannel(name) : super(name) {
    platform = MethodChannel(name);
  }

  @override
  Future invokeMethod(String method, [dynamic arguments]) async {
    return platform.invokeMethod(method, arguments);
  }
}
