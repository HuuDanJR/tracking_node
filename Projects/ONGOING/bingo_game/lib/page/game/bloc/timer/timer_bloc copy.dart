// import 'dart:async';
// import 'package:bingo_game/APIs/service_api.dart';
// import 'package:bingo_game/function/datetimes.string.dart';
// import 'package:bingo_game/hive/hive_controller.dart';
// import 'package:bingo_game/page/game/left/export.dart';
// import 'package:bingo_game/page/game/right/export.dart';
// import 'package:bingo_game/page/game/utils.dart';
// import 'package:bingo_game/widget/snackbar.custom.dart';
// import 'package:bingo_game/widget/text.custom.dart';
// import 'package:equatable/equatable.dart';

// part 'timer_state.dart';
// part 'timer_event.dart';

// class TimerBloc extends Bloc<TimerEvent, TimerState> {
//   static const int _initialDuration =ConfigFactory.timer_duration_time; // Initial duration in seconds
//   static const int _maxTickCount = ConfigFactory.timer_max_round; // Maximum number of times the timer can restart

  

//   Timer? _timer;
//   final serviceApi = ServiceAPIs();

//   TimerBloc({int skip = 0}) : super(TimerState.initial(skip: skip)) {


//     on<StartTimer>((event, emit) {
//       emit(state.copyWith(
//           tickCount: state.tickCount,
//           number: state.number,
//           isFirstRun: state.tickCount == 0 ? true : false));
//       _startTimer(event.context);
//     });
//     on<RestartTimer>((event, emit) {
//       emit(
//         state.copyWith(
//             duration: _initialDuration,
//             tickCount: state.tickCount + 1,
//             number: state.number,
//             isFirstRun: false),
//       );
//       _startTimer(event.context); // Start the timer again
//     });
//     on<TickFinished>((event, emit) {});

//     on<SkipTicks>((event, emit) {
//       //add ball here
//       emit(state.copyWith(tickCount: event.skip,duration: _initialDuration,number: state.number,isFirstRun: true));
//     });

//     on<Tick>((event, emit) {
//       if (event.duration > 0) {
//         emit(state.copyWith(
//           duration: event.duration,
//           status: TimerStatus.ticking,
//         ));
//       } else {
//         _timer?.cancel();
//         late final newNumber = generateUniqueNumber([],initial: false); // Pass an empty set as existingNumbers
//         // mysnackbarWithContext(
//         //     context: event.context,
//         //     message: "Timer completed, Generated a number $newNumber, times: ${state.tickCount + 1}",
//         //     hasIcon: false);
//         debugPrint('times: ${state.tickCount  +1 } ');
//         emit(state.copyWith(duration: 0, status: TimerStatus.finish, number: newNumber));
//         add(const TickFinished()); // Emit TickFinished event
//         if (state.tickCount == _maxTickCount) {
//           debugPrint('stop timer,end game');
//           mysnackbarWithContext(
//               context: event.context,
//               message: "Game completed ! total times: ${state.tickCount + 1}",
//               hasIcon: true);
//           // Show dialog
//           showDialog(
//             context: event.context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: textcustom("Game Finish",
//                     const TextStyle(fontWeight: FontWeight.bold)),
//                 content: textcustom(
//                     "Bingo Game  has been finished 🎉.\nAll numbers was called.\nTotal times: ${state.tickCount + 1}",
//                     const TextStyle(fontWeight: FontWeight.w600)),
//                 actions: <Widget>[
//                   TextButton.icon(
//                     icon: const Icon(Icons.check),
//                     onPressed: () {
//                       Navigator.of(context).pop(); // Dismiss the dialog
//                     },
//                     label: const Text("CANCEL"),
//                   ),
//                   TextButton.icon(
//                     icon: const Icon(Icons.save_alt),
//                     onPressed: () {
//                       HiveController().getLatestRound().then((value) {
//                         serviceApi
//                             .createNewGame(
//                                 game_name: 'G.${format.formatDateAndTimeCode(DateTime.now())}',
//                                 enable: false,
//                                 round: value!.round)
//                             .then((v) {
//                           if (v['status'] == true) {
//                             mysnackbarWithContext(
//                                 context: context,
//                                 hasIcon: false,
//                                 message: v['message']);
//                           }
//                         }).whenComplete(() => Navigator.of(context).pop());
//                       });
//                     },
//                     label: const Text("SAVE"),
//                   ),
//                 ],
//               );
//             },
//           );
//           _timer!.cancel();
//         } else {
//           add(RestartTimer(event.context));
//         }
//       }
//     });
//   }

//   void _startTimer(BuildContext context) {
//     _timer?.cancel();
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       final newDuration = state.duration - 1;
//       add(Tick(newDuration, context));
//     });
//   }

//   @override
//   Future<void> close() {
//     _timer?.cancel();
//     return super.close();
//   }
// }
