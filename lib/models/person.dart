class PersonModel {
  final int id;
  final String name;
  final String status;
  final String image;
  final String gender;
  final String location;
  final String originName;
  final String species;

  PersonModel({this.id, this.name, this.status, this.image, this.gender,
      this.location, this.originName, this.species});

  PersonModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        status = json['status'],
        species = json['species'],
        gender = json['gender'],
        originName = json['origin']['name'],
        location = json['location']['name'],
        image = json['image'];
}