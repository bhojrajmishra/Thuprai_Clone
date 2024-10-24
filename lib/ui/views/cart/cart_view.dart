import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_clone/base/widgets/base_app_bar.dart';
import 'package:thuprai_clone/theme/custom_theme.dart';
import 'package:thuprai_clone/ui/common/ui_helpers.dart';
import 'package:thuprai_clone/ui/views/cart/cart_viewmodel.dart';
import 'package:thuprai_clone/ui/views/cart/model/cart_request_model.dart';
import 'package:thuprai_clone/base/widgets/base_button.dart';
import 'package:thuprai_clone/base/widgets/base_error_message.dart';

class CartView extends StackedView<CartViewModel> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CartViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "Cart",
        backgroundColor: Colors.white,
      ),
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : viewModel.cartModel == null || viewModel.cartModel!.lines!.isEmpty
              ? const Center(
                  child: BaseErrorMessage(
                    message: 'No items in cart',
                    // textStyle: CustomTheme.bodyLarge(context),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: viewModel.cartModel!.lines!.length,
                        separatorBuilder: (context, index) => Divider(
                          color: CustomTheme.secondary(context),
                        ),
                        itemBuilder: (context, index) {
                          final item = viewModel.cartModel!.lines![index];
                          return ListTile(
                            leading: Image.network(item.thumbnail ?? ''),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove,
                                      color: CustomTheme.primary(context)),
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
                                Text(item.quantity.toString(),
                                    style: CustomTheme.bodyLarge(context)),
                                IconButton(
                                  icon: Icon(Icons.add,
                                      color: CustomTheme.primary(context)),
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
                                  icon: Icon(Icons.delete,
                                      color: CustomTheme.primary(context)),
                                  onPressed: () {
                                    viewModel.onDeleteCartShowDialog(
                                      context,
                                      viewModel.cartModel!.id.toString(),
                                      item.id.toString(),
                                    );
                                  },
                                )
                              ],
                            ),
                            title: Text(item.productTitle ?? '',
                                style: CustomTheme.bodyLarge(context)),
                            subtitle: Text(item.priceInclTax ?? '',
                                style: CustomTheme.labelMedium(context)),
                          );
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: CustomTheme.featuredSectionColor(context),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Subtotal: ${viewModel.cartModel!.totalExclTax!}',
                              style: CustomTheme.bodyLarge(context),
                            ),
                            verticalSpaceSmall,
                            Text(
                              'Discount: ${viewModel.cartModel!.voucherDiscounts!.isNotEmpty ? viewModel.cartModel!.voucherDiscounts!.first : '0.00'}',
                              style: CustomTheme.bodyLarge(context),
                            ),
                            const Divider(height: 24),
                            Text(
                              'Total: ${viewModel.cartModel!.totalExclTax!}',
                              style: CustomTheme.displayLarge(context),
                            ),
                            verticalSpaceMedium,
                            BaseButton(
                              text: 'Checkout',
                              onPressed: () {
                                // Implement checkout logic
                              },
                              color: CustomTheme.primary(context),
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
