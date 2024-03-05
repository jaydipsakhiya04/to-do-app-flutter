class PaymentDataModel{
  final String title;
  final String date;

  void Function()? onTap;

  PaymentDataModel({
    required this.title,
    required this.date,
    this.onTap,
  });
}