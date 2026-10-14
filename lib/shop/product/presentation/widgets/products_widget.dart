import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/service/services_locator.dart';
import 'package:my_store/core/utils/enums.dart';
import 'package:my_store/shop/product/presentation/controller/products_bloc.dart';
import 'package:my_store/shop/product/presentation/controller/products_states.dart';

class ProductsComponent extends StatelessWidget {
  const ProductsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    print(sl<ProductsBloc>().hashCode);
    return BlocBuilder<ProductsBloc, ProductsState>(
      buildWhen: (previous, current) =>
          previous.productsRequestState != current.productsRequestState,
      builder: (context, state) {
        switch (state.productsRequestState) {
          case RequestState.loading:
            return SizedBox(child: CircularProgressIndicator());

          case RequestState.loaded:
            return ListView.separated(
              itemCount: state.products.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Container(
                    width: 180,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue, // Border color
                        width: 2.0, // Border thickness
                        style: BorderStyle.solid, // Border style
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(state.products[index].title),
                        // Text(state.products[index].description),
                        Image.network(state.products[index].image, width: 180),
                        Text('\$${state.products[index].price}'),
                        const SizedBox(height: 16),
                        MaterialButton(
                          onPressed: () {},
                          child: Text("Buy Now"),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 5);
              },
            );
          case RequestState.error:
            return Center(child: Text(state.productsErrorMessage));
        }
      },
    );
  }
}
