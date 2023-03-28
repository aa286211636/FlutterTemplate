// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

loginmodel _$loginmodelFromJson(Map<String, dynamic> json) => loginmodel(
      json['code'] as int,
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$loginmodelToJson(loginmodel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['access_token'] as String,
      json['login_time'] as int,
      json['expires_in'] as int,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'access_token': instance.accessToken,
      'login_time': instance.loginTime,
      'expires_in': instance.expiresIn,
    };
