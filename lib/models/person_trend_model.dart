class PersonTrend {
  int gender;
  String knownForDepartment;
  String profilePath;
  bool adult;
  int id;
  String name;
  double popularity;
  String mediaType;

  PersonTrend(
      {this.gender,
      this.knownForDepartment,
      this.profilePath,
      this.adult,
      this.id,
      this.name,
      this.popularity,
      this.mediaType});

  factory PersonTrend.fromJson(Map<String, dynamic> json) {
    return PersonTrend(
      gender: json['gender'],
      knownForDepartment: json['known_for_department'],
      profilePath: json['profile_path'],
      adult: json['adult'],
      id: json['id'],
      name: json['name'],
      popularity: json['popularity'],
      mediaType: json['media_type'],
    );
  }
}
