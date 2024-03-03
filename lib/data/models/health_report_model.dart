import 'package:json_annotation/json_annotation.dart';

part 'health_report_model.g.dart';

@JsonSerializable()
class HealthReportModel {
  String userId;
  DateTime createdDate;
  String name;
  String? id;
  String tuanHoan;
  String hoHap;
  String tieuHoa;
  String than;
  String xuongKhop;
  String thanKinh;
  String tamThan;
  String ngoaiKhoa;
  String sanPhu;
  String khongKinh;
  String cacBenhVeMat;
  String coKinh;
  String phanLoaiRang;
  String hamTren;
  String hamDuoi;
  String cacBenhVeRang;
  String phanLoaiMat;
  String phanLoaiDa;

  HealthReportModel({
    required this.userId,
    required this.createdDate,
    this.name = "General Health",
    this.tuanHoan = "Bình thường",
    this.hoHap = "Bình thường",
    this.tieuHoa = "Bình thường",
    this.than = "Bình thường",
    this.xuongKhop = "Bình thường",
    this.thanKinh = "Bình thường",
    this.tamThan = "Bình thường",
    this.ngoaiKhoa = "Bình thường",
    this.sanPhu = "Bình thường",
    this.khongKinh = "Mắt phải: 10/10, Mắt trái: 10/10",
    this.cacBenhVeMat = "N/A",
    this.coKinh = "N/A",
    this.phanLoaiRang = "2",
    this.hamDuoi = "Bình thường 95%",
    this.hamTren = "Bình thường 95%",
    this.cacBenhVeRang = "Bình thường",
    this.phanLoaiDa = "1",
    this.phanLoaiMat = "1",
  });

  factory HealthReportModel.fromJson(Map<String, dynamic> json) =>
      _$HealthReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$HealthReportModelToJson(this);
}
