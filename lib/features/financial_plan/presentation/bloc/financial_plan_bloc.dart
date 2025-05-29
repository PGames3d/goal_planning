import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'financial_plan_event.dart';
part 'financial_plan_state.dart';

class FinancialPlanBloc extends Bloc<FinancialPlanEvent, FinancialPlanState> {
  FinancialPlanBloc() : super(FinancialPlanInitial()) {
    on<FinancialPlanEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
