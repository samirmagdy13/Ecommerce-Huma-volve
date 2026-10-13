import 'package:ecommerce_app_huma_volve/features/home/data/models/product_response.dart';
import 'package:ecommerce_app_huma_volve/features/home/view_model/catalog_cubit/catalog_cubit.dart';
import 'package:ecommerce_app_huma_volve/features/home/view_model/catalog_cubit/catalog_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/dummy_data.dart';
import '../../../core/theme.dart';
import '../widgets/category_chip.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CatalogCubit>().fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: BlocBuilder<CatalogCubit, CatalogState>(
          builder: (context, state) {
            final catalogState = state is CatalogSuccess ? state : null;

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withValues(alpha: 0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.menu,
                                color: AppTheme.primary,
                              ),
                            ),
                            CircleAvatar(
                              radius: 24,
                              backgroundImage: NetworkImage(
                                dummyUser.profilePictureUrl,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'Explore',
                          style: Theme.of(context).textTheme.displayLarge
                              ?.copyWith(fontSize: 36),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Best trendy collection!',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(fontSize: 18),
                        ),
                        const SizedBox(height: 32),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withValues(alpha: 0.05),
                                blurRadius: 15,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search clothes...',
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              suffixIcon: Container(
                                margin: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: AppTheme.primary,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.tune,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        SizedBox(
                          height: 44,
                          child: _buildCategories(state, catalogState),
                        ),
                      ],
                    ),
                  ),
                ),
                _buildProductsSliver(state, catalogState),
                const SliverToBoxAdapter(child: SizedBox(height: 24)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildCategories(
    CatalogState state,
    CatalogSuccess? catalogState,
  ) {
    if (catalogState != null) {
      if (catalogState.categories.isEmpty) {
        return const Center(child: Text('No categories available.'));
      }
      return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: catalogState.categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final category = catalogState.categories[index];
          return CategoryChip(
            label: category.name,
            isSelected: catalogState.selectedCategoryId == category.id,
            onTap: () => context.read<CatalogCubit>().fetchProductsForCategory(
              category.id,
            ),
          );
        },
      );
    }

    if (state is CatalogError) {
      return Row(
        children: [
          Expanded(child: Text(state.error, maxLines: 2)),
          IconButton(
            onPressed: () => context.read<CatalogCubit>().fetchCategories(),
            icon: const Icon(Icons.refresh),
            tooltip: 'Retry loading categories',
          ),
        ],
      );
    }

    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildProductsSliver(
    CatalogState state,
    CatalogSuccess? catalogState,
  ) {
    if (catalogState != null) {
      if (catalogState.productsLoading) {
        return const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: CircularProgressIndicator()),
        );
      }
      if (catalogState.productsError case final error?) {
        return SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(error, textAlign: TextAlign.center),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: catalogState.selectedCategoryId == null
                      ? null
                      : () =>
                            context.read<CatalogCubit>()
                                .fetchProductsForCategory(
                              catalogState.selectedCategoryId!,
                            ),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        );
      }
      if (catalogState.products.isEmpty) {
        return const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: Text('No products found in this category.')),
        );
      }

      return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          delegate: SliverChildBuilderDelegate((context, index) {
            return ProductCard(
              product: _toDisplayProduct(catalogState.products[index]),
            );
          }, childCount: catalogState.products.length),
        ),
      );
    }

    if (state is CatalogError) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: Text('Unable to load categories: ${state.error}')),
      );
    }

    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Product _toDisplayProduct(ProductResponse product) {
    return Product(
      id: product.id.toString(),
      name: product.title,
      description: product.description,
      price: product.price.toDouble(),
      imageUrl: product.images.isNotEmpty ? product.images.first : '',
      colors: const [Colors.black, Colors.white, Colors.grey],
      sizes: const ['One Size'],
    );
  }
}
