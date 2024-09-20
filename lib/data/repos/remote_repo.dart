import 'package:test_riverpod/data/models/recreation_area_model.dart';

abstract class RemoteRepo {
  Future<List<RecreationAreaModel>> getAllRecreationAreas();
}
