// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth0_data_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Auth0DataState _$$_Auth0DataStateFromJson(Map<String, dynamic> json) =>
    _$_Auth0DataState(
      nickname: json['nickname'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      picture: json['picture'] as String?,
      updatedAt: json['updated_at'] as String?,
      emailVefified: json['email_verified'] as bool?,
      iss: json['iss'] as String?,
      sub: json['sub'] as String? ?? '',
      aud: json['aud'] as String?,
      iat: json['iat'] as int?,
      exp: json['exp'] as int?,
      authTime: json['auth_time'] as int?,
      nonce: json['nonce'] as String?,
    );

Map<String, dynamic> _$$_Auth0DataStateToJson(_$_Auth0DataState instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'name': instance.name,
      'email': instance.email,
      'picture': instance.picture,
      'updated_at': instance.updatedAt,
      'email_verified': instance.emailVefified,
      'iss': instance.iss,
      'sub': instance.sub,
      'aud': instance.aud,
      'iat': instance.iat,
      'exp': instance.exp,
      'auth_time': instance.authTime,
      'nonce': instance.nonce,
    };
