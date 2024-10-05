class WaterRecoursesModel {
  List<WaterbodyItem> waterbodies;
  Location location;

  WaterRecoursesModel({
    required this.waterbodies,
    required this.location,
  });

  factory WaterRecoursesModel.fromJson(Map<String, dynamic> json) {
    return WaterRecoursesModel(
      waterbodies: List<WaterbodyItem>.from(
        json['waterbodies'].map((item) => WaterbodyItem.fromJson(item)),
      ),
      location: Location.fromJson(json['location']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'waterbodies': waterbodies.map((item) => item.toJson()).toList(),
      'location': location.toJson(),
    };
  }
}

class WaterbodyItem {
  Waterbody waterbody;
  String distance;
  bool isExternal;

  WaterbodyItem({
    required this.waterbody,
    required this.distance,
    required this.isExternal,
  });

  factory WaterbodyItem.fromJson(Map<String, dynamic> json) {
    return WaterbodyItem(
      waterbody: Waterbody.fromJson(json['Waterbody']),
      distance: json['Distance'],
      isExternal: json['IsExternal'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Waterbody': waterbody.toJson(),
      'Distance': distance,
      'IsExternal': isExternal,
    };
  }
}

class Waterbody {
  Location location;
  String name;
  int id;
  String type;

  Waterbody({
    required this.location,
    required this.name,
    required this.id,
    required this.type,
  });

  factory Waterbody.fromJson(Map<String, dynamic> json) {
    return Waterbody(
      location: Location.fromJson(json['Location']),
      name: json['Name'],
      id: json['Id'],
      type: json['Type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Location': location.toJson(),
      'Name': name,
      'Id': id,
      'Type': type,
    };
  }
}

class Location {
  double latitude;
  double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
