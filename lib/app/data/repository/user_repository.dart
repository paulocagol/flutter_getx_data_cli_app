import 'package:flutter_data/flutter_data.dart';
import 'package:flutter_getx_data_cli_app/app/data/model/user.dart';
import 'package:flutter_getx_data_cli_app/app/data/provider/user_provider.dart';
import 'package:get/get.dart';

class UserRepository {
  final UserProvider provider;

  UserRepository({this.provider}) : assert(provider != null);

  Future<Rx<Repository<User>>> getRepoUser() async {
    final repo = await provider.getRepository();

    return repo.obs;
  }
}
