import 'package:flutter/material.dart';

import '../../constants/color.dart';
import '../../data/model/character_model.dart';
class CharacterItem extends StatelessWidget {
  final CharacterModel results;
  final int index;
  const CharacterItem({Key? key, required this.results, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8)
      ),
      child: GridTile(
        footer: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        color: Colors.black54,
        alignment: Alignment.bottomCenter,
        child: Text("${results.results![index].name}", style: const TextStyle(
          height: 1.3,
          fontSize: 16,
          color: AppColors.white,
          fontWeight: FontWeight.bold
        ),overflow: TextOverflow.ellipsis,maxLines: 2,textAlign: TextAlign.center,),

      ),
        child: Container(
        color: AppColors.gray,
        child: results.results![index].image!.isNotEmpty ?
            FadeInImage.assetNetwork(
                width: double.infinity,height: double.infinity,fit: BoxFit.cover,
                placeholder: 'assets/images/97943-loading.gif', image:results.results![index].image! ):
            Image.asset('assets/images/images.jpg'),
      ),
      ),
    );
  }
}
