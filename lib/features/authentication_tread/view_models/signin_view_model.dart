import 'dart:async';

import 'package:final_project_tiktok_clone/features/authentication_tread/repos/authentication_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async => await _authRepo.signInWithEmailAndPassword(
        email: email,
        password: password,
      ),
    );
  }
}

final signInProvider = AsyncNotifierProvider<SignInViewModel, void>(
  () => SignInViewModel(),
);
