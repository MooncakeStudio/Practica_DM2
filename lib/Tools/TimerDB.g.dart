// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TimerDB.dart';

// ignore_for_file: type=lint
class TimerDBData extends DataClass implements Insertable<TimerDBData> {
  final int id;
  final double tiempo;
  final int goals;
  const TimerDBData(
      {required this.id, required this.tiempo, required this.goals});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tiempo'] = Variable<double>(tiempo);
    map['goals'] = Variable<int>(goals);
    return map;
  }

  TimerDBCompanion toCompanion(bool nullToAbsent) {
    return TimerDBCompanion(
      id: Value(id),
      tiempo: Value(tiempo),
      goals: Value(goals),
    );
  }

  factory TimerDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimerDBData(
      id: serializer.fromJson<int>(json['id']),
      tiempo: serializer.fromJson<double>(json['tiempo']),
      goals: serializer.fromJson<int>(json['goals']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tiempo': serializer.toJson<double>(tiempo),
      'goals': serializer.toJson<int>(goals),
    };
  }

  TimerDBData copyWith({int? id, double? tiempo, int? goals}) => TimerDBData(
        id: id ?? this.id,
        tiempo: tiempo ?? this.tiempo,
        goals: goals ?? this.goals,
      );
  @override
  String toString() {
    return (StringBuffer('TimerDBData(')
          ..write('id: $id, ')
          ..write('tiempo: $tiempo, ')
          ..write('goals: $goals')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, tiempo, goals);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimerDBData &&
          other.id == this.id &&
          other.tiempo == this.tiempo &&
          other.goals == this.goals);
}

class TimerDBCompanion extends UpdateCompanion<TimerDBData> {
  final Value<int> id;
  final Value<double> tiempo;
  final Value<int> goals;
  const TimerDBCompanion({
    this.id = const Value.absent(),
    this.tiempo = const Value.absent(),
    this.goals = const Value.absent(),
  });
  TimerDBCompanion.insert({
    required int id,
    required double tiempo,
    required int goals,
  })  : id = Value(id),
        tiempo = Value(tiempo),
        goals = Value(goals);
  static Insertable<TimerDBData> custom({
    Expression<int>? id,
    Expression<double>? tiempo,
    Expression<int>? goals,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tiempo != null) 'tiempo': tiempo,
      if (goals != null) 'goals': goals,
    });
  }

  TimerDBCompanion copyWith(
      {Value<int>? id, Value<double>? tiempo, Value<int>? goals}) {
    return TimerDBCompanion(
      id: id ?? this.id,
      tiempo: tiempo ?? this.tiempo,
      goals: goals ?? this.goals,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tiempo.present) {
      map['tiempo'] = Variable<double>(tiempo.value);
    }
    if (goals.present) {
      map['goals'] = Variable<int>(goals.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimerDBCompanion(')
          ..write('id: $id, ')
          ..write('tiempo: $tiempo, ')
          ..write('goals: $goals')
          ..write(')'))
        .toString();
  }
}

class $TimerDBTable extends TimerDB with TableInfo<$TimerDBTable, TimerDBData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimerDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _tiempoMeta = const VerificationMeta('tiempo');
  @override
  late final GeneratedColumn<double> tiempo = GeneratedColumn<double>(
      'tiempo', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _goalsMeta = const VerificationMeta('goals');
  @override
  late final GeneratedColumn<int> goals = GeneratedColumn<int>(
      'goals', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, tiempo, goals];
  @override
  String get aliasedName => _alias ?? 'timer_d_b';
  @override
  String get actualTableName => 'timer_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<TimerDBData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('tiempo')) {
      context.handle(_tiempoMeta,
          tiempo.isAcceptableOrUnknown(data['tiempo']!, _tiempoMeta));
    } else if (isInserting) {
      context.missing(_tiempoMeta);
    }
    if (data.containsKey('goals')) {
      context.handle(
          _goalsMeta, goals.isAcceptableOrUnknown(data['goals']!, _goalsMeta));
    } else if (isInserting) {
      context.missing(_goalsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  TimerDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TimerDBData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      tiempo: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tiempo'])!,
      goals: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}goals'])!,
    );
  }

  @override
  $TimerDBTable createAlias(String alias) {
    return $TimerDBTable(attachedDatabase, alias);
  }
}

abstract class _$SessionDatabase extends GeneratedDatabase {
  _$SessionDatabase(QueryExecutor e) : super(e);
  late final $TimerDBTable timerDB = $TimerDBTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [timerDB];
}
