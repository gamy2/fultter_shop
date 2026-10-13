import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
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


 // @override
  // void initState() {
  //   super.initState();
  //   _getData(); // event
  // }

  // void _getData() async {
  //   BaseProductRremoteDataSource baseProductRemoteDataSource =
  //       ProductRemoteDataSource(DioClient());
  //   BaseProductRepository baseProductRepository = ProductRepository(
  //     baseProductRemoteDataSource,
  //   );
  //   final res = await GetAllProductsUsecase(baseProductRepository).call();
  //   res.fold(
  //     (l) {
  //       // Handle failure
  //       print('Error: ${l.message}');
  //     },
  //     (r) {
  //       setState(() {
  //         // state
  //         products = r;
  //         print(r);
  //       });
  //     },
  //   );
  // }
