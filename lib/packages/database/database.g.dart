// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $WordPairItemsTable extends WordPairItems
    with TableInfo<$WordPairItemsTable, WordPairItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordPairItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _leftMeta = const VerificationMeta('left');
  @override
  late final GeneratedColumn<String> left = GeneratedColumn<String>(
      'left', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _rightMeta = const VerificationMeta('right');
  @override
  late final GeneratedColumn<String> right = GeneratedColumn<String>(
      'right', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, left, right];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'word_pair_items';
  @override
  VerificationContext validateIntegrity(Insertable<WordPairItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('left')) {
      context.handle(
          _leftMeta, left.isAcceptableOrUnknown(data['left']!, _leftMeta));
    } else if (isInserting) {
      context.missing(_leftMeta);
    }
    if (data.containsKey('right')) {
      context.handle(
          _rightMeta, right.isAcceptableOrUnknown(data['right']!, _rightMeta));
    } else if (isInserting) {
      context.missing(_rightMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WordPairItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WordPairItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      left: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}left'])!,
      right: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}right'])!,
    );
  }

  @override
  $WordPairItemsTable createAlias(String alias) {
    return $WordPairItemsTable(attachedDatabase, alias);
  }
}

class WordPairItem extends DataClass implements Insertable<WordPairItem> {
  final int id;
  final String left;
  final String right;
  const WordPairItem(
      {required this.id, required this.left, required this.right});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['left'] = Variable<String>(left);
    map['right'] = Variable<String>(right);
    return map;
  }

  WordPairItemsCompanion toCompanion(bool nullToAbsent) {
    return WordPairItemsCompanion(
      id: Value(id),
      left: Value(left),
      right: Value(right),
    );
  }

  factory WordPairItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WordPairItem(
      id: serializer.fromJson<int>(json['id']),
      left: serializer.fromJson<String>(json['left']),
      right: serializer.fromJson<String>(json['right']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'left': serializer.toJson<String>(left),
      'right': serializer.toJson<String>(right),
    };
  }

  WordPairItem copyWith({int? id, String? left, String? right}) => WordPairItem(
        id: id ?? this.id,
        left: left ?? this.left,
        right: right ?? this.right,
      );
  @override
  String toString() {
    return (StringBuffer('WordPairItem(')
          ..write('id: $id, ')
          ..write('left: $left, ')
          ..write('right: $right')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, left, right);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordPairItem &&
          other.id == this.id &&
          other.left == this.left &&
          other.right == this.right);
}

class WordPairItemsCompanion extends UpdateCompanion<WordPairItem> {
  final Value<int> id;
  final Value<String> left;
  final Value<String> right;
  const WordPairItemsCompanion({
    this.id = const Value.absent(),
    this.left = const Value.absent(),
    this.right = const Value.absent(),
  });
  WordPairItemsCompanion.insert({
    this.id = const Value.absent(),
    required String left,
    required String right,
  })  : left = Value(left),
        right = Value(right);
  static Insertable<WordPairItem> custom({
    Expression<int>? id,
    Expression<String>? left,
    Expression<String>? right,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (left != null) 'left': left,
      if (right != null) 'right': right,
    });
  }

  WordPairItemsCompanion copyWith(
      {Value<int>? id, Value<String>? left, Value<String>? right}) {
    return WordPairItemsCompanion(
      id: id ?? this.id,
      left: left ?? this.left,
      right: right ?? this.right,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (left.present) {
      map['left'] = Variable<String>(left.value);
    }
    if (right.present) {
      map['right'] = Variable<String>(right.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordPairItemsCompanion(')
          ..write('id: $id, ')
          ..write('left: $left, ')
          ..write('right: $right')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $WordPairItemsTable wordPairItems = $WordPairItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [wordPairItems];
}
