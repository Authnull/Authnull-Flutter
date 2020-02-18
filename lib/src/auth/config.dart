class AuthorizationPlatform {
  static const String Brontosaurus = "Brontosaurus";
  static const String Debug = "Debug";
  static const String Google = "Google";
}

abstract class AuthorizationConfig {
  String type;
}

abstract class AuthorizationStaus {
  final String platform;
  final String username;
  final String displayName;
  final String identifier;
  final String email;
  final String phone;

  final Map<String, dynamic> infos;
  final Map<String, dynamic> beacons;

  AuthorizationStaus({
    this.platform,
    this.username,
    this.displayName,
    this.identifier,
    this.email,
    this.phone,
    this.infos,
    this.beacons,
  });

  Map<String, dynamic> toMap();
  String toString();
}
