part of 'swipe_bloc.dart';

abstract class SwipeState {
  const SwipeState();

  @override
  List<Object> get props => [];
}

class SwipeLoading extends SwipeState {}

class SwipeLoaded extends SwipeState {
  final List<User> users;

  const SwipeLoaded({required this.users});

  @override
  List<Object> get props => [users];
}

class SwipeError extends SwipeState {}

// /// UnInitialized
// class UnSwipeState extends SwipeState {

//   UnSwipeState();

//   @override
//   String toString() => 'UnSwipeState';
// }

// /// Initialized
// class InSwipeState extends SwipeState {
//   InSwipeState(this.hello);
  
//   final String hello;

//   @override
//   String toString() => 'InSwipeState $hello';

//   @override
//   List<Object> get props => [hello];
// }

// class ErrorSwipeState extends SwipeState {
//   ErrorSwipeState(this.errorMessage);
 
//   final String errorMessage;
  
//   @override
//   String toString() => 'ErrorSwipeState';

//   @override
//   List<Object> get props => [errorMessage];
// }
