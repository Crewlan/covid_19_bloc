import 'dart:convert';

import 'package:http/http.dart' as htpp;

import '../../../../core/device/network_info.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/utils/endpoints.dart';
import '../models/covid_world_model.dart';

abstract class ICovidRemoteDataSource {
  Future<CovidWorldModel> getCovidWorld();
}

class CovidRemoteDataSource extends ICovidRemoteDataSource {
  final client = htpp.Client();
  final url = Uri.parse((Endpoints.url + Endpoints.world));
  final INetworkInfo networkInfo;

  CovidRemoteDataSource(this.networkInfo);

  @override
  Future<CovidWorldModel> getCovidWorld() async {
    final respose = await client.get(url);
    if (await networkInfo.isConnected) {
      switch (respose.statusCode) {
        case 200:
          var json = jsonDecode(utf8.decode(respose.bodyBytes));
          return CovidWorldModel.fromJson(json);
        default:
          throw ServerException();
      }
    } else {
      throw NetworkException();
    }
  }
}
