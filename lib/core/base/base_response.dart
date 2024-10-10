class BaseResponse<T> {
  int? status;
  String? message;
  T? data;
  BaseResponse({
    this.status,
    this.message,
    this.data,
  });
  factory BaseResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return BaseResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }
}
