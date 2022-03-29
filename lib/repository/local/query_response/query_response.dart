// import 'package:json_annotation/json_annotation.dart';
// import 'package:movies_task/repository/network/network_constants.dart';
//
// part 'api_response.g.dart';
//
// @JsonSerializable()
class QueryResponse {
  bool? success;
  // @JsonKey(name: NetworkConstants.keyRequestToken)
  String? requestToken;
  // @JsonKey(name: NetworkConstants.keyStatusMessage)
  String? statusMessage;
  // @JsonKey(name: NetworkConstants.keyStatusCode)
  int? statusCode;
  // @JsonKey(name: NetworkConstants.keySessionId)
  String? sessionId;

  QueryResponse(
      {this.success,
      this.requestToken,
      this.statusMessage,
      this.statusCode,
      this.sessionId});
  //
  // factory QueryResponse.fromJson(Map<String, dynamic> json) =>
  //     _$QueryResponseFromJson(json);
  // Map<String, dynamic> toJson() => _$QueryResponseToJson(this);
}
