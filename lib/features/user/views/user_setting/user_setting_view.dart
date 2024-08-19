import 'package:amoora/common/controllers/package_info_controller.dart';
import 'package:amoora/common/views/about_view.dart';
import 'package:amoora/common/views/contact_us_view.dart';
import 'package:amoora/common/widgets/forms/group_list.dart';
import 'package:amoora/features/auth/controller/auth_controller.dart';
import 'package:amoora/features/auth/views/pwd_change_view.dart';
import 'package:amoora/features/user/controller/user_setting_controller.dart';
import 'package:amoora/features/user/views/profile/profile_edit_view.dart';
import 'package:amoora/features/user/views/user_setting/widgets/device_check_view.dart';
import 'package:amoora/localization/string_hardcoded.dart';
import 'package:amoora/utils/my_ui.dart';
import 'package:amoora/utils/page_utils.dart';
import 'package:flutter/material.dart';
import 'package:amoora/utils/ui_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:super_icons/super_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class UserSettingView extends ConsumerWidget {
  const UserSettingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: Text('Akun Saya'.hardcoded)),
        body: RefreshIndicator(
          onRefresh: () async {},
          child: ListView(
            shrinkWrap: true,
            children: [
              if (ref.watch(authUserProvider) != null) ...[
                GroupList(
                  children: [
                    ListTile(
                      leading: const Icon(SuperIcons.mg_location_2_fill),
                      title: const Text('Pantau lokasi saya').bold(),
                      onTap: () async => showModalBottomSheet(
                        context: context,
                        useSafeArea: true,
                        shape: const BeveledRectangleBorder(),
                        builder: (context) => Consumer(
                          builder: (context, ref, child) {
                            return MyUI(
                              isTransparent: true,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    20.height,
                                    const Text("Digunakan untuk monitoring Jama'ah "
                                        "khususnya jama'ah lansia agar tidak tersesat."),
                                    20.height,
                                    ListTile(
                                      title: const Text('Pantau saat aplikasi aktif').bold(),
                                      trailing: Switch(
                                        value: ref.watch(allowMonitorLocationProvider),
                                        onChanged: (_) => ref.read(allowMonitorLocationProvider.notifier).state =
                                            !ref.watch(allowMonitorLocationProvider),
                                      ),
                                    ),
                                    20.height,
                                    ListTile(
                                      title: const Text('Pantau hanya saat di Arab Saudi').bold(),
                                      subtitle: const Text('Monitoring tidak aktif di luar Arab Saudi').thin,
                                      trailing: Switch(
                                        value: ref.watch(allowMonitorInArabOnlyProvider),
                                        onChanged: (_) => ref.read(allowMonitorInArabOnlyProvider.notifier).state =
                                            !ref.watch(allowMonitorInArabOnlyProvider),
                                      ),
                                    ),
                                    20.height,
                                    // FieldList(
                                    //   caption: const Text('IP Broadcast'),
                                    //   value: Text(ref.read(wifiBroadcastProvider)).alignRight().bold(),
                                    // ),
                                    // 20.height,
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                GroupList(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.edit),
                      title: const Text('Rubah Data Akun').bold(),
                      onTap: () => context.goto(page: const ProfileEditView()),
                    ),
                  ],
                ),
                GroupList(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.password_outlined),
                      title: const Text('Rubah Kode Sandi').bold(),
                      onTap: () => context.goto(page: const PwdChangeView()),
                    ),
                  ],
                ),
              ],
              ListTile(
                leading: const Icon(SuperIcons.is_sun_fog_outline),
                title: Text('Tampilan'.hardcoded).bold(),
                subtitle: Text('Atur tampilan warna di Aplikasi'.hardcoded).tsLabelL(),
                onTap: () => showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
                  ),
                  builder: (context) {
                    return MyUI(
                      isTransparent: true,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: CloseButton(onPressed: () => context.pop()),
                              ),
                              const Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 12, 10, 0),
                                  child: Text(''),
                                ),
                              ),
                            ],
                          ),
                          RadioListTile(
                            title: const Text('Gunakan Pengaturan HP-mu').bold(),
                            subtitle: const Text('Sesuaikan tampilan dengan mengikuti pengaturan di HP.').tsLabelL(),
                            value: ThemeMode.system,
                            groupValue: ref.watch(themeModeProvider),
                            onChanged: (value) {
                              ref.read(themeModeProvider.notifier).state = value!;
                              context.pop();
                            },
                          ),
                          RadioListTile(
                            title: const Text('Light Mode').bold(),
                            subtitle: const Text(
                                    'Tampilan dengan warna cerah, cocok digunakan untuk siang hari atau tempat terang.')
                                .tsLabelL(),
                            value: ThemeMode.light,
                            groupValue: ref.watch(themeModeProvider),
                            onChanged: (value) {
                              ref.read(themeModeProvider.notifier).state = value!;
                              context.pop();
                            },
                          ),
                          RadioListTile(
                            title: const Text('Dark Mode').bold(),
                            subtitle: const Text(
                                    'Tampilan dengan warna gelap, cocok digunakan untuk malam hari atau tempat gelap.')
                                .tsLabelL(),
                            value: ThemeMode.dark,
                            groupValue: ref.watch(themeModeProvider),
                            onChanged: (value) {
                              ref.read(themeModeProvider.notifier).state = value!;
                              context.pop();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              ListTile(
                leading: const Icon(SuperIcons.is_devices_1_bold),
                title: Text('Device Check'.hardcoded),
                onTap: () => context.goto(page: const DeviceCheckView()),
              ),
              ListTile(
                leading: const Icon(SuperIcons.is_user_octagon_outline),
                title: Text('Hubungi Kami'.hardcoded),
                onTap: () => context.goto(page: const ContactUsView()),
              ),
              // ListTile(
              //   leading: const Icon(SuperIcons.is_book_outline),
              //   title: Text('Syarat & Ketentuan'.hardcoded),
              //   onTap: () => context.goto(page: const TermConditionView()),
              // ),
              ListTile(
                leading: const Icon(SuperIcons.is_shield_security_bold),
                title: Text('Kebijakan Privasi'.hardcoded),
                onTap: () async => await launchUrl(Uri.parse('https://amooratravel.com/kebijakan-privasi')),
                // onTap: () => context.goto(page: const PrivacyPolicyView()),
              ),
              ListTile(
                leading: const Icon(SuperIcons.is_information_outline),
                title: Text('Tentang Amoora'.hardcoded),
                onTap: () => context.goto(page: const AboutView()),
              ),
              if (ref.watch(authUserProvider) != null) ...[
                GroupList(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.exit_to_app),
                      title: const Text('Keluar Akun').bold(),
                      onTap: () => ref.read(authCtrlProvider).signOut(),
                    ),
                  ],
                ),
              ],
              20.height,
              Text("Versi: ${ref.watch(versionInfoProvider)}").center()
            ],
          ),
        ),
      ),
    );
  }
}
