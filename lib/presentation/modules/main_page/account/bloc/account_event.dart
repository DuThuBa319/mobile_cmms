part of 'account_bloc.dart';

@immutable
abstract class AccountEvent {}

class GetUserEvent extends AccountEvent {}
