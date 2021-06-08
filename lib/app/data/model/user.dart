import 'package:meta/meta.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';


part 'user.g.dart';

@JsonSerializable()
@DataRepository([JSONServerAdapter])
class User with DataModel<User> {
  @override
  final int id;
  final String name;
  final String email;

  User({this.id, this.name, @required this.email});
}

mixin JSONServerAdapter<T extends DataModel<T>> on RemoteAdapter<T> {
  @override
  String get baseUrl => 'https://my-json-server.typicode.com/flutterdata/demo/';

  @override
  String get identifierSuffix => 'Id';
}