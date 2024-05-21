// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_pair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordPair _$WordPairFromJson(Map<String, dynamic> json) => WordPair(
      id: json['id'] as String?,
      left: json['left'] as String? ?? '',
      right: json['right'] as String? ?? '',
      isLearned: json['isLearned'] as bool? ?? false,
    );

Map<String, dynamic> _$WordPairToJson(WordPair instance) => <String, dynamic>{
      'id': instance.id,
      'left': instance.left,
      'right': instance.right,
      'isLearned': instance.isLearned,
    };
