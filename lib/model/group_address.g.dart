// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupAddressModelImpl _$$GroupAddressModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupAddressModelImpl(
      id: json['id'] as int?,
      location: locationFromJson(json['location'] as String),
      address: json['address'] as String,
    );

Map<String, dynamic> _$$GroupAddressModelImplToJson(
        _$GroupAddressModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location': locationToJson(instance.location),
      'address': instance.address,
    };
