class User {
  String name;
  bool isVerified;
  int totalMonthlyTopUp = 0;
  Map<String, int> monthlyTopUpsPerBeneficiary =
      {}; // Track top-ups per beneficiary
  final int transactionFee = 10; // Define a transaction fee

  User({
    required this.name,
    required this.isVerified,
  });
}
