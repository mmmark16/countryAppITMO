class CountryInfo {
  final Name name;
  final bool independent;
  final String status;
  final Map<String, Currency> currencies;
  final List<String> capital;
  final String region;
  final Map<String, String> languages;
  final double area;
  final Maps maps;
  final int population;

  CountryInfo({
    required this.name,
    required this.independent,
    required this.status,
    required this.currencies,
    required this.capital,
    required this.region,
    required this.languages,
    required this.area,
    required this.maps,
    required this.population,
  });

  factory CountryInfo.fromJson(Map<String, dynamic> json) {
    return CountryInfo(
      name: Name.fromJson(json['name'] as Map<String, dynamic>),
      independent: json['independent'] as bool,
      status: json['status'] as String,
      currencies: (json['currencies'] as Map<String, dynamic>).map(
        (key, value) =>
            MapEntry(key, Currency.fromJson(value as Map<String, dynamic>)),
      ),
      capital: (json['capital'] as List<dynamic>).cast<String>(),
      region: json['region'] as String,
      languages:
          (json['languages'] as Map<String, dynamic>).cast<String, String>(),
      // Simplified
      area: (json['area'] as double),
      maps: Maps.fromJson(json['maps'] as Map<String, dynamic>),
      population: json['population'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name.toJson(),
      'independent': independent,
      'status': status,
      'currencies':
          currencies.map((key, value) => MapEntry(key, value.toJson())),
      'capital': capital,
      'region': region,
      'languages': languages,
      'area': area,
      'maps': maps.toJson(),
      'population': population,
    };
  }
}

class Name {
  final String common;
  final String official;
  final NativeName nativeName;

  Name({
    required this.common,
    required this.official,
    required this.nativeName,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      common: json['common'] as String,
      official: json['official'] as String,
      nativeName:
          NativeName.fromJson(json['nativeName'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'common': common,
      'official': official,
      'nativeName': nativeName.toJson(),
    };
  }
}

class NativeName {
  final Eng eng;

  NativeName({
    required this.eng,
  });

  factory NativeName.fromJson(Map<String, dynamic> json) {
    return NativeName(
      eng: Eng.fromJson(json['eng'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'eng': eng.toJson(),
    };
  }
}

class Eng {
  final String official;
  final String common;

  Eng({
    required this.official,
    required this.common,
  });

  factory Eng.fromJson(Map<String, dynamic> json) {
    return Eng(
      official: json['official'] as String,
      common: json['common'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'official': official,
      'common': common,
    };
  }
}

class Currency {
  final String name;
  final String symbol;

  Currency({
    required this.name,
    required this.symbol,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      name: json['name'] as String,
      symbol: json['symbol'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'symbol': symbol,
    };
  }
}

class Maps {
  final String googleMaps;
  final String openStreetMaps;

  Maps({
    required this.googleMaps,
    required this.openStreetMaps,
  });

  factory Maps.fromJson(Map<String, dynamic> json) {
    return Maps(
      googleMaps: json['googleMaps'] as String,
      openStreetMaps: json['openStreetMaps'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'googleMaps': googleMaps,
      'openStreetMaps': openStreetMaps,
    };
  }
}

