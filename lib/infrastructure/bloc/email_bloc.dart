import 'dart:async';
import 'package:cv_daniel/infrastructure/api/email_repository.dart';
import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'email_event.dart';

part 'email_state.dart';

part 'email_bloc.freezed.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  final EmailRepository _emailRepository;

  EmailState get initialState => const EmailState.initial();

  EmailBloc(this._emailRepository) : super(const EmailState.initial());

  Stream<EmailState> mapEventToState(
    EmailEvent event,
  ) async* {
    yield const EmailState.sendingEmail();

    final response = await _emailRepository.sendEmail(
      name: event.name,
      email: event.email,
      subject: event.subject,
      message: event.message,
    );

    yield* response.fold(
      (failure) async* {
        yield const EmailState.failure();
      },
      (data) async* {
        yield const EmailState.emailSentSuccessFully();
      },
    );
  }
}
