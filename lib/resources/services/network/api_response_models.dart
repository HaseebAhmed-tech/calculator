class GenericResponse {
  final String status;

  final String? errorMessage;
  final int? errorCode;

  final int? totalRecords;
  final num? time;

  GenericResponse(Map<String, dynamic> resp)
      : status = resp['Status'],
        errorMessage = resp['ErrorMessage'],
        errorCode = resp['ErrorCode'],
        totalRecords = resp['total_records'],
        time = resp['Time'];

  static GenericResponse fromMap(Map<String, dynamic> resp) {
    return GenericResponse(resp);
  }

  bool get isSuccess {
    return status == 'Ok';
  }
}

class DummyResponse {
  DummyResponse(Map<String, dynamic> resp);

  static DummyResponse fromMap(Map<String, dynamic> resp) {
    return DummyResponse(resp);
  }
}

typedef ModelFromJson = dynamic Function(Map<String, dynamic> resp);
typedef ApiPayload = Map<String, dynamic>;


class ApiSingleResponse<T> extends GenericResponse {
  final T? data;

  ApiSingleResponse(this.data, Map<String, dynamic> resp) : super(resp);

  factory ApiSingleResponse.fromMap(
    Map<String, dynamic> resp,
    ModelFromJson fromJson,
  ) {
    var data = resp['data'];
    if (data == null) {
      return ApiSingleResponse(null, resp);
    }

    if (data.runtimeType == int || data.runtimeType == String) {
      data = {'data': data};
    }

    final dt = data.cast<String, dynamic>();
    return ApiSingleResponse(fromJson(dt), resp);
  }
}

class ApiListResponse<T> extends GenericResponse {
  final List<T>? data;

  ApiListResponse(this.data, Map<String, dynamic> resp) : super(resp);

  factory ApiListResponse.fromMap(
    Map<String, dynamic> resp,
    ModelFromJson fromJson,
  ) {
    final data = resp['data'];
    if (data == null) {
      return ApiListResponse(null, resp);
    }

    final dt = data.cast<Map<String, dynamic>>();

    return ApiListResponse(
      List<T>.from(dt.map((item) => fromJson(item))),
      resp,
    );
  }
}
