import 'package:uuid/uuid.dart';

class UUID {
  static const _internal = Uuid();

  static String getUUID() {
    return _internal.v4();
  }
}