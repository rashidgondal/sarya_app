import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/payments/payments_view_model/update_bank_states.dart';
import 'package:sarya/settings/email/view_model/email_states.dart';
import '../../../data/repository/authentication_repository/auth_repo.dart';
import '../../../helper/shared_prefs.dart';
import '../../../navigation/router_path.dart';
import '../model/update_email_request.dart';

class UpdateBankCubits extends Cubit<UpdateBankStates> {
  UpdateBankCubits() : super(UpdateBankInitial());

  Future updateBankDetail({required UpdateBankDetailRequest updateBankDetailRequest, required NavigationService navigationService}) async {
    try {
      emit(UpdateBankLoading());

      final res = await AuthRepository.instance
          .update(body: updateBankDetailRequest.toJson());
      SharedPrefs pref = SharedPrefs();
      pref.saveUser(res);
      emit(UpdateBankLoaded());
      navigationService.navigatePushReplace(bankDetailRoute);

    } catch (e) {
      emit(const UpdateBankFailure(error: ''));
    }
  }
}
