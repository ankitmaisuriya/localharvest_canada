import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localharvest_canada/features/categories/presentation/cubit/category_cubit.dart';
import 'package:localharvest_canada/features/categories/presentation/cubit/category_state.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return SizedBox(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (_, __) => _categoryShimmer(),
            ),
          );
        }

        if (state is CategoryLoaded) {
          final categories = state.categories;

          return SizedBox(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final category = categories[index];

                return Column(
                  children: [
                    Image.network(
                      '${category.imageUrl}',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;

                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        );
                      },
                      errorBuilder: (_, __, ___) {
                        return Image.asset(
                          'assets/images/app_icon.png',
                          width: 80,
                          height: 80,
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    Text(
                      category.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              },
            ),
          );
        }

        if (state is CategoryError) {
          return Center(child: Text(state.message));
        }

        return const SizedBox();
      },
    );
  }

  /// 🔥 Shimmer skeleton item
  Widget _categoryShimmer() {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(width: 50, height: 10, color: Colors.white),
        ),
      ],
    );
  }
}
