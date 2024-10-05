import 'current.dart';


class WeatherModel {

  Current? current;

  WeatherModel({ this.current});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
      
        current: json['current'] == null
            ? null
            : Current.fromJson(json['current'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        
        'current': current?.toJson(),
      };
}
