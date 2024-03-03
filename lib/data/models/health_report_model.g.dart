// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthReportModel _$HealthReportModelFromJson(Map<String, dynamic> json) =>
    HealthReportModel(
      userId: json['userId'] as String,
      createdDate: DateTime.parse(json['createdDate'] as String),
      name: json['name'] as String? ?? "General Health",
      tuanHoan: json['tuanHoan'] as String? ?? "Bình thường",
      hoHap: json['hoHap'] as String? ?? "Bình thường",
      tieuHoa: json['tieuHoa'] as String? ?? "Bình thường",
      than: json['than'] as String? ?? "Bình thường",
      xuongKhop: json['xuongKhop'] as String? ?? "Bình thường",
      thanKinh: json['thanKinh'] as String? ?? "Bình thường",
      tamThan: json['tamThan'] as String? ?? "Bình thường",
      ngoaiKhoa: json['ngoaiKhoa'] as String? ?? "Bình thường",
      sanPhu: json['sanPhu'] as String? ?? "Bình thường",
      khongKinh:
          json['khongKinh'] as String? ?? "Mắt phải: 10/10, Mắt trái: 10/10",
      cacBenhVeMat: json['cacBenhVeMat'] as String? ?? "N/A",
      coKinh: json['coKinh'] as String? ?? "N/A",
      phanLoaiRang: json['phanLoaiRang'] as String? ?? "2",
      hamDuoi: json['hamDuoi'] as String? ?? "Bình thường 95%",
      hamTren: json['hamTren'] as String? ?? "Bình thường 95%",
      cacBenhVeRang: json['cacBenhVeRang'] as String? ?? "Bình thường",
      phanLoaiDa: json['phanLoaiDa'] as String? ?? "1",
      phanLoaiMat: json['phanLoaiMat'] as String? ?? "1",
    )..id = json['id'] as String?;

Map<String, dynamic> _$HealthReportModelToJson(HealthReportModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'createdDate': instance.createdDate.toIso8601String(),
      'name': instance.name,
      'id': instance.id,
      'tuanHoan': instance.tuanHoan,
      'hoHap': instance.hoHap,
      'tieuHoa': instance.tieuHoa,
      'than': instance.than,
      'xuongKhop': instance.xuongKhop,
      'thanKinh': instance.thanKinh,
      'tamThan': instance.tamThan,
      'ngoaiKhoa': instance.ngoaiKhoa,
      'sanPhu': instance.sanPhu,
      'khongKinh': instance.khongKinh,
      'cacBenhVeMat': instance.cacBenhVeMat,
      'coKinh': instance.coKinh,
      'phanLoaiRang': instance.phanLoaiRang,
      'hamTren': instance.hamTren,
      'hamDuoi': instance.hamDuoi,
      'cacBenhVeRang': instance.cacBenhVeRang,
      'phanLoaiMat': instance.phanLoaiMat,
      'phanLoaiDa': instance.phanLoaiDa,
    };
