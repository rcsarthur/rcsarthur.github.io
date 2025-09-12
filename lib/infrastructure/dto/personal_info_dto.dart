import 'package:curriculum_dart/domain/entities/personal_info.dart';

class PersonalInfoDto {
  final String name;
  final String title;
  final String email;
  final String phone;
  final String location;
  final String summary;
  final String profileImageUrl;

  const PersonalInfoDto({
    required this.name,
    required this.title,
    required this.email,
    required this.phone,
    required this.location,
    required this.summary,
    required this.profileImageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'title': title,
      'email': email,
      'phone': phone,
      'location': location,
      'summary': summary,
      'profileImageUrl': profileImageUrl,
    };
  }

  factory PersonalInfoDto.fromJson(Map<String, dynamic> json) {
    return PersonalInfoDto(
      name: json['name'] as String,
      title: json['title'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      location: json['location'] as String,
      summary: json['summary'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
    );
  }

  PersonalInfo toDomain() {
    return PersonalInfo(
      name: name,
      title: title,
      email: email,
      phone: phone,
      location: location,
      summary: summary,
      profileImageUrl: profileImageUrl,
    );
  }

  factory PersonalInfoDto.fromDomain(PersonalInfo personalInfo) {
    return PersonalInfoDto(
      name: personalInfo.name,
      title: personalInfo.title,
      email: personalInfo.email,
      phone: personalInfo.phone,
      location: personalInfo.location,
      summary: personalInfo.summary,
      profileImageUrl: personalInfo.profileImageUrl,
    );
  }
}
