import 'package:flutter_data/flutter_data.dart';
import 'package:path_provider/path_provider.dart';

import '../../main.data.dart';

class ContainerData {
  static final ContainerData _containerData = ContainerData._internal();

  final data = ProviderContainer(
    overrides: [
      configureRepositoryLocalStorage(
        clear: false,
        baseDirFn: () => _localPath,
      ),
    ],
  );

  factory ContainerData() {
    return _containerData;
  }

  ContainerData._internal();
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}
