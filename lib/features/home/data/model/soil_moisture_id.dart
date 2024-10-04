class SoilMoistureId {
  String? status;
  String? taskId;
  String? reqId;
  int? taskTimeout;

  SoilMoistureId({this.status, this.taskId, this.reqId, this.taskTimeout});

  factory SoilMoistureId.fromJson(Map<String, dynamic> json) {
    return SoilMoistureId(
      status: json['status'] as String?,
      taskId: json['task_id'] as String?,
      reqId: json['req_id'] as String?,
      taskTimeout: json['task_timeout'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'task_id': taskId,
        'req_id': reqId,
        'task_timeout': taskTimeout,
      };
}
