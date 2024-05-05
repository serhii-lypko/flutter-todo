// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'packages/data_provider/models.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 1879677691561852661),
      name: 'WordPair',
      lastPropertyId: const obx_int.IdUid(3, 3137754428412929095),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 5908853244331227678),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 8633524864364685122),
            name: 'left',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 3137754428412929095),
            name: 'right',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(2, 5476825724207937318),
      name: 'UserSettings',
      lastPropertyId: const obx_int.IdUid(2, 6821659371431700654),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 3915535458084119597),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 6821659371431700654),
            name: 'darkMode',
            type: 1,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(2, 5476825724207937318),
      lastIndexId: const obx_int.IdUid(0, 0),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    WordPair: obx_int.EntityDefinition<WordPair>(
        model: _entities[0],
        toOneRelations: (WordPair object) => [],
        toManyRelations: (WordPair object) => {},
        getId: (WordPair object) => object.id,
        setId: (WordPair object, int id) {
          object.id = id;
        },
        objectToFB: (WordPair object, fb.Builder fbb) {
          final leftOffset = fbb.writeString(object.left);
          final rightOffset = fbb.writeString(object.right);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, leftOffset);
          fbb.addOffset(2, rightOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final leftParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final rightParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final object = WordPair(leftParam, rightParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    UserSettings: obx_int.EntityDefinition<UserSettings>(
        model: _entities[1],
        toOneRelations: (UserSettings object) => [],
        toManyRelations: (UserSettings object) => {},
        getId: (UserSettings object) => object.id,
        setId: (UserSettings object, int id) {
          object.id = id;
        },
        objectToFB: (UserSettings object, fb.Builder fbb) {
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addBool(1, object.darkMode);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final darkModeParam =
              const fb.BoolReader().vTableGet(buffer, rootOffset, 6, false);
          final object = UserSettings(darkMode: darkModeParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [WordPair] entity fields to define ObjectBox queries.
class WordPair_ {
  /// see [WordPair.id]
  static final id =
      obx.QueryIntegerProperty<WordPair>(_entities[0].properties[0]);

  /// see [WordPair.left]
  static final left =
      obx.QueryStringProperty<WordPair>(_entities[0].properties[1]);

  /// see [WordPair.right]
  static final right =
      obx.QueryStringProperty<WordPair>(_entities[0].properties[2]);
}

/// [UserSettings] entity fields to define ObjectBox queries.
class UserSettings_ {
  /// see [UserSettings.id]
  static final id =
      obx.QueryIntegerProperty<UserSettings>(_entities[1].properties[0]);

  /// see [UserSettings.darkMode]
  static final darkMode =
      obx.QueryBooleanProperty<UserSettings>(_entities[1].properties[1]);
}
