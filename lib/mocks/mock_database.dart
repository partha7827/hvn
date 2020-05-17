import 'package:highvibe/models/models.dart';

var mockUser = User((b) => b..id = "default" ..name = "Default User");

final mockDatabase = """
      { "users": { "${mockUser.id}": ${mockUser.toJson()} } }
    """;
