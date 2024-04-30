import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import 'json_map.dart';

part 'word_pair.g.dart';

@immutable
@JsonSerializable()
class WordPair extends Equatable {
  WordPair({
    required this.title,
    String? id,
  })  : assert(
          id == null || id.isNotEmpty,
          'id must either be null or not empty',
        ),
        id = id ?? const Uuid().v4();

  final String id;
  final String title;

  WordPair copyWith({
    String? id,
    String? title,
  }) {
    return WordPair(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  static WordPair fromJson(JsonMap json) => _$WordPairFromJson(json);

  JsonMap toJson() => _$WordPairToJson(this);

  @override
  List<Object> get props => [id, title];
}
