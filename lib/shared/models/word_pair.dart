import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'word_pair.g.dart';

@JsonSerializable()
class WordPair extends Equatable {
  WordPair({
    String? id,
    this.left = '',
    this.right = '',
    this.isLearned = false,
  })  : assert(
          id == null || id.isNotEmpty,
          'id must either be null or not empty',
        ),
        id = id ?? const Uuid().v4();

  final String id;
  final String left;
  final String right;
  final bool isLearned;

  WordPair copyWith({
    String? id,
    String? left,
    String? right,
    bool? isLearned,
  }) {
    return WordPair(
      id: id ?? this.id,
      left: left ?? this.left,
      right: right ?? this.right,
      isLearned: isLearned ?? this.isLearned,
    );
  }

  static WordPair fromJson(Map<String, dynamic> json) => _$WordPairFromJson(json);

  Map<String, dynamic> toJson() => _$WordPairToJson(this);

  @override
  List<Object> get props => [id, left, right, isLearned];
}
