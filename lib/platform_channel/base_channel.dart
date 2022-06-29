abstract class Channel {
  final String name;

  Channel(this.name);

  Future invokeMethod(String method, [dynamic arguments]);
}
