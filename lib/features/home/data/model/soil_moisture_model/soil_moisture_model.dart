import 'result.dart';

class SoilMoistureModel {
  List<dynamic>? errors;
  List<Result>? result;

  SoilMoistureModel({this.errors, this.result});

  factory SoilMoistureModel.fromJson(Map<String, dynamic> json) {
    return SoilMoistureModel(
      errors: json['errors'] as List<dynamic>?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'errors': errors,
        'result': result?.map((e) => e.toJson()).toList(),
      };
}
