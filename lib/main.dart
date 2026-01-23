import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localharvest_canada/config/routes/app_routes.dart';
import 'package:localharvest_canada/core/network/dio_client.dart';
import 'package:localharvest_canada/features/auth/data/datasources/auth_remote_datasource_impl.dart';
import 'package:localharvest_canada/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:localharvest_canada/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:localharvest_canada/features/categories/data/datasources/category_remote_datasource_impl.dart';
import 'package:localharvest_canada/features/categories/domain/repositories/category_repository_impl.dart';
import 'package:localharvest_canada/features/categories/domain/usecases/get_categories.dart';
import 'package:localharvest_canada/features/categories/presentation/cubit/category_cubit.dart';
import 'package:localharvest_canada/features/nearby_farms/data/datasources/nearby_farms_remote_datasource_impl.dart';
import 'package:localharvest_canada/features/nearby_farms/domain/repositories/nearby_farms_repository_impl.dart';
import 'package:localharvest_canada/features/nearby_farms/domain/usecases/get_nearby_farms.dart';
import 'package:localharvest_canada/features/nearby_farms/presentation/cubit/nearby_farms_cubit.dart';

import 'features/auth/domain/usecases/login_user.dart';
import 'features/auth/domain/usecases/register_user.dart';

void main() {
  runApp(const LocalHarvestApp());
}

class LocalHarvestApp extends StatelessWidget {
  const LocalHarvestApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = DioClient().dio;
    final remote = AuthRemoteDatasourceImpl(dio);
    final repo = AuthRepositoryImpl(remote);
    final loginUseCase = LoginUser(repo);
    final registerUseCase = RegisterUser(repo);

    //For categories
    // Assuming you have a repository and use case
    final categoryRemoteDatasourceImpl = CategoryRemoteDatasourceImpl(dio);
    final categoryRepo = CategoryRepositoryImpl(categoryRemoteDatasourceImpl);
    final getCategoriesUseCase = GetCategories(categoryRepo);

    //For Near by Farms
    var nearbyFarmsRemoteDatasourceImpl = NearbyFarmsRemoteDatasourceImpl(dio);
    var nearbyFarmsRepo = NearbyFarmsRepositoryImpl(
      nearbyFarmsRemoteDatasourceImpl,
    );
    var getNearbyFarms = GetNearbyFarms(nearbyFarmsRepo);

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) =>
              AuthCubit(loginUser: loginUseCase, registerUser: registerUseCase),
        ),
        BlocProvider<CategoryCubit>(
          create: (_) =>
              CategoryCubit(getCategories: getCategoriesUseCase)
                ..fetchCategories(),
        ),
        BlocProvider<NearbyFarmsCubit>(
          create: (_) =>
              NearbyFarmsCubit(getNearbyFarms: getNearbyFarms),
        ),
      ],
      child: MaterialApp(
        title: 'LocalHarvest Canada',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );

    BlocProvider(
      create: (_) =>
          AuthCubit(loginUser: loginUseCase, registerUser: registerUseCase),
      child: MaterialApp(
        title: 'LocalHarvest Canada',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
