import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarya/settings/email/view_model/email_states.dart';
import '../../../data/repository/authentication_repository/auth_repo.dart';
import '../model/update_email_request.dart';

class EmailCubits extends Cubit<EmailStates> {
  EmailCubits() : super(EmailInitial());

  Future updateEmail({required UpdateEmailRequest UpdateEmailRequest}) async {
    try {
      emit(EmailLoading());

      final res = await AuthRepository.instance
          .update(body: UpdateEmailRequest.toJson());

      emit(EmailLoaded(signInResponse: res));
    } catch (e) {
      emit(const EmailFailure(error: ''));
    }
  }
}
