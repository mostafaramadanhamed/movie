import 'package:flutter/material.dart';
import 'package:movie/data/models/characters.dart';

import '../../constants/strings.dart';
class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding:const EdgeInsetsDirectional.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white.withOpacity(.7),
      ),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, characterDetailsScreen, arguments: character);
        },
        child: GridTile(
            footer: Hero(
              tag: character.charId,
              child: Container(
              width: double.infinity,
              padding:const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0,),
              color: Colors.black.withOpacity(0.3),
              alignment: Alignment.bottomCenter,
              child: Text(character.name, style: const TextStyle(
                height: 1.3,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
          ),
            ),
            child: character.img.isNotEmpty?
              FadeInImage(
              width: double.infinity,
              height: double.infinity,
              placeholder:  const AssetImage('assets/images/loading.gif'), image: NetworkImage(character.img),fit: BoxFit.cover,):Image.asset('assets/images/null.jpg'),
        ),
      ),
    );
  }
}
