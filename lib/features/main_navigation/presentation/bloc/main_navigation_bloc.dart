import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/data/model/switch_model.dart';
import '../../../../core/data/services/locator.dart';
import '../../../../core/repository/secured_local_repository.dart';
import '../../../../core/utils/common_utils.dart';
import '../../../../core/utils/constants/app_constants.dart';

part 'main_navigation_event.dart';
part 'main_navigation_state.dart';

class MainNavigationBloc extends Bloc<MainNavigationEvent, MainNavigationState> {
  MainNavigationBloc(super.initialState){
    on<BottomNavigationEvent>(_bottomNavigationEvent);
    on<InitialEvent>(_initialEvent);
  }

  void _bottomNavigationEvent(BottomNavigationEvent event, Emitter<MainNavigationState> emit) async{
    emit(HomeInitialState());
    var data = await locator<SecuredLocalRepository>().getObject(AppConstants.switches);
    var switchModel = SwitchModel.fromJson(data ?? {});
    if(switchModel.result?.ack == true){
      emit(BottomNavigationState( index: event.index));
    }else{
      emit(BottomNavigationState(index: event.index));
    }
  }
  void _initialEvent(InitialEvent event, Emitter<MainNavigationState> emit) async{
    try{
      // emit(BottomNavigationState( index: 0,userType: user.userType));
      ///call all apis
      // await Future.wait([
      //   _repository.getAllFlags(body: {
      //     "apiVersion":"1"
      //   }).then((value) => locator<SecuredLocalRepository>().saveObject(AppConstants.allFlags,(value as AllFlagsModel).toJson()),),
      //   _repository.getBasicInfo(body: {
      //     "apiVersion":"1"
      //   }).then((value) => locator<SecuredLocalRepository>().saveObject(AppConstants.basicInfo,(value as BasicInfoModel).toJson()),),
      //   _repository.getSwitches(body: {
      //     "apiVersion":"1"
      //   }).then((value) => locator<SecuredLocalRepository>().saveObject(AppConstants.switches,(value as SwitchModel).toJson()),),
      // ]);
      // var data = await locator<SecuredLocalRepository>().getObject(AppConstants.switches);
      // var switchModel = SwitchModel.fromJson(data ?? {});
      // if(switchModel.result?.ack == true){
      //   emit(BottomNavigationState( index: 0,userType: user.userType,isRetailerRequired: switchModel.result?.data?.retailerButtonFlag ?? false));
      // }else{
      //   emit(BottomNavigationState( index: 0,userType: user.userType));
      // }

      emit(const BottomNavigationState( index: 0));
    }catch(e){
      logger.e(e);
    }

  }
}
