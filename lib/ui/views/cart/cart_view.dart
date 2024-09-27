import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
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
      body: SizedBox(
        child: Container(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      subtitle:
                          Text(viewModel.itemDescriptions[0].price.toString()),
                    );
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const Text('Subtotal Amount'),
                      Text(viewModel.totalPrice().toString()),
                      Text('Discount Amount'),
                      Text(viewModel.discountAmount().toString()),
                      Text('Total Amount'),
                      Text(viewModel.totalAmount().toString()),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  @override
  CartViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CartViewModel();
}
