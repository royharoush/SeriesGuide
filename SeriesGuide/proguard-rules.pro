# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in C:\android-sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Output unused code so we may optimize it
-printusage unused.txt

# Keep source file and line numbers for better crash logs
-keepattributes SourceFile,LineNumberTable

# Avoid throws declarations getting removed from retrofit service definitions
-keepattributes Exceptions

# Only shrink specific packages
# Android Support libaries
# Google Play services (also brings its own proguard config)
# Guava, added through google-api-client-android
-keep,allowobfuscation class !android.support.**, !com.google.ads.**, !com.google.android.gms.**, !com.google.common.**  { *; }

# Only obfuscate android.support.v7.internal.view.menu.**
# to avoid problem on Samsung 4.2.2 devices with appcompat v21
# see https://code.google.com/p/android/issues/detail?id=78377
-keep,allowshrinking class !android.support.v7.internal.view.menu.** { *; }

# Ignore notes about reflection use in support library
-dontnote android.support.**

# Ignore some warnings
# Amazon IAP library
-dontwarn com.amazon.**

# ButterKnife
-dontwarn butterknife.internal.**

# Gson uses generic type information stored in a class file when working with fields. Proguard
# removes such information by default, so configure it to keep all of it.
-keepattributes Signature
# Gson specific classes
-dontwarn sun.misc.Unsafe

# joda-time has some annotations we don't care about.
-dontwarn org.joda.convert.**
# due to using joda-time-android tz data is included differently
-dontwarn org.joda.time.tz.**

# OkHttp
-dontwarn com.squareup.okhttp.internal.**

-keep class com.squareup.okhttp.** { *; }
-keep interface com.squareup.okhttp.** { *; }

# OkHttp 3
-dontwarn okhttp3.**

-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }

# Okio
-dontwarn java.nio.file.*
-dontwarn org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement

# Oltu has some stuff not available on Android (javax.servlet), we don't use (slf4j)
# and not included because it is available on Android (json).
-dontwarn javax.servlet.http.**
-dontwarn org.slf4j.**
-dontwarn org.json.**

# Retrofit 1.X
-dontwarn retrofit.**
-dontwarn rx.**

-keep class retrofit.** { *; }

-keepclasseswithmembers class * {
    @retrofit.http.* <methods>;
}

# Retrofit 2.X
-dontwarn retrofit2.**

-keep class retrofit2.** { *; }

-keepclasseswithmembers class * {
    @retrofit2.http.* <methods>;
}

# Apache HTTP was removed as of Android M
-dontwarn org.apache.http.**
-dontwarn android.net.http.AndroidHttpClient
-dontwarn com.google.api.client.http.apache.**
-dontwarn com.google.android.gms.internal.**
