class Result {
  String? sceneId;
  String? viewId;
  String? date;
  dynamic cloud;
  List<dynamic>? notes;
  double? q1;
  double? q3;
  double? max;
  double? min;
  double? p10;
  double? p90;
  double? std;
  double? median;
  double? average;
  double? variance;
  double? ctime10;

  Result({
    this.sceneId,
    this.viewId,
    this.date,
    this.cloud,
    this.notes,
    this.q1,
    this.q3,
    this.max,
    this.min,
    this.p10,
    this.p90,
    this.std,
    this.median,
    this.average,
    this.variance,
    this.ctime10,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        sceneId: json['scene_id'] as String?,
        viewId: json['view_id'] as String?,
        date: json['date'] as String?,
        cloud: json['cloud'] as dynamic,
        notes: json['notes'] as List<dynamic>?,
        q1: (json['q1'] as num?)?.toDouble(),
        q3: (json['q3'] as num?)?.toDouble(),
        max: (json['max'] as num?)?.toDouble(),
        min: (json['min'] as num?)?.toDouble(),
        p10: (json['p10'] as num?)?.toDouble(),
        p90: (json['p90'] as num?)?.toDouble(),
        std: (json['std'] as num?)?.toDouble(),
        median: (json['median'] as num?)?.toDouble(),
        average: (json['average'] as num?)?.toDouble(),
        variance: (json['variance'] as num?)?.toDouble(),
        ctime10: (json['ctime_10'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'scene_id': sceneId,
        'view_id': viewId,
        'date': date,
        'cloud': cloud,
        'notes': notes,
        'q1': q1,
        'q3': q3,
        'max': max,
        'min': min,
        'p10': p10,
        'p90': p90,
        'std': std,
        'median': median,
        'average': average,
        'variance': variance,
        'ctime_10': ctime10,
      };
}
