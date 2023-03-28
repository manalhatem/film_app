import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/model/character_model.dart';
import '../../data/repository/character_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepository characterRepository;
 late CharacterModel results;
  CharactersCubit(this.characterRepository) : super(CharactersInitial());

 CharacterModel getAllCharacter(){
    characterRepository.getAllCharacter().then((characters) {
      emit(CharactersLoaded());
      results=characters;
    });
    return results;

  }
}
