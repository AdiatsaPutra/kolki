// To parse this JSON data, do
//
//     final prayerTime = prayerTimeFromMap(jsonString);

part of 'models.dart';

/*class PrayerTime {
  PrayerTime({
    @required this.code,
    @required this.status,
    @required this.results,
  });

  final int code;
  final String status;
  final Results results;

  factory PrayerTime.fromJson(String str) =>
      PrayerTime.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PrayerTime.fromMap(Map<String, dynamic> json) => PrayerTime(
        code: json["code"],
        status: json["status"],
        results: Results.fromMap(json["results"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "results": results.toMap(),
      };
}

class Results {
  Results({
    @required this.datetime,
    @required this.location,
    @required this.settings,
  });

  final List<Datetime> datetime;
  final Location location;
  final Settings settings;

  factory Results.fromJson(String str) => Results.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Results.fromMap(Map<String, dynamic> json) => Results(
        datetime: List<Datetime>.from(
            json["datetime"].map((x) => Datetime.fromMap(x))),
        location: Location.fromMap(json["location"]),
        settings: Settings.fromMap(json["settings"]),
      );

  Map<String, dynamic> toMap() => {
        "datetime": List<dynamic>.from(datetime.map((x) => x.toMap())),
        "location": location.toMap(),
        "settings": settings.toMap(),
      };
}

class Datetime {
  Datetime({
    @required this.times,
    @required this.date,
  });

  final Times times;
  final Date date;

  factory Datetime.fromJson(String str) => Datetime.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datetime.fromMap(Map<String, dynamic> json) => Datetime(
        times: Times.fromMap(json["times"]),
        date: Date.fromMap(json["date"]),
      );

  Map<String, dynamic> toMap() => {
        "times": times.toMap(),
        "date": date.toMap(),
      };
}

class Date {
  Date({
    @required this.timestamp,
    @required this.gregorian,
    @required this.hijri,
  });

  final int timestamp;
  final DateTime gregorian;
  final DateTime hijri;

  factory Date.fromJson(String str) => Date.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Date.fromMap(Map<String, dynamic> json) => Date(
        timestamp: json["timestamp"],
        gregorian: DateTime.parse(json["gregorian"]),
        hijri: DateTime.parse(json["hijri"]),
      );

  Map<String, dynamic> toMap() => {
        "timestamp": timestamp,
        "gregorian":
            "${gregorian.year.toString().padLeft(4, '0')}-${gregorian.month.toString().padLeft(2, '0')}-${gregorian.day.toString().padLeft(2, '0')}",
        "hijri":
            "${hijri.year.toString().padLeft(4, '0')}-${hijri.month.toString().padLeft(2, '0')}-${hijri.day.toString().padLeft(2, '0')}",
      };
}

class Times {
  Times({
    @required this.imsak,
    @required this.sunrise,
    @required this.fajr,
    @required this.dhuhr,
    @required this.asr,
    @required this.sunset,
    @required this.maghrib,
    @required this.isha,
    @required this.midnight,
  });

  final String imsak;
  final String sunrise;
  final String fajr;
  final String dhuhr;
  final String asr;
  final String sunset;
  final String maghrib;
  final String isha;
  final String midnight;

  factory Times.fromJson(String str) => Times.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  factory Times.fromMap(Map<String, dynamic> json) => Times(
        imsak: json["Imsak"],
        sunrise: json["Sunrise"],
        fajr: json["Fajr"],
        dhuhr: json["Dhuhr"],
        asr: json["Asr"],
        sunset: json["Sunset"],
        maghrib: json["Maghrib"],
        isha: json["Isha"],
        midnight: json["Midnight"],
      );

  Map<String, dynamic> toMap() => {
        "Imsak": imsak,
        "Sunrise": sunrise,
        "Fajr": fajr,
        "Dhuhr": dhuhr,
        "Asr": asr,
        "Sunset": sunset,
        "Maghrib": maghrib,
        "Isha": isha,
        "Midnight": midnight,
      };
}

class Location {
  Location({
    @required this.latitude,
    @required this.longitude,
    @required this.elevation,
    @required this.city,
    @required this.country,
    @required this.countryCode,
    @required this.timezone,
    @required this.localOffset,
  });

  final double latitude;
  final double longitude;
  final double elevation;
  final String city;
  final String country;
  final String countryCode;
  final String timezone;
  final double localOffset;

  factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        elevation: json["elevation"],
        city: json["city"],
        country: json["country"],
        countryCode: json["country_code"],
        timezone: json["timezone"],
        localOffset: json["local_offset"],
      );

  Map<String, dynamic> toMap() => {
        "latitude": latitude,
        "longitude": longitude,
        "elevation": elevation,
        "city": city,
        "country": country,
        "country_code": countryCode,
        "timezone": timezone,
        "local_offset": localOffset,
      };
}

class Settings {
  Settings({
    @required this.timeformat,
    @required this.school,
    @required this.juristic,
    @required this.highlat,
    @required this.fajrAngle,
    @required this.ishaAngle,
  });

  final String timeformat;
  final String school;
  final String juristic;
  final String highlat;
  final double fajrAngle;
  final double ishaAngle;

  factory Settings.fromJson(String str) => Settings.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Settings.fromMap(Map<String, dynamic> json) => Settings(
        timeformat: json["timeformat"],
        school: json["school"],
        juristic: json["juristic"],
        highlat: json["highlat"],
        fajrAngle: json["fajr_angle"],
        ishaAngle: json["isha_angle"],
      );

  Map<String, dynamic> toMap() => {
        "timeformat": timeformat,
        "school": school,
        "juristic": juristic,
        "highlat": highlat,
        "fajr_angle": fajrAngle,
        "isha_angle": ishaAngle,
      };
}
*/
