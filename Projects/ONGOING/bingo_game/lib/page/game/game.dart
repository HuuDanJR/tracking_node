import 'package:bingo_game/hive/hive_controller.dart';
import 'package:bingo_game/page/admin/switch/bloc/switch_bloc.dart';
import 'package:bingo_game/page/game/bloc/timer/timer_bloc.dart';
import 'package:bingo_game/page/game/left/game.left.dart';
import 'package:bingo_game/page/game/right/export.dart';
import 'package:bingo_game/page/game/right/game.right.dart';
import 'package:bingo_game/page/pickup/bloc/pickup_bloc.dart';
import 'package:bingo_game/page/play/bloc/game_bloc.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void dispose() {
    HiveController().deleteAllRounds();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
          providers: [
            BlocProvider<TimerBloc>( create: (context) => TimerBloc()..add(StartTimer(context))),
            BlocProvider<BallBloc>(
              create: (context) => BallBloc(),
            ),
            // BlocProvider(
            //   create: (context) => PickupBloc(),
            // ),
            // BlocProvider<SwitchBloc>(
            //   create: (context) => SwitchBloc(),
            // ),
            // BlocProvider<GameBloc>(
            //   create: (context) => GameBloc()..add(FetchGames()),
            // ),
          ],
          child: Container(
          color: MyColor.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const Row(
            children: [
              GameLeftPage(),
              GameRightPage(),
            ],
          ),
        ),
        )
        // floatingActionButton: Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     FloatingActionButton(
        //       onPressed: () {
        //         // print('getLatestRound button click');
        //         HiveController().getLatestRound();
        //         HiveController().getAllRounds();
        //       },
        //       child: Text('GET'),
        //     ),
        //   ],
        // ),
      
      
    );
  }
}
