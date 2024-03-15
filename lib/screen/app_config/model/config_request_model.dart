import 'dart:convert';

import 'package:equatable/equatable.dart';

class AppConfigRequest extends Equatable {
  final String? name;
  final String? config;
  const AppConfigRequest({
    this.name,
    this.config,
  });

  AppConfigRequest copyWith({
    String? name,
    String? config,
  }) {
    return AppConfigRequest(
      name: name ?? this.name,
      config: config ?? this.config,
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> configMap = <String, dynamic>{'name': name};
    configMap.addAll({'config': Map.from(jsonDecode(config ?? ''))});
    return configMap;
  }

  factory AppConfigRequest.fromMap(Map<String, dynamic> map) {
    return AppConfigRequest(
      name: map['name'] != null ? map['name'] as String : null,
      config: map['config'] != null ? map['config'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppConfigRequest.fromJson(String source) =>
      AppConfigRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, config];
}
