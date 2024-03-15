import 'dart:convert';

class ConfigResponseModel {
  String? name;
  Map? config;
  ConfigResponseModel({
    this.name,
    this.config,
  });

  ConfigResponseModel copyWith({
    String? name,
    Map? config,
  }) {
    return ConfigResponseModel(
      name: name ?? this.name,
      config: config ?? this.config,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'config': config,
    };
  }

  factory ConfigResponseModel.fromMap(Map<String, dynamic> map) {
    return ConfigResponseModel(
      name: map['name'] != null ? map['name'] as String : null,
      config: map['config'] != null ? map['config'] as Map<String, dynamic> : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfigResponseModel.fromJson(String source) =>
      ConfigResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ConfigResponseModel(name: $name, config: $config)';
}
