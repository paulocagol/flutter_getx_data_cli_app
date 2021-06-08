import 'package:flutter_data/flutter_data.dart';
import 'package:flutter_getx_data_cli_app/app/data/model/user.dart';
import 'package:flutter_getx_data_cli_app/main.data.dart';
import 'package:meta/meta.dart';
import 'package:flutter_getx_data_cli_app/app/container/container_data.dart';

class UserProvider {
  final ContainerData container;

  UserProvider({@required this.container});

  Future<Repository<User>> getRepository() async {
    await container.data.read(repositoryInitializerProvider().future);
    return await container.data.read(usersRepositoryProvider);
  }
}
