part of 'single_product_bloc.dart';

sealed class SingleProductState extends Equatable {
  const SingleProductState();
  
  @override
  List<Object> get props => [];
}

final class SingleProductInitial extends SingleProductState {}
