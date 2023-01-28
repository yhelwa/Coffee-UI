// ignore_for_file: unnecessary_this

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profile_state.dart';
import 'profile_event.dart';

class ProfileBloc extends Bloc<ProfileEvents, ProfileState> {
  ProfileBloc()
      : super(ProfileState(authenticated: false, fetchState: 'none')) {
    on<FetchCredentials>((event, emit) async {
      emit(this.state.copyWith(
          ProfileState(authenticated: false, fetchState: 'fetching')));
      print(state.email);
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: state.email, password: state.password);
        emit(this.state.copyWith(
            ProfileState(authenticated: true, fetchState: 'fetched')));
        print('success');
      } on FirebaseAuthException catch (e) {
        print('error');
        print(e.code);

        emit(this
            .state
            .copyWith(ProfileState(authenticated: false, fetchState: 'none')));
      }
    });

    on<SaveProfileDetails>((event, emit) {
      emit(this.state.copyWith(
          ProfileState(email: event.email, password: event.password)));
    });
  }
}
