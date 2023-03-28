import '../model/character_model.dart';
import '../web_services/character_web_service.dart';

class CharacterRepository{
 final CharacterWebService characterWebService;

  CharacterRepository(this.characterWebService);

 Future<CharacterModel> getAllCharacter()async{
   final characters=await characterWebService.getAllCharacter();
   return CharacterModel.fromJson(characters);
   // return characters.map((character)=>Results.fromJson(character)).toList();
 }

}