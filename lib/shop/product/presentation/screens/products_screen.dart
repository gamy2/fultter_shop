import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/service/services_locator.dart';
import 'package:my_store/shop/product/presentation/controller/products_bloc.dart';
import 'package:my_store/shop/product/presentation/controller/products_events.dart';
import 'package:my_store/shop/product/presentation/controller/products_states.dart';
import 'package:my_store/shop/product/presentation/widgets/products_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // print(sl<ProductsBloc>().hashCode);
    return BlocProvider(
      create: (BuildContext context) {
        return sl<ProductsBloc>()
          ..add(GetAllProductsEvent())
          ..add(GetAllCategoriesEvent());
      },
      child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Products'),
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 80,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,

                      child: Row(
                        children: [
                          for (var cat in state.categories) Text(cat.name),
                        ],
                      ),
                    ),
                  ),
                  ProductsComponent(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
