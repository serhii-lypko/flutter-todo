import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

// import 'json_map.dart';

// part 'word_pair.g.dart';

// @JsonSerializable()
@immutable
class WordPair extends Equatable {
  WordPair({
    required this.left,
    required this.right,
    String? id,
  })  : assert(
          id == null || id.isNotEmpty,
          'id must either be null or not empty',
        ),
        id = id ?? const Uuid().v4();

  final String id;
  final String left;
  final String right;

  WordPair copyWith({
    String? id,
    String? left,
    String? right,
  }) {
    return WordPair(
      id: id ?? this.id,
      left: left ?? this.left,
      right: right ?? this.right,
    );
  }

  // static WordPair fromJson(JsonMap json) => _$WordPairFromJson(json);

  // JsonMap toJson() => _$WordPairToJson(this);

  @override
  List<Object> get props => [id, left, right];
}
