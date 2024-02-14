// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:money_manager/application/pages/category/category/cubit/category_cubit.dart'
    as _i27;
import 'package:money_manager/application/pages/category/new_or_update_category/cubit/new_or_update_category_cubit.dart'
    as _i21;
import 'package:money_manager/application/pages/settings/cubit/settings_cubit.dart'
    as _i24;
import 'package:money_manager/application/pages/sign_in/cubit/sign_in_cubit.dart'
    as _i25;
import 'package:money_manager/application/pages/transactions/new_or_update_transaction/cubit/new_or_update_transaction_cubit.dart'
    as _i23;
import 'package:money_manager/application/pages/transactions/transactions/cubit/transactions_cubit.dart'
    as _i26;
import 'package:money_manager/data/data_sources/interfaces/transactions_local_data_source.dart'
    as _i8;
import 'package:money_manager/data/data_sources/interfaces/transactions_remote_data_source.dart'
    as _i10;
import 'package:money_manager/data/data_sources/local/transactions_local_data_source_impl.dart'
    as _i9;
import 'package:money_manager/data/data_sources/remote/transactions_remote_data_source_impl.dart'
    as _i11;
import 'package:money_manager/data/repositories/auth_service_impl.dart' as _i4;
import 'package:money_manager/data/repositories/transactions_impl.dart' as _i13;
import 'package:money_manager/domain/repositories/auth_service.dart' as _i3;
import 'package:money_manager/domain/repositories/transactions.dart' as _i12;
import 'package:money_manager/domain/use_cases/delete_category.dart' as _i14;
import 'package:money_manager/domain/use_cases/delete_transaction.dart' as _i15;
import 'package:money_manager/domain/use_cases/get_categories.dart' as _i16;
import 'package:money_manager/domain/use_cases/get_category.dart' as _i17;
import 'package:money_manager/domain/use_cases/get_transaction.dart' as _i18;
import 'package:money_manager/domain/use_cases/get_transactions.dart' as _i19;
import 'package:money_manager/domain/use_cases/get_user.dart' as _i5;
import 'package:money_manager/domain/use_cases/new_or_update_category.dart'
    as _i20;
import 'package:money_manager/domain/use_cases/new_or_update_transaction.dart'
    as _i22;
import 'package:money_manager/domain/use_cases/sign_in_with_google.dart' as _i6;
import 'package:money_manager/domain/use_cases/singn_out.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AuthService>(_i4.AuthServiceImpl());
    gh.factory<_i5.GetUser>(() => _i5.GetUser(gh<_i3.AuthService>()));
    gh.factory<_i6.SignInWithGoogle>(
        () => _i6.SignInWithGoogle(gh<_i3.AuthService>()));
    gh.factory<_i7.SignOut>(() => _i7.SignOut(gh<_i3.AuthService>()));
    gh.factory<_i8.TransactionsLocalDataSource>(() => _i9.MemoryCache());
    gh.factory<_i10.TransactionsRemoteDataSource>(
        () => _i11.TransactionsRemoteDataSourceImpl());
    gh.singleton<_i12.TransactionsRepository>(_i13.TransactionsRepositoryImpl(
      gh<_i10.TransactionsRemoteDataSource>(),
      gh<_i8.TransactionsLocalDataSource>(),
    ));
    gh.factory<_i14.DeleteCategory>(
        () => _i14.DeleteCategory(gh<_i12.TransactionsRepository>()));
    gh.factory<_i15.DeleteTransaction>(
        () => _i15.DeleteTransaction(gh<_i12.TransactionsRepository>()));
    gh.factory<_i16.GetCategories>(
        () => _i16.GetCategories(gh<_i12.TransactionsRepository>()));
    gh.factory<_i17.GetCategory>(
        () => _i17.GetCategory(gh<_i12.TransactionsRepository>()));
    gh.factory<_i18.GetTransaction>(
        () => _i18.GetTransaction(gh<_i12.TransactionsRepository>()));
    gh.factory<_i19.GetTransactions>(
        () => _i19.GetTransactions(gh<_i12.TransactionsRepository>()));
    gh.factory<_i20.NewOrUpdateCategory>(
        () => _i20.NewOrUpdateCategory(gh<_i12.TransactionsRepository>()));
    gh.factoryParam<_i21.NewOrUpdateCategoryCubit, int?, dynamic>((
      id,
      _,
    ) =>
        _i21.NewOrUpdateCategoryCubit(
          gh<_i17.GetCategory>(),
          gh<_i20.NewOrUpdateCategory>(),
          id,
        ));
    gh.factory<_i22.NewOrUpdateTransaction>(
        () => _i22.NewOrUpdateTransaction(gh<_i12.TransactionsRepository>()));
    gh.factoryParam<_i23.NewOrUpdateTransactionCubit, String?, dynamic>((
      id,
      _,
    ) =>
        _i23.NewOrUpdateTransactionCubit(
          gh<_i16.GetCategories>(),
          gh<_i22.NewOrUpdateTransaction>(),
          gh<_i18.GetTransaction>(),
          id,
        ));
    gh.factory<_i24.SettingsCubit>(() => _i24.SettingsCubit(
          gh<_i7.SignOut>(),
          gh<_i5.GetUser>(),
        ));
    gh.factory<_i25.SignInCubit>(
        () => _i25.SignInCubit(gh<_i6.SignInWithGoogle>()));
    gh.factory<_i26.TransactionsCubit>(() => _i26.TransactionsCubit(
          gh<_i19.GetTransactions>(),
          gh<_i15.DeleteTransaction>(),
        ));
    gh.factory<_i27.CategoryCubit>(() => _i27.CategoryCubit(
          gh<_i16.GetCategories>(),
          gh<_i14.DeleteCategory>(),
        ));
    return this;
  }
}
