import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_clone/base/widgets/base_button.dart';
import 'package:thuprai_clone/base/widgets/base_error_message.dart';
import 'package:thuprai_clone/ui/views/cart/cart_viewmodel.dart';

class CartView extends StackedView<CartViewModel> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CartViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: viewModel.items.isEmpty
            ? const Center(child: BaseErrorMessage(message: 'No items in cart'))
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: viewModel.items.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.network(viewModel.items[index].imageUrl),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove, color: Colors.red),
                              onPressed: () {
                                viewModel.decrementItem(index);
                              },
                            ),
                            Text(viewModel.items[index].quantity.toString()),
                            IconButton(
                              icon: const Icon(Icons.add, color: Colors.green),
                              onPressed: () {
                                viewModel.incrementItem(index);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                viewModel.onRemoveItem(index);
                              },
                            )
                          ],
                        ),
                        title: Text(viewModel.itemDescriptions[0].name),
                        subtitle: Text(
                            viewModel.itemDescriptions[0].price.toString()),
                      );
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(49, 33, 149, 243)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Subtotal' + viewModel.totalPrice().toString(),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Discount' + viewModel.discountAmount().toString(),
                          ),
                          const Divider(height: 24),
                          Text(
                            'Total' + viewModel.totalAmount().toString(),
                          ),
                          const SizedBox(height: 16),
                          BaseButton(
                            text: 'Checkout',
                            onPressed: () {
                              // viewModel.onCheckout();
                            },
                            color: const Color.fromARGB(255, 33, 100, 243),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ));
  }

  @override
  CartViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CartViewModel();
}
