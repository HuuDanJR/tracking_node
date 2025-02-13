import 'package:bingo_game/function/datetimes.string.dart';
import 'package:bingo_game/page/game/left/export.dart';
import 'package:bingo_game/page/game/right/export.dart';
import 'package:bingo_game/page/play/bloc/game_bloc.dart';
import 'package:bingo_game/public/strings.dart';
import 'package:bingo_game/widget/myprogress_circular.dart';
import 'package:bingo_game/widget/text.custom.dart';

class GamePlayedPage extends StatelessWidget {
  const GamePlayedPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height / 9,
      // color: MyColor.grey_tab,
      child: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
          if (state.status == GameStatus.initial) {
            return Center(child: myprogress_circular_size());
          } else if (state.status == GameStatus.success) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(StringFactory.padding0),
              itemCount: state.games.length,
              itemBuilder: (context, index) {
                final game = state.games[index];
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: textCustom(color: MyColor.black_absulute,text: "GAME PLAYED PROGRESS"),
                                  backgroundColor: MyColor.grey_BG_main,
                                  content: SizedBox(
                                      width: width /2.5 ,
                                      height: height / 1.5,
                                      child: ListView.builder(
                                        itemCount: state.games[index].round.length,
                                        itemBuilder: (context, i) {
                                          return Container(
                                            margin: const EdgeInsets.only(bottom:StringFactory.padding4),
                                            padding: const EdgeInsets.all(StringFactory.padding4),
                                            decoration: BoxDecoration(
                                              color:MyColor.white,
                                              border: Border.all(
                                                width: .5,
                                                color:MyColor.grey_tab,
                                              ),
                                              borderRadius: BorderRadius.circular(StringFactory.padding8)
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                textCustom(color: MyColor.black_text,text: "#${i+1}",size:StringFactory.padding16),
                                                SizedBox(
                                                  width:width /2.5 /8,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        color: determineColorTag(state.games[index].round[i]),
                                                        width: StringFactory.padding18,
                                                        height: StringFactory.padding18,
                                                      ),
                                                      
                                                      textCustom(color: MyColor.black_text,text: "${state.games[index].round[i]}",size:StringFactory.padding16),
                                                    ],
                                                  ),
                                                ),
                                                
                                              ],
                                            ),
                                          );
                                        },
                                      )),
                                ));
                      },
                      child: Container(
                          alignment: Alignment.center,
                          padding:const EdgeInsets.all(StringFactory.padding16),
                          decoration: BoxDecoration(
                              // color:MyColor.white,
                              border: Border.all(color: MyColor.grey_tab),
                              borderRadius: BorderRadius.circular(
                                  StringFactory.padding8)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              textCustom(
                                  text: game.gameName,
                                  size: StringFactory.padding18,
                                  color: MyColor.black_absulute),
                              textCustomGrey(
                                  text: format.formatDateAndTimeTimeFirst(game.createdAt),
                                  size: StringFactory.padding14,
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(
                      width: StringFactory.padding8,
                    )
                  ],
                );
              },
            );
          } else if (state.status == GameStatus.failure) {
            return Center(child: textCustomGrey(text:state.errorMessage ?? 'Unknown error'));
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}



Color determineColorTag(int number) {
  if (number >= 1 && number <= 15) {
    // return ConfigFactory.tag_yellow;
    return MyColor.yellow;
  } else if (number >= 16 && number <= 30) {
    // return ConfigFactory.tag_blue;
    return MyColor.blue_fb;
  } else if (number >= 31 && number <= 45) {
    // return ConfigFactory.tag_red;
    return MyColor.red;
  } else if (number >= 46 && number <= 60) {
    // return ConfigFactory.tag_purple;
    return MyColor.purple;
  } else {
    return MyColor.green;
  }
}