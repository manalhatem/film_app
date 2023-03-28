import 'package:film_app/bussiness_logic/cubit/characters_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/color.dart';
import '../../data/model/character_model.dart';
import '../widgets/character_item.dart';
class CharacterScreen extends StatefulWidget {

   CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late CharacterModel allCharacters;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allCharacters=BlocProvider.of<CharactersCubit>(context).getAllCharacter();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.yellow,
        title: const Text('Characters', style: TextStyle(color: AppColors.gray),),
        centerTitle: true,
        elevation: 0
      ),
      body: buildBlocWidget(),
    );
  }

  Widget buildBlocWidget(){
    return BlocBuilder<CharactersCubit, CharactersState>(builder: (context, state){
      return state is CharactersLoaded? buildLoadedListWidget():
      const Center(child: CircularProgressIndicator(color: AppColors.yellow));

    });
  }
  Widget buildLoadedListWidget(){
    return SingleChildScrollView(
      child: Container(
        color: AppColors.gray,
        child: Column(
          children: [
            buildCharacterList()
          ],
        ),
      ),
    );
  }
 Widget buildCharacterList(){
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      childAspectRatio: 2/3,
      crossAxisSpacing: 1,
      mainAxisSpacing: 1
    ),
        itemCount: allCharacters.results!.length,
        itemBuilder: (context, index){
      return CharacterItem(results: allCharacters,index: index);
        });
 }
}

