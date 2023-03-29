import 'package:film_app/constants/color.dart';
import 'package:film_app/data/model/character_model.dart';
import 'package:flutter/material.dart';
class CharacterDetailsScreen extends StatelessWidget {
   Results characterModel;
   CharacterDetailsScreen({Key? key, required this.characterModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(delegate: SliverChildListDelegate(
            [
              Container(
                margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    characterInfo(title:'OriginName :  ' ,value: characterModel.origin!.name! ),
                    buildDivider(210),
                    characterInfo(title:'Location :  ' ,value: characterModel.location!.name! ),
                    buildDivider(235),
                    characterInfo(title:'Species :  ' ,value: characterModel.species! ),
                    buildDivider(242),
                    characterInfo(title:'Gender :  ' ,value: characterModel.gender! ),
                    buildDivider(248),
                    characterInfo(title:'Status :  ' ,value: characterModel.status! ),
                    buildDivider(254),
                    characterInfo(title:'Created :  ' ,value: characterModel.created! ),
                    buildDivider(246),
                    const SizedBox(height: 20,),
                  ],
                ),

              ),
              const SizedBox(height: 280,),// ضفت السايزبوكس علشان ال sliverList مش هتطلع فوق غير لما يكون في عناصر كتير
            ]
          ))
        ],

      ),
    );
  }

 Widget buildSliverAppBar(){
    return SliverAppBar(
      expandedHeight: 600,// tall of img
      pinned: true,
      stretch: true,
      backgroundColor: AppColors.gray,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(characterModel.name!,style:const TextStyle(color: AppColors.white),),
        background: Hero(
          tag: characterModel.id!,
          child: Image.network(characterModel.image!, fit: BoxFit.cover,),
        ),
      ),

    );

  }
  Widget characterInfo({required String title, required String value}){
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
            TextSpan(text: title,
                style: const TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18
            )),
            TextSpan(text: value,
                style: const TextStyle(
                color: AppColors.white,
                fontSize: 16
            )),
          ]
        ));

  }
  Widget buildDivider(double end){
    return Divider(
      height:30,
      endIndent: end,
      color: AppColors.yellow,
      thickness: 2.2,
    );
  }

}
