// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../application/pages/category/category/cubit/category_cubit.dart'
    as _i98;
import '../../application/pages/category/new_or_update_category/cubit/new_or_update_category_cubit.dart'
    as _i439;
import '../../application/pages/core/transactions_cubit/transactions_cubit.dart'
    as _i661;
import '../../application/pages/settings/cubit/settings_cubit.dart' as _i267;
import '../../application/pages/sign_in/cubit/sign_in_cubit.dart' as _i549;
import '../../application/pages/transactions/filter/cubit/filter_cubit.dart'
    as _i123;
import '../../application/pages/transactions/new_or_update_transaction/cubit/new_or_update_transaction_cubit.dart'
    as _i574;
import '../../application/pages/transactions/search/cubit/search_cubit.dart'
    as _i780;
import '../../data/data_sources/interfaces/transactions_local_data_source.dart'
    as _i505;
import '../../data/data_sources/interfaces/transactions_remote_data_source.dart'
    as _i607;
import '../../data/data_sources/local/transactions_local_data_source_impl.dart'
    as _i96;
import '../../data/data_sources/remote/transactions_remote_data_source_impl.dart'
    as _i381;
import '../../data/repositories/auth_service_impl.dart' as _i789;
import '../../data/repositories/transactions_impl.dart' as _i295;
import '../../domain/repositories/auth_service.dart' as _i1051;
import '../../domain/repositories/transactions.dart' as _i1041;
import '../../domain/use_cases/delete_category.dart' as _i951;
import '../../domain/use_cases/delete_transaction.dart' as _i439;
import '../../domain/use_cases/get_categories.dart' as _i212;
import '../../domain/use_cases/get_category.dart' as _i261;
import '../../domain/use_cases/get_transaction.dart' as _i881;
import '../../domain/use_cases/get_transactions.dart' as _i522;
import '../../domain/use_cases/get_user.dart' as _i832;
import '../../domain/use_cases/new_or_update_category.dart' as _i609;
import '../../domain/use_cases/new_or_update_transaction.dart' as _i862;
import '../../domain/use_cases/search_transaction.dart' as _i880;
import '../../domain/use_cases/sign_in_with_google.dart' as _i379;
import '../../domain/use_cases/singn_out.dart' as _i648;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i607.TransactionsRemoteDataSource>(
        () => _i381.TransactionsRemoteDataSourceImpl());
    gh.singleton<_i1051.AuthService>(() => _i789.AuthServiceImpl());
    gh.factory<_i505.TransactionsLocalDataSource>(() => _i96.MemoryCache());
    gh.lazySingleton<_i1041.TransactionsRepository>(
        () => _i295.TransactionsRepositoryImpl(
              gh<_i607.TransactionsRemoteDataSource>(),
              gh<_i505.TransactionsLocalDataSource>(),
            ));
    gh.factory<_i951.DeleteCategory>(
        () => _i951.DeleteCategory(gh<_i1041.TransactionsRepository>()));
    gh.factory<_i439.DeleteTransaction>(
        () => _i439.DeleteTransaction(gh<_i1041.TransactionsRepository>()));
    gh.factory<_i212.GetCategories>(
        () => _i212.GetCategories(gh<_i1041.TransactionsRepository>()));
    gh.factory<_i261.GetCategory>(
        () => _i261.GetCategory(gh<_i1041.TransactionsRepository>()));
    gh.factory<_i881.GetTransaction>(
        () => _i881.GetTransaction(gh<_i1041.TransactionsRepository>()));
    gh.factory<_i522.GetTransactions>(
        () => _i522.GetTransactions(gh<_i1041.TransactionsRepository>()));
    gh.factory<_i609.NewOrUpdateCategory>(
        () => _i609.NewOrUpdateCategory(gh<_i1041.TransactionsRepository>()));
    gh.factory<_i862.NewOrUpdateTransaction>(() =>
        _i862.NewOrUpdateTransaction(gh<_i1041.TransactionsRepository>()));
    gh.factory<_i880.SearchTransaction>(
        () => _i880.SearchTransaction(gh<_i1041.TransactionsRepository>()));
    gh.factoryParam<_i439.NewOrUpdateCategoryCubit, String?, dynamic>((
      id,
      _,
    ) =>
        _i439.NewOrUpdateCategoryCubit(
          gh<_i261.GetCategory>(),
          gh<_i609.NewOrUpdateCategory>(),
          id,
        ));
    gh.factory<_i98.CategoryCubit>(() => _i98.CategoryCubit(
          gh<_i212.GetCategories>(),
          gh<_i951.DeleteCategory>(),
        ));
    gh.factory<_i832.GetUser>(() => _i832.GetUser(gh<_i1051.AuthService>()));
    gh.factory<_i379.SignInWithGoogle>(
        () => _i379.SignInWithGoogle(gh<_i1051.AuthService>()));
    gh.factory<_i648.SignOut>(() => _i648.SignOut(gh<_i1051.AuthService>()));
    gh.factoryParam<_i574.NewOrUpdateTransactionCubit, String?, dynamic>((
      id,
      _,
    ) =>
        _i574.NewOrUpdateTransactionCubit(
          gh<_i212.GetCategories>(),
          gh<_i862.NewOrUpdateTransaction>(),
          gh<_i881.GetTransaction>(),
          id,
        ));
    gh.factory<_i780.SearchCubit>(
        () => _i780.SearchCubit(gh<_i880.SearchTransaction>()));
    gh.factory<_i549.SignInCubit>(
        () => _i549.SignInCubit(gh<_i379.SignInWithGoogle>()));
    gh.factory<_i267.SettingsCubit>(() => _i267.SettingsCubit(
          gh<_i648.SignOut>(),
          gh<_i832.GetUser>(),
        ));
    gh.factory<_i123.FilterCubit>(
        () => _i123.FilterCubit(gh<_i212.GetCategories>()));
    gh.factory<_i661.TransactionsCubit>(() => _i661.TransactionsCubit(
          gh<_i522.GetTransactions>(),
          gh<_i439.DeleteTransaction>(),
        ));
    return this;
  }
}
