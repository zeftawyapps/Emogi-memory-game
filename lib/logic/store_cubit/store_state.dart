part of 'store_cubit.dart';

@immutable
abstract class StoreState {}

class AddMony extends StoreState {}
class DeclineMony extends StoreState {}
class LoadMony extends StoreState {}
class Init extends StoreState {}