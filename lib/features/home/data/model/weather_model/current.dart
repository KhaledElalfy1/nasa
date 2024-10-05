class Current {
  double? tempC;
  double? windKph;
  String? windDir;
  double? pressureIn;
  double? humidity;

  Current({
    this.tempC,
    this.windKph,
    this.windDir,
    this.pressureIn,
    this.humidity,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        tempC: (json['temp_c'] as num?)?.toDouble(),       // Safely handling both int and double
        windKph: (json['wind_kph'] as num?)?.toDouble(),   // Safely handling both int and double
        windDir: json['wind_dir'] as String?,
        pressureIn: (json['pressure_in'] as num?)?.toDouble(),  // Safely handling both int and double
        humidity: (json['humidity'] as num?)?.toDouble(),  // Safely handling both int and double
      );

  Map<String, dynamic> toJson() => {
        'temp_c': tempC,
        'wind_kph': windKph,
        'wind_dir': windDir,
        'pressure_in': pressureIn,
        'humidity': humidity,
      };
}
