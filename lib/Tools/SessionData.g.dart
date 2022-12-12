part of 'SessionData.dart';

class SessionDataData extends DataClass implements Insertable<SessionDataData> {
  final int id;
  final String fecha;
  final String state;
  final double tiempo;
  const SessionDataData(
      {required this.id,
        required this.fecha,
        required this.state,
        required this.tiempo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['fecha'] = Variable<String>(fecha);
    map['state'] = Variable<String>(state);
    map['tiempo'] = Variable<double>(tiempo);
    return map;
  }

  SessionDataCompanion toCompanion(bool nullToAbsent) {
    return SessionDataCompanion(
      id: Value(id),
      fecha: Value(fecha ),
      state: Value(state),
      tiempo: Value(tiempo),
    );
  }

  factory SessionDataData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionDataData(
      id: serializer.fromJson<int>(json['id']),
      fecha: serializer.fromJson<String>(json['fecha']),
      state: serializer.fromJson<String>(json['state']),
      tiempo: serializer.fromJson<double>(json['tiempo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fecha': serializer.toJson<String>(fecha),
      'state': serializer.toJson<String>(state),
      'tiempo': serializer.toJson<double>(tiempo),
    };
  }

  SessionDataData copyWith(
      {int? id, String? fecha, String? state, double? tiempo}) =>
      SessionDataData(
        id: id ?? this.id,
        fecha: fecha ?? this.fecha,
        state: state ?? this.state,
        tiempo: tiempo ?? this.tiempo,
      );
  @override
  String toString() {
    return (StringBuffer('SessionDataData(')
      ..write('id: $id, ')
      ..write('fecha: $fecha, ')
      ..write('state: $state, ')
      ..write('tiempo: $tiempo')
      ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, fecha, state, tiempo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is SessionDataData &&
              other.id == this.id &&
              other.fecha == this.fecha &&
              other.state == this.state &&
              other.tiempo == this.tiempo);
}

class SessionDataCompanion extends UpdateCompanion<SessionDataData> {
  final Value<int> id;
  final Value<String> fecha;
  final Value<String> state;
  final Value<double> tiempo;
  const SessionDataCompanion({
    this.id = const Value.absent(),
    this.fecha = const Value.absent(),
    this.state = const Value.absent(),
    this.tiempo = const Value.absent(),
  });
  SessionDataCompanion.insert({
    this.id = const Value.absent(),
    required String fecha,
    required String state,
    required double tiempo,
  })  : fecha = Value(fecha),
        state = Value(state),
        tiempo = Value(tiempo);
  static Insertable<SessionDataData> custom({
    Expression<int>? id,
    Expression<String>? fecha,
    Expression<String>? state,
    Expression<double>? tiempo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fecha != null) 'fecha': fecha,
      if (state != null) 'state': state,
      if (tiempo != null) 'tiempo': tiempo,
    });
  }

  SessionDataCompanion copyWith(
      {Value<int>? id,
        Value<String>? fecha,
        Value<String>? state,
        Value<double>? tiempo}) {
    return SessionDataCompanion(
      id: id ?? this.id,
      fecha: fecha ?? this.fecha,
      state: state ?? this.state,
      tiempo: tiempo ?? this.tiempo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fecha.present) {
      map['fecha'] = Variable<String>(fecha.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (tiempo.present) {
      map['tiempo'] = Variable<double>(tiempo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionDataCompanion(')
      ..write('id: $id, ')
      ..write('fecha: $fecha, ')
      ..write('state: $state, ')
      ..write('tiempo: $tiempo')
      ..write(')'))
        .toString();
  }
}

class $SessionDataTable extends SessionData
    with TableInfo<$SessionDataTable, SessionDataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
      GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _fechaMeta = const VerificationMeta('fecha');
  @override
  late final GeneratedColumn<String> fecha = GeneratedColumn<String>(
      'fecha', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
      'state', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tiempoMeta = const VerificationMeta('tiempo');
  @override
  late final GeneratedColumn<double> tiempo = GeneratedColumn<double>(
      'tiempo', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, fecha, state, tiempo];
  @override
  String get aliasedName => _alias ?? 'session_data';
  @override
  String get actualTableName => 'session_data';
  @override
  VerificationContext validateIntegrity(Insertable<SessionDataData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('fecha')) {
      context.handle(
          _fechaMeta, fecha.isAcceptableOrUnknown(data['fecha']!, _fechaMeta));
    } else if (isInserting) {
      context.missing(_fechaMeta);
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    } else if (isInserting) {
      context.missing(_stateMeta);
    }
    if (data.containsKey('tiempo')) {
      context.handle(_tiempoMeta,
          tiempo.isAcceptableOrUnknown(data['tiempo']!, _tiempoMeta));
    } else if (isInserting) {
      context.missing(_tiempoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SessionDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionDataData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      fecha: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fecha'])!,
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state'])!,
      tiempo: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tiempo'])!,
    );
  }

  @override
  $SessionDataTable createAlias(String alias) {
    return $SessionDataTable(attachedDatabase, alias);
  }
}

abstract class _$SessionDatabase extends GeneratedDatabase {
  _$SessionDatabase(QueryExecutor e) : super(e);
  late final $SessionDataTable sessionData = $SessionDataTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [sessionData];
}