import 'package:dio/dio.dart';

import '../../constants/app_config.dart';
import '../model/character_model.dart';

class CharacterWebService{
  late Dio dio;
  CharacterWebService(){
    BaseOptions options=BaseOptions(
      baseUrl: AllAppConfig.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout:const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );
    dio=Dio(options);
  }

  Future<dynamic> getAllCharacter()async{
    try{
      Response response =await dio.get(AllAppConfig.character);
      print(response.data.toString());
      return response.data;
    }
    catch(e,s){
      print(e.toString());
      return null;
    }

  }



}