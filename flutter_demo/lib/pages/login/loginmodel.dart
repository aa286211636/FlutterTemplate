import 'package:json_annotation/json_annotation.dart';

part 'loginmodel.g.dart';

@JsonSerializable()
class loginmodel extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'data')
  Data data;

  loginmodel(
    this.code,
    this.data,
  );

  factory loginmodel.fromJson(Map<String, dynamic> srcJson) =>
      _$loginmodelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$loginmodelToJson(this);
}

@JsonSerializable()
class Data extends Object {
  @JsonKey(name: 'access_token')
  String accessToken;

  @JsonKey(name: 'login_time')
  int loginTime;

  @JsonKey(name: 'expires_in')
  int expiresIn;

  Data(
    this.accessToken,
    this.loginTime,
    this.expiresIn,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
