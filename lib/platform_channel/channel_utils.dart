import 'dart:collection';
import 'base_channel.dart';
import 'platform_channel.dart'
    if (dart.library.io) 'native_channel.dart'
    if (dart.library.html) 'web_channel.dart';

var map = HashMap<String, Channel>();

Channel getChannel(name) {
  if (map.containsKey(name)) {
    return map[name]!;
  }
  var channel = createChannel(name);
  map[name] = channel;
  return channel;
}
