// import 'dart:collection';
// import 'dart:math' as math;
// import 'dart:core';

// class PrayerTime {
//   // ---------------------- Global Variables --------------------
//   late int _calcMethod; // caculation method
//   late int _asrJuristic; // Juristic method for Asr
//   late int _dhuhrMinutes; // minutes after mid-day for Dhuhr
//   late int _adjustHighLats; // adjusting method for higher latitudes
//   late int _timeFormat; // time format
//   late double _lat; // latitude
//   late double _lng; // longitude
//   late double _timeZone; // time-zone
//   late double _jDate; // Julian date

//   // ------------------------------------------------------------
//   // Calculation Methods
//   late int _jafri; // Ithna Ashari
//   late int _karachi; // University of Islamic Sciences, Karachi
//   late int _iSNA; // Islamic Society of North America (ISNA)
//   late int _mWL; // Muslim World League (MWL)
//   late int _makkah; // Umm al-Qura, Makkah
//   late int _egypt; // Egyptian General Authority of Survey
//   late int _custom; // Custom Setting
//   late int _tehran; // Institute of Geophysics, University of Tehran

//   // Juristic Methods
//   late int _shaffi; // Shafii (standard)
//   late int _hanafi; // Hanafi

//   // Adjusting Methods for Higher Latitudes
//   late int _none; // No adjustment
//   late int _midNight; // middle of night
//   late int _oneSeventh; // 1/7th of night
//   late int _angleBased; // angle/60th of night

//   // Time Formats
//   late int _time24; // 24-hour format
//   late int _time12; // 12-hour format
//   late int _time12Ns; // 12-hour format with no suffix
//   late int _floating; // floating point number

//   // Time Names
//   late List<String> _timeNames;
//   late String _invalidTime; // The string used for invalid times

//   // --------------------- Technical Settings --------------------
//   late int _numIterations;

//   // ------------------- Calc Method Parameters --------------------
//   late Map<int, List<double>> _methodParams;

//   /*
//      * this.methodParams[methodNum] = new Array(fa, ms, mv, is, iv);
//      *
//      * fa : fajr angle ms : maghrib selector (0 = angle; 1 = minutes after
//      * sunset) mv : maghrib parameter value (in angle or minutes) is : isha
//      * selector (0 = angle; 1 = minutes after maghrib) iv : isha parameter value
//      * (in angle or minutes)
//      */

//   late List<double> _prayerTimesCurrent;
//   late List<int> _offsets;

//   PrayerTime() {
//     setCalcMethod(0);
//     setAsrJuristic(0);
//     setDhuhrMinutes(0);
//     setAdjustHighLats(1);
//     setTimeFormat(0);

//     // Calculation Methods
//     setJafari(0); // Ithna Ashari
//     setKarachi(1); // University of Islamic Sciences, Karachi
//     setISNA(2); // Islamic Society of North America (ISNA)
//     setMWL(3); // Muslim World League (MWL)
//     setMakkah(4); // Umm al-Qura, Makkah
//     setEgypt(5); // Egyptian General Authority of Survey
//     setTehran(6); // Institute of Geophysics, University of Tehran
//     setCustom(7); // Custom Setting

//     // Juristic Methods
//     setShafii(0); // Shafii (standard)
//     setHanafi(1); // Hanafi

//     // Adjusting Methods for Higher Latitudes
//     setNone(0); // No adjustment
//     setMidNight(1); // middle of night
//     setOneSeventh(2); // 1/7th of night
//     setAngleBased(3); // angle/60th of night

//     // Time Formats
//     setTime24(0); // 24-hour format
//     setTime12(1); // 12-hour format
//     setTime12NS(2); // 12-hour format with no suffix
//     setFloating(3); // floating point number

//     // Time Names
//     _timeNames = [];
//     _timeNames.add("Fajr");
//     _timeNames.add("Sunrise");
//     _timeNames.add("Dhuhr");
//     _timeNames.add("Asr");
//     _timeNames.add("Sunset");
//     _timeNames.add("Maghrib");
//     _timeNames.add("Isha");

//     _invalidTime = "-----"; // The string used for invalid times

//     // --------------------- Technical Settings --------------------

//     setNumIterations(1); // number of iterations needed to compute
//     // times

//     // ------------------- Calc Method Parameters --------------------

//     // Tuning offsets {fajr, sunrise, dhuhr, asr, sunset, maghrib, isha}
//     _offsets = [];
//     _offsets[0] = 0;
//     _offsets[1] = 0;
//     _offsets[2] = 0;
//     _offsets[3] = 0;
//     _offsets[4] = 0;
//     _offsets[5] = 0;
//     _offsets[6] = 0;

//     /*
//          *
//          * fa : fajr angle ms : maghrib selector (0 = angle; 1 = minutes after
//          * sunset) mv : maghrib parameter value (in angle or minutes) is : isha
//          * selector (0 = angle; 1 = minutes after maghrib) iv : isha parameter
//          * value (in angle or minutes)
//          */
//     _methodParams = HashMap<int, List<double>>();

//     // Jafari
//     List<double> _jValues = [16, 0, 4, 0, 14];
//     _methodParams[getJafari()] = _jValues;

//     // Karachi
//     List<double> _kValues = [18, 1, 0, 0, 18];
//     _methodParams[getKarachi()] = _kValues;

//     // ISNA
//     List<double> _iValues = [15, 1, 0, 0, 15];
//     _methodParams[getISNA()] = _iValues;

//     // MWL
//     List<double> _mwValues = [18, 1, 0, 0, 17];
//     _methodParams[getMWL()] = _mwValues;

//     // Makkah
//     List<double> _mkValues = [18.5, 1, 0, 1, 90];
//     _methodParams[getMakkah()] = _mkValues;

//     // Egypt
//     List<double> _eValues = [19.5, 1, 0, 0, 17.5];
//     _methodParams[getEgypt()] = _eValues;

//     // Tehran
//     List<double> _tValues = [17.7, 0, 4.5, 0, 14];
//     _methodParams[getTehran()] = _tValues;

//     // Custom
//     List<double> _cValues = [18, 1, 0, 0, 17];
//     _methodParams[getCustom()] = _cValues;
//   }

//   // ---------------------- Trigonometric Functions -----------------------
//   // range reduce angle in degrees.

//   double _fixAngle(double a) {
//     a = a - (360 * ((a / 360.0).floor()));
//     a = a < 0 ? (a + 360) : a;

//     return a;
//   }

//   //range reduce hours to 0..23

//   double _fixHour(double a) {
//     a = a - 24.0 * (a / 24.0).floor();
//     a = a < 0 ? (a + 24) : a;
//     return a;
//   }

//   // radian to degree
//   double _radiansToDegrees(double alpha) {
//     return ((alpha * 180.0) / math.pi);
//   }

//   // deree to radian
//   double _degreesToRadians(double alpha) {
//     return ((alpha * math.pi) / 180.0);
//   }

//   // degree sin
//   double _dsin(double d) {
//     return (math.sin(_degreesToRadians(d)));
//   }

//   // degree cos
//   double _dcos(double d) {
//     return (math.cos(_degreesToRadians(d)));
//   }

//   // degree tan
//   double _dtan(double d) {
//     return (math.tan(_degreesToRadians(d)));
//   }

//   // degree arcsin
//   double _darcsin(double x) {
//     double val = math.asin(x);
//     return _radiansToDegrees(val);
//   }

//   // degree arccos
//   double darccos(double x) {
//     double val = math.acos(x);
//     return _radiansToDegrees(val);
//   }

//   // degree arctan
//   double _darctan(double x) {
//     double val = math.atan(x);
//     return _radiansToDegrees(val);
//   }

//   // degree arctan2
//   double _darctan2(double y, double x) {
//     double val = math.atan2(y, x);
//     return _radiansToDegrees(val);
//   }

//   // degree arccot
//   double darccot(double x) {
//     double val = math.atan2(1.0, x);
//     return _radiansToDegrees(val);
//   }

//   // ---------------------- Time-Zone Functions -----------------------
//   // compute local time-zone for a specific date
// /*   getTimeZone1() {
//     TimeZone timez = TimeZone.;
//     double hoursDiff = (timez.getRawOffset() / 1000.0) / 3600;
//     return hoursDiff;
//   }

//   // compute base time-zone of the system
//    getBaseTimeZone() {
//     TimeZone timez = TimeZone.getDefault();
//     double hoursDiff = (timez.getRawOffset() / 1000.0) / 3600;
//     return hoursDiff;

//   }

//   // detect daylight saving in a given date
//    detectDaylightSaving() {
//     TimeZone timez = TimeZone.UTC;
//     double hoursDiff = timez.getDSTSavings();
//     return hoursDiff;
//   }*/

//   // ---------------------- Julian Date Functions -----------------------
//   // calculate julian date from a calendar date
//   julianDate(int year, int month, int day) {
//     if (month <= 2) {
//       year -= 1;
//       month += 12;
//     }
//     double A = (year / 100.0).floorToDouble();

//     double B = 2 - A + (A / 4.0).floor();

//     double JD = (365.25 * (year + 4716)).floor() +
//         (30.6001 * (month + 1)).floor() +
//         day +
//         B -
//         1524.5;

//     return JD;
//   }

//   /*// convert a calendar date to julian date (second method)
//    calcJD(int year, int month, int day) {
//     double J1970 = 2440588.0;
//     Date date = new Date(year, month - 1, day);

//     double ms = date.getTime(); // # of milliseconds since midnight Jan 1,
//     // 1970
//     double days = (ms / (1000.0 * 60.0 * 60.0 * 24.0)).floorToDouble();
//     return J1970 + days - 0.5;

//   }*/

//   //
//   // ---------------------- Calculation Functions -----------------------

//   // ---------------------- Calculation Functions -----------------------
//   // References:
//   // http://www.ummah.net/astronomy/saltime
//   // http://aa.usno.navy.mil/faq/docs/SunApprox.html
//   // compute declination angle of sun and equation of time
//   List<double> sunPosition(double jd) {
//     double D = jd - 2451545;
//     double g = _fixAngle(357.529 + 0.98560028 * D);
//     double q = _fixAngle(280.459 + 0.98564736 * D);
//     double L = _fixAngle(q + (1.915 * _dsin(g)) + (0.020 * _dsin(2 * g)));

//     // double R = 1.00014 - 0.01671 * [self dcos:g] - 0.00014 * [self dcos:
//     // (2*g)];
//     double e = 23.439 - (0.00000036 * D);
//     double d = _darcsin(_dsin(e) * _dsin(L));
//     double RA = (_darctan2((_dcos(e) * _dsin(L)), (_dcos(L)))) / 15.0;
//     RA = _fixHour(RA);
//     double EqT = q / 15.0 - RA;
//     List<double> sPosition = [];
//     sPosition[0] = d;
//     sPosition[1] = EqT;

//     return sPosition;
//   }

//   // compute equation of time

//   double equationOfTime(double jd) {
//     double eq = sunPosition(jd)[1];
//     return eq;
//   }

//   // compute declination angle of sun
//   double sunDeclination(double jd) {
//     double d = sunPosition(jd)[0];
//     return d;
//   }

//   // compute mid-day (Dhuhr, Zawal) time
//   double computeMidDay(double t) {
//     double T = equationOfTime(getJDate() + t);
//     double Z = _fixHour(12 - T);
//     return Z;
//   }

//   // compute time for a given angle G
//   double computeTime(double G, double t) {
//     double D = sunDeclination(getJDate() + t);
//     double Z = computeMidDay(t);
//     double Beg = -_dsin(G) - _dsin(D) * _dsin(getLat());
//     double Mid = _dcos(D) * _dcos(getLat());
//     double V = darccos(Beg / Mid) / 15.0;

//     return Z + (G > 90 ? -V : V);
//   }

//   // compute the time of Asr
//   // Shafii: step=1, Hanafi: step=2
//   double computeAsr(double step, double t) {
//     double D = sunDeclination(getJDate() + t);
//     double G = -darccot(step + _dtan((getLat() - D).abs()));
//     return computeTime(G, t);
//   }

//   // ---------------------- Misc Functions -----------------------
//   // compute the difference between two times
//   double timeDiff(double time1, double time2) {
//     return _fixHour(time2 - time1);
//   }

//   // -------------------- Interface Functions --------------------
//   // return prayer times for a given date
//   List<String> getDatePrayerTimes(int year, int month, int day, double latitude,
//       double longitude, double tZone) {
//     setLat(latitude);
//     setLng(longitude);
//     setTimeZone(tZone);
//     setJDate(julianDate(year, month, day));
//     double lonDiff = longitude / (15.0 * 24.0);
//     setJDate(getJDate() - lonDiff);
//     return computeDayTimes();
//   }

//   // return prayer times for a given date
//   List<String> getPrayerTimes(
//       DateTime date, double latitude, double longitude, double tZone) {
//     int year = date.year;
//     int month = date.month;
//     int day = date.day;

//     return getDatePrayerTimes(year, month, day, latitude, longitude, tZone);
//   }

//   // set custom values for calculation parameters
//   void setCustomParams(List<double> params) {
//     for (int i = 0; i < 5; i++) {
//       if (params[i] == null) {
//         params[i] = _methodParams[_calcMethod]![i];
//         _methodParams[getCustom()] = params;
//       } else {
//         _methodParams[getCustom()]?[i] = params[i];
//       }
//     }
//     setCalcMethod(getCustom());
//   }

//   // set the angle for calculating Fajr
//   void setFajrAngle(double angle) {
//     List<double> params = [angle, -1, -1, -1, -1];
//     setCustomParams(params);
//   }

//   // set the angle for calculating Maghrib
//   void setMaghribAngle(double angle) {
//     List<double> params = [-1, 0, angle, -1, -1];
//     setCustomParams(params);
//   }

//   // set the angle for calculating Isha
//   void setIshaAngle(double angle) {
//     List<double> params = [-1, -1, -1, 0, angle];
//     setCustomParams(params);
//   }

//   // set the minutes after Sunset for calculating Maghrib
//   void setMaghribMinutes(double minutes) {
//     List<double> params = [-1, 1, minutes, -1, -1];
//     setCustomParams(params);
//   }

//   // set the minutes after Maghrib for calculating Isha
//   void setIshaMinutes(double minutes) {
//     List<double> params = [-1, -1, -1, 1, minutes];
//     setCustomParams(params);
//   }

//   // convert double hours to 24h format
//   String floatToTime24(double time) {
//     String result;

//     if (time == double.nan) {
//       return _invalidTime;
//     }

//     time = _fixHour(time + 0.5 / 60.0); // add 0.5 minutes to round
//     int hours = time.floor();
//     double minutes = ((time - hours) * 60.0).floorToDouble();

//     if ((hours >= 0 && hours <= 9) && (minutes >= 0 && minutes <= 9)) {
//       result = "0" + hours.toString() + ":0" + (minutes).round().toString();
//     } else if ((hours >= 0 && hours <= 9)) {
//       result = "0" + hours.toString() + ":" + (minutes).round().toString();
//     } else if ((minutes >= 0 && minutes <= 9)) {
//       result = hours.toString() + ":0" + (minutes).round().toString();
//     } else {
//       result = hours.toString() + ":" + (minutes).round().toString();
//     }
//     return result;
//   }

//   // convert double hours to 12h format
//   String floatToTime12(double time, bool noSuffix) {
//     if (time == double.nan) {
//       return _invalidTime;
//     }

//     time = _fixHour(time + 0.5 / 60); // add 0.5 minutes to round
//     int hours = (time).floor();
//     double minutes = ((time - hours) * 60).floorToDouble();
//     String suffix, result;
//     if (hours >= 12) {
//       suffix = "PM";
//     } else {
//       suffix = "AM";
//     }
//     hours = ((((hours + 12) - 1) % (12)) + 1);
//     /*hours = (hours + 12) - 1;
//         int hrs = (int) hours % 12;
//         hrs += 1;*/
//     if (noSuffix == false) {
//       if ((hours >= 0 && hours <= 9) && (minutes >= 0 && minutes <= 9)) {
//         result = "0" +
//             hours.toString() +
//             ":0" +
//             (minutes).round().toString() +
//             " " +
//             suffix;
//       } else if ((hours >= 0 && hours <= 9)) {
//         result = "0" +
//             hours.toString() +
//             ":" +
//             (minutes).round().toString() +
//             " " +
//             suffix;
//       } else if ((minutes >= 0 && minutes <= 9)) {
//         result = hours.toString() +
//             ":0" +
//             (minutes).round().toString() +
//             " " +
//             suffix;
//       } else {
//         result = hours.toString() +
//             ":" +
//             (minutes).round().toString() +
//             " " +
//             suffix;
//       }
//     } else {
//       if ((hours >= 0 && hours <= 9) && (minutes >= 0 && minutes <= 9)) {
//         result = "0" + hours.toString() + ":0" + (minutes).round().toString();
//       } else if ((hours >= 0 && hours <= 9)) {
//         result = "0" + hours.toString() + ":" + (minutes).round().toString();
//       } else if ((minutes >= 0 && minutes <= 9)) {
//         result = hours.toString() + ":0" + (minutes).round().toString();
//       } else {
//         result = hours.toString() + ":" + (minutes).round().toString();
//       }
//     }
//     return result;
//   }

//   // convert double hours to 12h format with no suffix
//   String floatToTime12NS(double time) {
//     return floatToTime12(time, true);
//   }

//   // ---------------------- Compute Prayer Times -----------------------
//   // compute prayer times at given julian date
//   List<double> computeTimes(List<double> times) {
//     List<double> t = dayPortion(times);

//     double Fajr =
//         computeTime(180 - _methodParams[getCalcMethod()]![0], t[0]);

//     double Sunrise = computeTime(180 - 0.833, t[1]);

//     double Dhuhr = computeMidDay(t[2]);
//     double Asr = computeAsr((1 + getAsrJuristic()).toDouble(), t[3]);
//     double Sunset = computeTime(0.833, t[4]);

//     double Maghrib =
//         computeTime(_methodParams[getCalcMethod()]![2], t[5]);
//     double Isha =
//         computeTime(_methodParams[getCalcMethod()]![4], t[6]);

//     List<double> CTimes = [Fajr, Sunrise, Dhuhr, Asr, Sunset, Maghrib, Isha];

//     return CTimes;
//   }

//   // compute prayer times at given julian date
//   List<String> computeDayTimes() {
//     List<double> times = [5, 6, 12, 13, 18, 18, 18]; // default times

//     for (int i = 1; i <= getNumIterations(); i++) {
//       times = computeTimes(times);
//     }

//     times = adjustTimes(times);
//     times = tuneTimes(times);

//     return adjustTimesFormat(times);
//   }

//   // adjust times in a prayer time array
//   List<double> adjustTimes(List<double> times) {
//     for (int i = 0; i < times.length; i++) {
//       times[i] += getTimeZone() - getLng() / 15;
//     }

//     times[2] += getDhuhrMinutes() / 60; // Dhuhr

//     if (_methodParams[getCalcMethod()]![1] == 1) {
//       times[5] = times[4] + _methodParams[getCalcMethod()]![2] / 60;
//     }
//     if (_methodParams[getCalcMethod()]![3] == 1) {
//       times[6] = times[5] + _methodParams[getCalcMethod()]![4] / 60;
//     }

//     if (getAdjustHighLats() != getNone()) {
//       times = adjustHighLatTimes(times);
//     }

//     return times;
//   }

//   // convert times array to given time format
//   List<String> adjustTimesFormat(List<double> times) {
//     List<String> result = [];
//     if (getTimeFormat() == getFloating()) {
//       for (double time in times) {
//         result.add(time.toString());
//       }
//       return result;
//     }

//     for (int i = 0; i < 7; i++) {
//       if (getTimeFormat() == getTime12()) {
//         result.add(floatToTime12(times[i], false));
//       } else if (getTimeFormat() == getTime12NS()) {
//         result.add(floatToTime12(times[i], true));
//       } else {
//         result.add(floatToTime24(times[i]));
//       }
//     }
//     return result;
//   }

//   // adjust Fajr, Isha and Maghrib for locations in higher latitudes
//   List<double> adjustHighLatTimes(List<double> times) {
//     double nightTime = timeDiff(times[4], times[1]); // sunset to sunrise

//     // Adjust Fajr
//     double FajrDiff =
//         nightPortion(_methodParams[getCalcMethod()]![0]) * nightTime;

//     if (times[0] == double.nan || timeDiff(times[0], times[1]) > FajrDiff) {
//       times[0] = times[1] - FajrDiff;
//     }

//     // Adjust Isha
//     double IshaAngle = (_methodParams[getCalcMethod()]![3] == 0)
//         ? _methodParams[getCalcMethod()]![4]
//         : 18;
//     double IshaDiff = nightPortion(IshaAngle) * nightTime;

//     if (times[6] == double.nan ||
//         timeDiff(times[4], times[6]) > IshaDiff) {
//       times[6] = times[4] + IshaDiff;
//     }

//     // Adjust Maghrib
//     double MaghribAngle = (_methodParams[getCalcMethod()]![1] == 0)
//         ? _methodParams[(getCalcMethod())]![2]
//         : 4;
//     double MaghribDiff = nightPortion(MaghribAngle) * nightTime;

//     if (times[5] == double.nan ||
//         timeDiff(times[4], times[5]) > MaghribDiff) {
//       times[5] = times[4] + MaghribDiff;
//     }

//     return times;
//   }

//   // the night portion used for adjusting times in higher latitudes
//   double nightPortion(double angle) {
//     double calc = 0;

//     if (_adjustHighLats == _angleBased)
//       calc = (angle) / 60.0;
//     else if (_adjustHighLats == _midNight)
//       calc = 0.5;
//     else if (_adjustHighLats == _oneSeventh) calc = 0.14286;

//     return calc;
//   }

//   // convert hours to day portions
//   List<double> dayPortion(List<double> times) {
//     for (int i = 0; i < 7; i++) {
//       times[i] /= 24;
//     }
//     return times;
//   }

//   // Tune timings for adjustments
//   // Set time offsets
//   void tune(List<int> offsetTimes) {
//     for (int i = 0; i < offsetTimes.length; i++) {
//       // offsetTimes length
//       // should be 7 in order
//       // of Fajr, Sunrise,
//       // Dhuhr, Asr, Sunset,
//       // Maghrib, Isha
//       _offsets[i] = offsetTimes[i];
//     }
//   }

//   List<double> tuneTimes(List<double> times) {
//     for (int i = 0; i < times.length; i++) {
//       times[i] = times[i] + _offsets[i] / 60.0;
//     }
//     return times;
//   }

//   int getCalcMethod() {
//     return _calcMethod;
//   }

//   void setCalcMethod(int calcMethod) {
//     _calcMethod = calcMethod;
//   }

//   int getAsrJuristic() {
//     return _asrJuristic;
//   }

//   void setAsrJuristic(int asrJuristic) {
//     _asrJuristic = asrJuristic;
//   }

//   int getDhuhrMinutes() {
//     return _dhuhrMinutes;
//   }

//   void setDhuhrMinutes(int dhuhrMinutes) {
//     _dhuhrMinutes = dhuhrMinutes;
//   }

//   int getAdjustHighLats() {
//     return _adjustHighLats;
//   }

//   void setAdjustHighLats(int adjustHighLats) {
//     _adjustHighLats = adjustHighLats;
//   }

//   int getTimeFormat() {
//     return _timeFormat;
//   }

//   setTimeFormat(int timeFormat) {
//     _timeFormat = timeFormat;
//   }

//   double getLat() {
//     return _lat;
//   }

//   void setLat(double lat) {
//     _lat = lat;
//   }

//   double getLng() {
//     return _lng;
//   }

//   void setLng(double lng) {
//     _lng = lng;
//   }

//   double getTimeZone() {
//     return _timeZone;
//   }

//   void setTimeZone(double timeZone) {
//     _timeZone = timeZone;
//   }

//   double getJDate() {
//     return _jDate;
//   }

//   void setJDate(double jDate) {
//     _jDate = jDate;
//   }

//   int getJafari() {
//     return _jafri;
//   }

//   void setJafari(int jafari) {
//     _jafri = jafari;
//   }

//   int getKarachi() {
//     return _karachi;
//   }

//   void setKarachi(int karachi) {
//     _karachi = karachi;
//   }

//   int getISNA() {
//     return _iSNA;
//   }

//   void setISNA(int iSNA) {
//     _iSNA = iSNA;
//   }

//   int getMWL() {
//     return _mWL;
//   }

//   void setMWL(int mWL) {
//     _mWL = mWL;
//   }

//   int getMakkah() {
//     return _makkah;
//   }

//   void setMakkah(int makkah) {
//     _makkah = makkah;
//   }

//   int getEgypt() {
//     return _egypt;
//   }

//   void setEgypt(int egypt) {
//     _egypt = egypt;
//   }

//   int getCustom() {
//     return _custom;
//   }

//   void setCustom(int custom) {
//     _custom = custom;
//   }

//   int getTehran() {
//     return _tehran;
//   }

//   void setTehran(int tehran) {
//     _tehran = tehran;
//   }

//   int getShafii() {
//     return _shaffi;
//   }

//   void setShafii(int shafii) {
//     _shaffi = shafii;
//   }

//   int getHanafi() {
//     return _hanafi;
//   }

//   void setHanafi(int hanafi) {
//     _hanafi = hanafi;
//   }

//   int getNone() {
//     return _none;
//   }

//   void setNone(int none) {
//     _none = none;
//   }

//   int getMidNight() {
//     return _midNight;
//   }

//   void setMidNight(int midNight) {
//     _midNight = midNight;
//   }

//   int getOneSeventh() {
//     return _oneSeventh;
//   }

//   void setOneSeventh(int oneSeventh) {
//     _oneSeventh = oneSeventh;
//   }

//   int getAngleBased() {
//     return _angleBased;
//   }

//   void setAngleBased(int angleBased) {
//     _angleBased = angleBased;
//   }

//   int getTime24() {
//     return _time24;
//   }

//   void setTime24(int time24) {
//     _time24 = time24;
//   }

//   int getTime12() {
//     return _time12;
//   }

//   void setTime12(int time12) {
//     _time12 = time12;
//   }

//   int getTime12NS() {
//     return _time12Ns;
//   }

//   void setTime12NS(int time12ns) {
//     _time12Ns = time12ns;
//   }

//   int getFloating() {
//     return _floating;
//   }

//   void setFloating(int floating) {
//     _floating = floating;
//   }

//   int getNumIterations() {
//     return _numIterations;
//   }

//   void setNumIterations(int numIterations) {
//     _numIterations = numIterations;
//   }

//   List<String> getTimeNames() {
//     return _timeNames;
//   }
// }
