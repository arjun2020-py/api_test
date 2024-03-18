// To parse this JSON data, do
//
//     final universitytListModel = universitytListModelFromJson(jsonString);

import 'dart:convert';

List<UniversitytListModel> universitytListModelFromJson(String str) => List<UniversitytListModel>.from(json.decode(str).map((x) => UniversitytListModel.fromJson(x)));

String universitytListModelToJson(List<UniversitytListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UniversitytListModel {
    AlphaTwoCode alphaTwoCode;
    List<String> webPages;
    String? stateProvince;
    String name;
    List<String> domains;
    Country country;

    UniversitytListModel({
        required this.alphaTwoCode,
        required this.webPages,
        required this.stateProvince,
        required this.name,
        required this.domains,
        required this.country,
    });

    factory UniversitytListModel.fromJson(Map<String, dynamic> json) => UniversitytListModel(
        alphaTwoCode: alphaTwoCodeValues.map[json["alpha_two_code"]]!,
        webPages: List<String>.from(json["web_pages"].map((x) => x)),
        stateProvince: json["state-province"],
        name: json["name"],
        domains: List<String>.from(json["domains"].map((x) => x)),
        country: countryValues.map[json["country"]]!,
    );

    Map<String, dynamic> toJson() => {
        "alpha_two_code": alphaTwoCodeValues.reverse[alphaTwoCode],
        "web_pages": List<dynamic>.from(webPages.map((x) => x)),
        "state-province": stateProvince,
        "name": name,
        "domains": List<dynamic>.from(domains.map((x) => x)),
        "country": countryValues.reverse[country],
    };
}

enum AlphaTwoCode {
    US
}

final alphaTwoCodeValues = EnumValues({
    "US": AlphaTwoCode.US
});

enum Country {
    UNITED_STATES
}

final countryValues = EnumValues({
    "United States": Country.UNITED_STATES
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
