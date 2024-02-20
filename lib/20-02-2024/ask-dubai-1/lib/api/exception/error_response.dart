class ErrorResponse {
  String? description;
  String? message;
  int? status;

  int? timestamp;

  ErrorResponse({this.description, this.message, this.status, this.timestamp});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      description: json['description'],
      message: json['message'],
      status: json['status'],
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = message;
    data['status'] = status;
    data['timestamp'] = timestamp;
    if (description != null) {
      data['description'] = description;
    }

    return data;
  }
}
