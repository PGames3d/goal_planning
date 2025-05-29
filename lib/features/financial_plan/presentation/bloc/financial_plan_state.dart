part of 'financial_plan_bloc.dart';

sealed class FinancialPlanState extends Equatable {
  const FinancialPlanState();
}

final class FinancialPlanInitial extends FinancialPlanState {
  @override
  List<Object> get props => [];
}
