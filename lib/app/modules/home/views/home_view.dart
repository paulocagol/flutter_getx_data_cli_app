import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:flutter_getx_data_cli_app/app/data/model/user.dart';
import 'package:flutter_getx_data_cli_app/app/container/container_data.dart';
import 'package:get/get.dart';

import '../../../../main.data.dart';

Future<Repository<User>> getRepository() async {
  ContainerData container = ContainerData();
  await container.data.read(repositoryInitializerProvider().future);
  return await container.data.read(usersRepositoryProvider);
}

class ControllerHome extends GetxController {
  var repo = Repository<User>(null).obs;

  @override
  void onInit() async {
    repo.value = await getRepository();
    print('AQUIIIIIIIIIIIIIII');
    super.onInit();
  }
}

class HomeView extends GetWidget<ControllerHome> {
  final control = Get.put<ControllerHome>(ControllerHome());

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: control.repo.value.watchAll(remote: true, syncLocal: false).data.model.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(control.repo.value.watchAll(remote: true, syncLocal: false).data.model[index].id.toString()),
              subtitle: Text(control.repo.value.watchAll(remote: true, syncLocal: false).data.model[index].name),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          control.repo.update((val) {
            val.save(
              User(
                id: Random().nextInt(999) + 2,
                name: 'Paulo22',
                email: 'Teste',
              ),
              remote: true,
            );
          });

          // control.repo.value.save(
          //   User(
          //     id: 33,
          //     name: 'Paulo22',
          //     email: 'Teste',
          //   ),
          //   onError: (e) {},
          // );
          // control.repo.refresh();
        },
      ),
    );
  }
}
