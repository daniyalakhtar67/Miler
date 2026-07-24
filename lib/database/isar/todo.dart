import 'package:isar_community/isar.dart';
import 'package:running_app/database/isar/enum.dart';

part 'todo.g.dart';

@Collection()
class Todo {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  String? content;

  @enumerated
  Status status = Status.pending;

  DateTime createdat = DateTime.now();
  DateTime updatedat = DateTime.now();
}