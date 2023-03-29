import 'package:film_app/bussiness_logic/cubit/characters_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
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
  late List<Results> searchList;
  bool isSearched= false;
  final searchController =TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allCharacters=BlocProvider.of<CharactersCubit>(context).getAllCharacter();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:isSearched?
      AppBar(
        backgroundColor: AppColors.yellow,
        leading: const BackButton(color: AppColors.gray),
        // leading: IconButton(onPressed: () {
        //   setState(() {
        //     isSearched=false;
        //     searchController.clear();
        //   });
        // }, icon: const Icon(Icons.arrow_back, color: AppColors.gray,),),
        title: TextField(
          cursorColor: AppColors.gray,
          controller: searchController,
          style: const TextStyle(color: AppColors.gray, fontSize: 18),
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Find a Character......",
              helperStyle: TextStyle(color: AppColors.gray, fontSize: 18)
          ),
          onChanged: (searchedChar){
            addSearchedOfOrItemToSearchedList(searchedChar);
          },
        ),
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            setState((){
              searchController.clear();
            });
          }, icon: const Icon(Icons.close, color:AppColors.gray,)),
        ],
      ):
      AppBar(
        backgroundColor: AppColors.yellow,
        title: const Text('Characters', style: TextStyle(color: AppColors.gray),),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
           // السطر دا معناه ان بيقول للصفحه افتحيلي فرام جديده هبحث فيها علشان كده بيضيف زرار الباك
            ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove:(){
              // clear Search
              setState(() {
                isSearched=false;
                searchController.clear();
              });

            } ));
            setState(() {
              isSearched=true;
            });
          }, icon: const Icon(Icons.search, color: AppColors.gray)),
        ],
      ),
      body: buildBlocWidget()
      // OfflineBuilder(
      //     connectivityBuilder: (
      //         BuildContext context,
      //         ConnectivityResult connectivity,
      //         Widget child,
      //         ) {
      //       final bool connected = connectivity != ConnectivityResult.none;
      //       return connected? buildBlocWidget():
      //           Column(
      //             children: [
      //               Image.asset("assets/images/13262-no-internet-connection.gif"),
      //               Text('Check Internet')
      //
      //             ],
      //           );
      //
      //     })

     
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
      physics: const BouncingScrollPhysics(),
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
        itemCount: searchController.text.isEmpty? allCharacters.results!.length:searchList.length,
        itemBuilder: (context, index){
      return CharacterItem(results:searchController.text.isEmpty? allCharacters.results! : searchList,index: index);
        });
 }

 void addSearchedOfOrItemToSearchedList(searchedChar){
    searchList=allCharacters.results!.where((character) => character.name!.toLowerCase().startsWith(searchedChar)).toList();
    setState(() {

    });

 }
}

