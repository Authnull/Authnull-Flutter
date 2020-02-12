class AuthorizationPlatform {
  static const String Brontosaurus = "Brontosaurus";
  static const String Debug = "Debug";
  static const String Google = "Google";
}

abstract class AuthorizationConfig {
  String type;
}

abstract class AuthorizationStaus {
  String platform;

  Map<String, dynamic> toMap();
  String toString();
}
