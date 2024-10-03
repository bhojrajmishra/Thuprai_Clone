import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_clone/base/widgets/base_button.dart';
import 'package:thuprai_clone/base/widgets/base_error_message.dart';
import 'package:thuprai_clone/ui/views/cart/cart_viewmodel.dart';
import 'package:thuprai_clone/ui/views/cart/model/cart_request_model.dart';

class CartView extends StackedView<CartViewModel> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CartViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : viewModel.cartModel == null || viewModel.cartModel!.lines!.isEmpty
              ? const Center(
                  child: BaseErrorMessage(message: 'No items in cart'))
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: viewModel.cartModel!.lines!.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          final item = viewModel.cartModel!.lines![index];
                          return ListTile(
                            leading: Image.network(item.thumbnail ?? ''),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove,
                                      color: Colors.red),
                                  onPressed: () {
                                    viewModel.updateCartItem(
                                      viewModel.cartModel!.id.toString(),
                                      item.id.toString(),
                                      CartRequestModel(
                                        quantity: (item.quantity ?? 1) - 1,
                                        path: item.slug,
                                      ),
                                    );
                                  },
                                ),
                                Text(item.quantity.toString()),
                                IconButton(
                                  icon: const Icon(Icons.add,
                                      color: Colors.green),
                                  onPressed: () {
                                    viewModel.updateCartItem(
                                      viewModel.cartModel!.id.toString(),
                                      item.id.toString(),
                                      CartRequestModel(
                                        quantity: (item.quantity ?? 1) + 1,
                                        path: item.slug,
                                      ),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () {
                                    viewModel.removeCartItem(
                                      viewModel.cartModel!.id.toString(),
                                      item.id.toString(),
                                    );
                                  },
                                )
                              ],
                            ),
                            title: Text(item.productTitle ?? ''),
                            subtitle: Text(item.priceInclTax ?? ''),
                          );
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(49, 33, 149, 243),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                                'Subtotal: ${viewModel.totalPrice().toStringAsFixed(2)}'),
                            const SizedBox(height: 8),
                            Text(
                                'Discount: ${viewModel.discountAmount().toStringAsFixed(2)}'),
                            const Divider(height: 24),
                            Text(
                                'Total: ${viewModel.totalAmount().toStringAsFixed(2)}'),
                            const SizedBox(height: 16),
                            BaseButton(
                              text: 'Checkout',
                              onPressed: () {
                                // Implement checkout logic
                              },
                              color: const Color.fromARGB(255, 33, 100, 243),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
    );
  }

  @override
  CartViewModel viewModelBuilder(BuildContext context) => CartViewModel();
}
