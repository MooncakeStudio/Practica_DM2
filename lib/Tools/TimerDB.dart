import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'TimerDB.g.dart';

class TimerDB extends Table{
  IntColumn get id => integer()();
  RealColumn get tiempo => real()();
  IntColumn get goals => integer()();
}

@DriftDatabase(tables: [TimerDB])
class SessionDatabase extends _$SessionDatabase
{
  SessionDatabase() : super(_openConnection());

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 1;

  Stream<List<TimerDBData>> getTime(int id){
    final query = select(timerDB)..where((tbl) => tbl.id.equals(id));
    return query.watch();
  }

  Future insertSession(TimerDBData sessionDataCompanion) async{
    return await into(timerDB).insert(sessionDataCompanion);
  }

  Future updateSession(TimerDBData timerDBCompanion) async{
    return await update(timerDB).replace(timerDBCompanion);
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}


/*@DriftDatabase(tables: [SessionData])
class SessionDatabase extends _$SessionDatabase
{
  SessionDatabase() : super(_openConnection());

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 1;


  Future<List<SessionDataData>> getSessionList() async{
    final sessionsGroup = sessionData.id.count();
    final query = select(sessionData);
    query
      ..addColumns([sessionsGroup])
          .groupBy([sessionData.state]);

    return await query.get();
  }

  Future<int> insertSession(SessionDataCompanion sessionDataCompanion) async{
    return await into(sessionData).insert(sessionDataCompanion);
  }

  void getSessionFocus() async{
    final sessionsGroup = sessionData.id.count();
    final query = (select(sessionData)..addColumns([sessionsGroup]).groupBy([sessionData.state]));

    final results = await query.get();
    for(final row in results){
      final state = row.state;
      print(state);
    }
  }
}
LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}*/