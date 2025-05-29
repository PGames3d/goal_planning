import '../constants/app_constants.dart';

enum UserType {
  owner(userTypeId: AppConstants.userTypeOwner,name: "owner"),
  salesman(userTypeId: AppConstants.userTypeSalesman,name: "salesman"),
  godownkeeper(userTypeId: AppConstants.userTypeGodownkeeper, name: "godownkeeper"),
  deliveryman(userTypeId: AppConstants.userTypeDeliveryman,name: "deliveryman"),
  seniorManager(userTypeId: AppConstants.userTypeSeniorManager,name: "senior_manager"),
  manager(userTypeId: AppConstants.userTypeManager,name: "manager"),
  cashier(userTypeId: AppConstants.userTypeCashier,name: "cashier"),
  admin(userTypeId: AppConstants.userTypeAdmin,name: "admin"),
  accountant(userTypeId: AppConstants.userTypeAccountant,name: "accountant"),
  supplyManager(userTypeId: AppConstants.userTypeSupplyManager,name: "supply_manager");

  const UserType({required this.userTypeId,required this.name});

  final int userTypeId;
  final String name;
}










