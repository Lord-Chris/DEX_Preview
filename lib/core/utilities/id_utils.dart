import 'package:uuid/uuid.dart';

class IdUtils {
  static String generateId() {
    return const Uuid().v4();
  }
}
