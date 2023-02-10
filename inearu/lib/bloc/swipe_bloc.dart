import 'package:bloc/bloc.dart';
import 'package:inearu/models/models.dart';

part 'swipe_state.dart';
part 'swipe_event.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  SwipeBloc() : super(SwipeLoading()) {
    on<LoadUsers>((event, emit) {
      emit(SwipeLoaded(users: User.users));
    });

    on<SwipeLeft>((event, emit) {
      final state = this.state as SwipeLoaded;
      emit(
        SwipeLoaded(
          users: List.from(state.users)..remove(event.user),
        ),
      );
    });

    on<SwipeRight>((event, emit) {
      final state = this.state as SwipeLoaded;
      emit(
        SwipeLoaded(
          users: List.from(state.users)..remove(event.user),
        ),
      );
    });
  }
}


 //   on<LoadUsers>(_onLoadUsers);
    //   on<SwipeLeft>(_onSwipeLeft);
    //   on<SwipeRight>(_onSwipeRight);
    // }

    // void _onLoadUsers(
    //   LoadUsers event,
    //   Emitter<SwipeState> emit,
    // ) {
    //   emit(SwipeLoaded(users: event.users));
    // }

    // void _onSwipeLeft(
    //   SwipeLeft event,
    //   Emitter<SwipeState> emit,
    // ) {
    //   final state = this.state as SwipeLoaded;
    //   if (state is SwipeLoaded) {
    //     try {
    //       SwipeLoaded(users: List.from(state.users)..remove(event.user));
    //     } catch (_) {}
    //   }
    // }

    // void _onSwipeRight(
    //   SwipeRight event,
    //   Emitter<SwipeState> emit,
    // ) {
    //   final state = this.state as SwipeLoaded;
    //   if (state is SwipeLoaded) {
    //     try {
    //       SwipeLoaded(users: List.from(state.users)..remove(event.user));
    //     } catch (_) {}
    //   }
    // }




    // on<LoadUsers>((event, emit) {
    //   emit(SwipeLoaded(users: User.users));
    // });

    // on<SwipeLeft>((event, emit) {
    //   final state = this.state as SwipeLoaded;
    //   emit(SwipeLoaded(users: List.from(state.users)..remove(event.props)));
    // });
    // on<SwipeRight>((event, emit) {
    //   final state = this.state as SwipeLoaded;
    //   emit(SwipeLoaded(users: List.from(state.users)..remove(event..props)));
    // });

// class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
//   SwipeBloc() : super(SwipeLoading());

//   @override
//   Stream<SwipeState> mapEventToState(
//     SwipeEvent event,
//   ) async* {
//     if (event is LoadUsersEvent) {
//       yield* _mapLoadusersToState(event);
//     }
//     if (event is SwipeLeftEvent) {
//       yield* _mapSwipeLeftToState(event, state);
//     }
//     if (event is SwipeRightEvent) {
//       yield* _mapSwipeRightToState(event, state);
//     }
//   }

//   Stream<SwipeState> _mapLoadusersToState(LoadUsersEvent event) async* {
//     yield SwipeLoaded(users: event.users);
//   }

//   Stream<SwipeState> _mapSwipeLeftToState(
//       SwipeLeftEvent event, SwipeState state) async* {
//     if (state is SwipeLoaded) {
//       try {
//         yield SwipeLoaded(users: List.from(state.users)..remove(event.user));
//       } catch (_) {}
//     }
//   }

//   Stream<SwipeState> _mapSwipeRightToState(
//       SwipeRightEvent event, SwipeState state) async* {
//     if (state is SwipeLoaded) {
//       try {
//         yield SwipeLoaded(users: List.from(state.users)..remove(event.user));
//       } catch (_) {}
//     }
//   }
// }
