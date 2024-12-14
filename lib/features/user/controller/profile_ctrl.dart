import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:amoora/common/models/reqs.dart';
import 'package:amoora/common/services/api_service.dart';
import 'package:amoora/features/auth/controller/auth_ctrl.dart';
import 'package:amoora/features/user/model/profile.dart';
import 'package:amoora/utils/router.dart';
import 'package:amoora/common/services/sharedpref_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileProvider = StateProvider<Profile?>((ref) => null);

class ProfileCtrl {
  final Ref ref;
  ProfileCtrl(this.ref);

  final String _profileKey = 'CURRENT_PROFILE';

  Future<void> initialize() async {
    log('Initialize Profile !');

    if (ref.read(authUserProvider) != null) {
      loadProfile();
    }

    ref.listen(authUserProvider, (previous, next) async {
      await fetchProfile();
    });
  }

  Future<void> fetchProfile() async {
    if (ref.read(authUserProvider) == null) {
      log("fetchProfile => authUserProvider = null", name: 'PROFILE-CTRL');
      saveProfile(null);
      return;
    }

    final reqs = Reqs(path: '/api/v1/user/profile');
    final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

    final profile = Profile.fromJson(state.value);

    saveProfile(profile);
  }

  Future uploadPhoto(File file) async {
    final reqs = Reqs(
      path: '/api/v1/user/upload_photo',
      filePath: file.path,
      fileKey: 'avatar',
    );
    final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

    final path = state.value['path'];

    ref.read(profileProvider.notifier).state = ref.read(profileProvider)?.copyWith(photo: path);
  }

  Future updateProfile(Map<String, dynamic> data) async {
    final reqs = Reqs(
      path: '/api/v1/user/update_profile',
      data: data,
    );
    final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

    if (state.hasError) return;

    updateCurrProfileLocal(state.value);
    ref.read(goRouterProvider).pop();
  }

  void updateCurrProfileLocal(Map<String, dynamic> data) {
    log('updateCurrProfileLocal => ${data.toString()}', name: 'PROFILE-CTRL');
    final field = data.keys.first;
    final json = ref.read(profileProvider)?.toJson();
    json![field] = data[field];

    log('$field => ${data[field]}', name: 'PROFILE-CTRL');

    final profile = Profile.fromJson(json);

    ref.read(profileProvider.notifier).state = profile;
  }

  void loadProfile() {
    final data = ref.read(sharedPrefProvider).getString(_profileKey);
    if (data != null) {
      final profile = Profile.fromJson(jsonDecode(data));
      ref.read(profileProvider.notifier).state = profile;
    }
  }

  void saveProfile(Profile? profile) {
    if (profile == null) {
      ref.read(profileProvider.notifier).state = null;
      ref.read(sharedPrefProvider).remove(_profileKey);
    } else {
      ref.read(profileProvider.notifier).state = profile;
      ref.read(sharedPrefProvider).setString(_profileKey, jsonEncode(profile.toJson()));
    }
  }

  // Future<void> getPicture() async {
  //   try {
  //     // ref.read(camerasProvider.notifier).state = await availableCameras();
  //     // await ref.read(goRouterProvider).push('/camera');
  //     File? file = await ref.read(goRouterProvider).push('/pick_image');
  //     log('Result File => ${file?.path}', name: 'PROFILE-CTRL');
  //     if (file == null) return;

  //     await uploadPhoto(file);
  //   } catch (e) {
  //     log(e.toString(), name: 'PROFILE-CTRL');
  //   }
  // }
}

final profileCtrlProvider = Provider(ProfileCtrl.new);
