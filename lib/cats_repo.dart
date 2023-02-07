import 'package:bloc_08_00/model.dart';
import 'package:dio/dio.dart';

class CatsRepo {
  final Dio dio;

  CatsRepo({required this.dio});

  Future<String> getCatsUrl() async {
    final resposne = await dio.get('meow');
    final image = Cats.fromJson(resposne.data).file;
    return image ?? '';
  }
}
