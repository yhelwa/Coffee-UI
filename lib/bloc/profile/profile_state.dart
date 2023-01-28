// ignore_for_file: unnecessary_this

class ProfileState {
  dynamic email;
  dynamic password;
  bool? authenticated;
  dynamic fetchState;

  ProfileState(
      {this.email, this.password, this.authenticated, this.fetchState});

  ProfileState copyWith(ProfileState profileState) {
    return ProfileState(
        email: profileState.email ?? this.email,
        password: profileState.password ?? this.password,
        authenticated: profileState.authenticated ?? this.authenticated,
        fetchState: profileState.fetchState ?? this.fetchState);
  }
}
