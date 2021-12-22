import 'address_model.dart';
import 'company_model.dart';
import 'package:json_annotation/json_annotation.dart';

//flutter pub run build_runner build --delete-conflicting-outputs

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final AddressModel address;
  final String phone;
  final String website;
  final CompanyModel company;

  UserModel({required this.id, required this.name, required this.username, required this.email, required this.address, required this.phone, required this.website,
    required this.company
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}