import 'dart:io';

import 'package:amoora/common/views/media_picker/media_picker_view.dart';
import 'package:amoora/common/widgets/button/custom_circle_button.dart';
import 'package:amoora/common/widgets/entry_page/entry_page.dart';
import 'package:amoora/common/widgets/forms/group_list.dart';
import 'package:amoora/common/widgets/forms/three_line.dart';
import 'package:amoora/core/app_base.dart';
import 'package:amoora/features/auth/controller/auth_ctrl.dart';
import 'package:amoora/features/user/controller/profile_ctrl.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:amoora/common/services/snackbar_service.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:amoora/utils/uuid_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

class ProfileEditView extends ConsumerWidget {
  const ProfileEditView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final member = ref.watch(profileProvider);

    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: const Text('Ubah Profil')),
        body: ListView(
          shrinkWrap: true,
          children: [
            5.height,
            Align(
              alignment: Alignment.topCenter,
              child: CustomCircleButton(
                size: 110,
                child: member!.photo.isEmpty
                    ? Image.asset('assets/images/sample/avatar.png', fit: BoxFit.cover)
                    : Image.network('${AppBase.prodUrl}${member.photo}?id=${uuid.v4()}', fit: BoxFit.cover),
                onTap: () async {
                  File? file = await context.goto(page: const MediaPickerView());
                  if (file == null) return;

                  await ref.read(profileCtrlProvider).uploadPhoto(file);
                },
              ),
            ),
            10.height,
            Center(
              child: const Text('Ubah Foto Profil').link(
                isBold: true,
                onTap: () async {
                  File? file = await context.goto(page: const MediaPickerView());
                  if (file == null) return;

                  await ref.read(profileCtrlProvider).uploadPhoto(file);
                },
              ),
            ),
            10.height,
            GroupList(
              title: 'Info Profil',
              trailing: SuperIcons.is_info_circle_outline,
              onTap: () => SnackBarService.show(message: 'Info Profil'),
              children: [
                ThreeLine(
                  caption: 'Nama Panggilan',
                  value: member.name,
                  trailing: SuperIcons.is_arrow_circle_right_outline,
                  onTap: () {
                    context.goto(
                      page: EntryPage(
                        title: 'Ubah Nama Panggilan',
                        hint: 'Tulis nama panggilan',
                        description: 'Gunakan nama panggilan sehari-hari agar memudahkan identifikasi',
                        initialValue: member.name,
                        type: Type.name,
                        onSubmit: (val) async => await ref.read(profileCtrlProvider).updateProfile({"name": val}),
                      ),
                    );
                  },
                ),
                20.height,
                ThreeLine(
                  caption: 'Username',
                  value: member.identifier,
                  trailing: SuperIcons.is_arrow_circle_right_outline,
                ),
              ],
            ),
            30.height,
            GroupList(
              title: 'Info Pribadi',
              trailing: SuperIcons.is_info_circle_outline,
              onTap: () => SnackBarService.show(message: 'Info Pribadi'),
              children: [
                ThreeLine(
                  caption: 'User ID',
                  value: member.userId.toString(),
                  trailing: SuperIcons.is_copy_outline,
                ),
                20.height,
                ThreeLine(
                  caption: 'Member ID',
                  value: member.memberId.toString(),
                  trailing: SuperIcons.is_copy_outline,
                ),
                20.height,
                ThreeLine(
                  caption: 'Nama Lengkap',
                  value: member.fullName,
                  trailing: SuperIcons.is_arrow_circle_right_outline,
                  onTap: () {
                    context.goto(
                      page: EntryPage(
                        title: 'Ubah Nama Lengkap',
                        hint: 'Tulis nama lengkap',
                        description:
                            'Gunakan nama asli untuk memudahkan verifikasi. Nama ini akan tampil di beberapa halaman.',
                        initialValue: member.fullName,
                        type: Type.name,
                        onSubmit: (val) async => await ref.read(profileCtrlProvider).updateProfile({"full_name": val}),
                      ),
                    );
                  },
                ),
                20.height,
                ThreeLine(
                  caption: 'Email',
                  value: member.email,
                  trailing: SuperIcons.is_arrow_circle_right_outline,
                  onTap: () {
                    context.goto(
                      page: EntryPage(
                        title: 'Ubah alamat email',
                        hint: 'Alamat email => Contoh: user@gmail.com',
                        description: 'Gunakan alamat email yang aktif untuk memudahkan verifikasi.',
                        initialValue: member.email,
                        type: Type.email,
                        onSubmit: (val) async => await ref.read(profileCtrlProvider).updateProfile({"email": val}),
                      ),
                    );
                  },
                ),
                20.height,
                ThreeLine(
                  caption: 'Nomor HP',
                  value: member.phone,
                  trailing: SuperIcons.is_arrow_circle_right_outline,
                  onTap: () {
                    context.goto(
                      page: EntryPage(
                        title: 'Ubah Nomor HP',
                        hint: 'Nomor HP => Contoh: 62812 1234 000',
                        description: 'Gunakan nomor hp yang aktif untuk memudahkan verifikasi.',
                        initialValue: member.phone,
                        type: Type.phone,
                        onSubmit: (val) async => await ref.read(profileCtrlProvider).updateProfile({"phone": val}),
                      ),
                    );
                  },
                ),
                20.height,
                ThreeLine(
                  caption: 'Alamat',
                  value: member.address,
                  trailing: SuperIcons.is_arrow_circle_right_outline,
                  onTap: () {
                    context.goto(
                      page: EntryPage(
                        title: 'Ubah Alamat Tinggal',
                        hint: 'Tulis alamat lengkap',
                        description: 'Masukkan alamat sesuai dengan KTP',
                        initialValue: member.address,
                        type: Type.address,
                        allowEmpty: true,
                        onSubmit: (val) async => await ref.read(profileCtrlProvider).updateProfile({"address": val}),
                      ),
                    );
                  },
                ),
                20.height,
                ThreeLine(
                  caption: 'Nomor Pasport',
                  value: member.passportNo ?? '-',
                  trailing: SuperIcons.is_arrow_circle_right_outline,
                  onTap: () {
                    context.goto(
                      page: EntryPage(
                        title: 'Ubah Nomor Pasport',
                        hint: 'Tulis nomor pasport',
                        // description: '',
                        initialValue: member.passportNo ?? '',
                        type: Type.text,
                        onSubmit: (val) async =>
                            await ref.read(profileCtrlProvider).updateProfile({"passport_no": val}),
                      ),
                    );
                  },
                ),
              ],
            ),
            30.height,
            GroupList(
              children: [
                20.height,
                Center(
                  child: const Text('Tutup Akun').link(
                    onTap: () async => await ref.read(authCtrlProvider).unregister(),
                  ),
                ),
                20.height,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
