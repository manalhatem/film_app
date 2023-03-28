import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bussiness_logic/cubit/characters_cubit.dart';
import '../data/repository/character_repository.dart';
import '../data/web_services/character_web_service.dart';
import '../presentation/screen/character_details_view.dart';
import '../presentation/screen/character_view.dart';
import 'routes.dart';

class AppRouter{
  late CharacterRepository characterRepository;
  late CharactersCubit charactersCubit;
  AppRouter(){
    characterRepository=CharacterRepository(CharacterWebService());
    charactersCubit=CharactersCubit(characterRepository);
  }

 static Route<dynamic> onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.character:
        return MaterialPageRoute(builder: (context){
          return BlocProvider(
              create: (context) => CharactersCubit(CharacterRepository(CharacterWebService())),
              child:CharacterScreen()
          );
        });
      case AppRoutes.characterDetails:
        return MaterialPageRoute(builder: (context) => const CharacterDetailsScreen());
      default:
        return MaterialPageRoute(builder: ((context) =>  CharacterScreen()));
    }
  }
}

