class ProfileEvents {
  final dynamic email;
  final dynamic password;
  ProfileEvents({this.email, this.password});
}

class FetchCredentials extends ProfileEvents {
  FetchCredentials();
}

class SaveProfileDetails extends ProfileEvents {
  SaveProfileDetails({
    dynamic email,
    dynamic password,
  }) : super(
          email: email,
          password: password,
        );
}
