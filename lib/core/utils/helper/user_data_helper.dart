/*
 * Copyright (c) 2025. BeyondSouls. All rights reserved.
 * Author: Parshuram Pathave
 *
 */

import '../../../features/login/data/model/login_response_model.dart';
import '../enums/user_type_enums.dart';

class UserData {
  final UserType userType;
  final LoginResponseModel loginModel;

  UserData({required this.userType, required this.loginModel});
}
