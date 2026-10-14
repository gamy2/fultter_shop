import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/service/services_locator.dart';
import 'package:my_store/shop/product/presentation/controller/products_bloc.dart';
import 'package:my_store/shop/product/presentation/controller/products_events.dart';
import 'package:my_store/shop/product/presentation/controller/products_states.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return ProductsBloc(sl())..add(GetAllProductsEvent());
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
                  for (var product in state.products)
                    Column(
                      children: [
                        Text(product.title),
                        Text(product.description),
                        Image.network(product.image, width: 180),
                        Text('\$${product.price}'),
                        const SizedBox(height: 16),
                      ],
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// appBar: AppBar(
//         title: const Text('Products'),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             for (var product in products)
//               Column(
//                 children: [
//                   Text(product.title),
//                   Text(product.description),
//                   Image.network(product.image, width: 180),
//                   Text('\$${product.price}'),
//                   const SizedBox(height: 16),
//                 ],
//               ),
//           ],
//         ),
//       ),
