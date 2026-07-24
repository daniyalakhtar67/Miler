import 'package:isar/isar.dart';
import 'package:running_app/database/isar/enum.dart';
part 'todo.g.dart';
@Collection( ) // equivalent of a "table" in Sql
class Todo { //row/record stored in the database.
  Id id = Isar.autoIncrement;
  @Index(type: IndexType.value)
  String? content;
  bool isDone = false;
  @enumerated
  Status status = Status.pending;
  DateTime createdat = DateTime.now();
  DateTime updatedat = DateTime.now();
}