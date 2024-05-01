// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_pair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordPair _$WordPairFromJson(Map<String, dynamic> json) => WordPair(
      left: json['left'] as String,
      right: json['right'] as String,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$WordPairToJson(WordPair instance) => <String, dynamic>{
      'id': instance.id,
      'left': instance.left,
      'right': instance.right,
    };
