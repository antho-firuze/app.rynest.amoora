import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  // FOR MAIN APPS
  @EnviedField(varName: 'ENV_CONFIG', obfuscate: true)
  static String envConfig = _Env.envConfig;
  @EnviedField(varName: 'LIVE_API_URL', obfuscate: true)
  static String liveApiUrl = _Env.liveApiUrl;
  @EnviedField(varName: 'LOCAL_API_URL', obfuscate: true)
  static String localApiUrl = _Env.localApiUrl;
  @EnviedField(varName: 'LIVE_SSE_URL', obfuscate: true)
  static String liveSseUrl = _Env.liveSseUrl;
  @EnviedField(varName: 'LOCAL_SSE_URL', obfuscate: true)
  static String localSseUrl = _Env.localSseUrl;
  @EnviedField(varName: 'QURAN_REPO_URL', obfuscate: true)
  static String quranRepoUrl = _Env.quranRepoUrl;
  @EnviedField(varName: 'JELAJAH_REPO_URL', obfuscate: true)
  static String jelajahRepoUrl = _Env.jelajahRepoUrl;
  @EnviedField(varName: 'PRAYER_TIME_REPO_URL', obfuscate: true)
  static String prayerTimeRepoUrl = _Env.prayerTimeRepoUrl;

  // PUSHER SERVER CONFIG
  @EnviedField(varName: 'PUSHER_URL', obfuscate: true)
  static String pusherUrl = _Env.pusherUrl;
  @EnviedField(varName: 'PUSHER_KEY', obfuscate: true)
  static String pusherKey = _Env.pusherKey;
  @EnviedField(varName: 'PUSHER_AUTH_URL', obfuscate: true)
  static String pusherAuthUrl = _Env.pusherAuthUrl;

  // WIREDASH
  @EnviedField(varName: 'WIREDASH_PID', obfuscate: false)
  static String wiredashPID = _Env.wiredashPID;
  @EnviedField(varName: 'WIREDASH_SECRET', obfuscate: true)
  static String wiredashSecret = _Env.wiredashSecret;

  // GOOGLE MAPS API
  @EnviedField(varName: 'GOOGLE_API_KEY', obfuscate: true)
  static String googleApiKey = _Env.googleApiKey;

  // SUPABASE
  @EnviedField(varName: 'SUPABASE_URL', obfuscate: true)
  static String supabaseUrl = _Env.supabaseUrl;
  @EnviedField(varName: 'SUPABASE_APIKEY', obfuscate: true)
  static String supabaseApiKey = _Env.supabaseApiKey;

  // TURN SERVER (https://www.metered.ca/)
  @EnviedField(varName: 'METERED_CA_APIKEY', obfuscate: true)
  static String meteredCaApiKey = _Env.meteredCaApiKey;

  // TURN SERVER (https://www.twilio.com/)
  @EnviedField(varName: 'TWILIO_USERNAME', obfuscate: true)
  static String twilioUsername = _Env.twilioUsername;
  @EnviedField(varName: 'TWILIO_PASSWORD', obfuscate: true)
  static String twilioPassword = _Env.twilioPassword;

  // TURN SERVER RYNEST (202.73.24.36)
  @EnviedField(varName: 'RYNEST_TURN_URL', obfuscate: true)
  static String rynesTurnUrl = _Env.rynesTurnUrl;
  @EnviedField(varName: 'RYNEST_USERNAME', obfuscate: true)
  static String rynestUsername = _Env.rynestUsername;
  @EnviedField(varName: 'RYNEST_PASSWORD', obfuscate: true)
  static String rynestPassword = _Env.rynestPassword;
}
