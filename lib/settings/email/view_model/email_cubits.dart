import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/navigation/navigation_service.dart';
import 'package:sarya/settings/email/view_model/email_states.dart';
import '../../../data/repository/authentication_repository/auth_repo.dart';
import '../../../helper/shared_prefs.dart';
import '../../../navigation/router_path.dart';
import '../model/update_email_request.dart';

class EmailCubits extends Cubit<EmailStates> {
  EmailCubits() : super(EmailInitial());

  Future updateEmail({required UpdateEmailRequest UpdateEmailRequest, required NavigationService navigationService}) async {
    try {
      emit(EmailLoading());

      final res = await AuthRepository.instance
          .update(body: UpdateEmailRequest.toJson());
      SharedPrefs pref = SharedPrefs();
      pref.saveUser(res);
      emit(EmailLoaded(signInResponse: res));
      navigationService.navigatePushReplace(settingRoute);

    } catch (e) {
      emit(const EmailFailure(error: ''));
    }
  }
}
