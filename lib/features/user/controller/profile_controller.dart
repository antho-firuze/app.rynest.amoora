import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:amoora/features/auth/controller/auth_controller.dart';
import 'package:amoora/features/user/model/profile.dart';
import 'package:amoora/features/user/service/user_service.dart';
import 'package:amoora/utils/router.dart';
import 'package:amoora/common/services/sharedpref_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileProvider = StateProvider<Profile?>((ref) => null);

class ProfileCtrl {
  final Ref ref;
  ProfileCtrl(this.ref);

  final String profileKey = 'CURRENT_PROFILE';

  Future<void> initialize() async {
    log('Initialize Profile !');
    if (ref.read(authUserProvider) != null) {
      Profile? profile = loadProfile();
      if (profile == null) {
        await getProfile();
        return;
      }
      ref.read(profileProvider.notifier).state = profile;
    }

    ref.listen(authUserProvider, (previous, next) async {
      if (next != null) {
        if (ref.read(profileProvider) == null) {
          await getProfile();
        }
      } else {
        saveProfile(null);
      }
    });
  }

  Future<void> getProfile() async {
    final state = await AsyncValue.guard(() async => await ref.read(userServiceProvider).getProfile());

    final profile = Profile.fromJson(state.value);

    saveProfile(profile);
  }

  Future uploadPhoto(File file) async {
    final data = {
      "avatar": await MultipartFile.fromFile(file.path),
    };
    final state = await AsyncValue.guard(() async => await ref.read(userServiceProvider).uploadPhoto(data: data));

    final path = state.value['path'];

    ref.read(profileProvider.notifier).state = ref.read(profileProvider)?.copyWith(photo: path);
  }

  Future updateProfile(Map<String, dynamic> data) async {
    final state = await AsyncValue.guard(() async => await ref.read(userServiceProvider).updateProfile(data: data));

    if (state.hasError) return;

    updateCurrProfileLocal(state.value);
    ref.read(goRouterProvider).pop();
  }

  void updateCurrProfileLocal(Map<String, dynamic> data) {
    log('updateCurrProfileLocal => ${data.toString()}');
    final field = data.keys.first;
    final json = ref.read(profileProvider)?.toJson();
    json![field] = data[field];

    log('$field => ${data[field]}');

    final profile = Profile.fromJson(json);

    ref.read(profileProvider.notifier).state = profile;
  }

  Profile? loadProfile() {
    final data = ref.read(sharedPrefProvider).getString(profileKey);
    return data != null ? Profile.fromJson(jsonDecode(data)) : null;
  }

  void saveProfile(Profile? profile) {
    if (profile == null) {
      ref.read(profileProvider.notifier).state = null;
      ref.read(sharedPrefProvider).remove(profileKey);
    } else {
      ref.read(profileProvider.notifier).state = profile;
      ref.read(sharedPrefProvider).setString(profileKey, jsonEncode(profile.toJson()));
    }
  }

  // Future<void> getPicture() async {
  //   try {
  //     // ref.read(camerasProvider.notifier).state = await availableCameras();
  //     // await ref.read(goRouterProvider).push('/camera');
  //     File? file = await ref.read(goRouterProvider).push('/pick_image');
  //     log('Result File => ${file?.path}');
  //     if (file == null) return;

  //     await uploadPhoto(file);
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
}

final profileCtrlProvider = Provider(ProfileCtrl.new);
