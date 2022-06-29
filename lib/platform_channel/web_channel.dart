import 'package:js/js.dart';
import 'base_channel.dart';
import 'dart:convert' as convert;

@JS()
external String callNative(String name, String method, dynamic content);

@JS('JSON.stringify')
external String stringify(Object obj);

Channel createChannel(name) => WebChannel(name);

class WebChannel extends Channel {
  WebChannel(name) : super(name);

  @override
  Future invokeMethod(String method, [dynamic arguments]) {
    return Future(() {
      var result = getWrapperData(arguments);
      return _convert(callNative(name, method, result));
    });
  }

  String getWrapperData(arguments) {
    var map = {"data": arguments};
    return convert.jsonEncode(map);
  }

  _convert(dynamic obj) {
    if (obj == null || obj is num || obj is bool || obj is String) {
      return obj;
    }
    if (obj is List) {
      var list = [];
      for (var element in obj) {
        list.add(_convert(element));
      }
      return list;
    }
    return Map.from(convert.jsonDecode(stringify(obj)));
  }
}
