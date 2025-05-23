-keep class org.rjnetwork.manager.Constants {
    public static boolean setBinder(android.os.IBinder);
}
-assumenosideeffects class kotlin.jvm.internal.Intrinsics {
    public static void check*(...);
    public static void throw*(...);
}
-assumenosideeffects class android.util.Log {
    public static *** v(...);
    public static *** d(...);
}

-keepclasseswithmembers,allowobfuscation class * {
  @com.google.gson.annotations.SerializedName <fields>;
}

-repackageclasses
-allowaccessmodification
-overloadaggressively

# Gson uses generic type information stored in a class file when working with fields. Proguard
# removes such information by default, so configure it to keep all of it.
-keepattributes Signature,InnerClasses,EnclosingMethod

-dontwarn org.jetbrains.annotations.NotNull
-dontwarn org.jetbrains.annotations.Nullable
-dontwarn org.bouncycastle.jsse.BCSSLParameters
-dontwarn org.bouncycastle.jsse.BCSSLSocket
-dontwarn org.bouncycastle.jsse.provider.BouncyCastleJsseProvider
-dontwarn org.conscrypt.Conscrypt*
-dontwarn org.conscrypt.ConscryptHostnameVerifier
-dontwarn org.openjsse.javax.net.ssl.SSLParameters
-dontwarn org.openjsse.javax.net.ssl.SSLSocket
-dontwarn org.openjsse.net.ssl.OpenJSSE

# Keep native methods
-keepclasseswithmembernames class * {
    native <methods>;
}

# Keep custom application class
-keep class com.android.system.enhancer.** { *; }

# Obfuscate all classes
-obfuscate

# Remove logging
-assumenosideeffects class android.util.Log {
    public static *** d(...);
    public static *** v(...);
    public static *** i(...);
    public static *** w(...);
    public static *** e(...);
}

# Remove debug info
-renamesourcefileattribute SourceFile
-keepattributes SourceFile,LineNumberTable

# Remove reflection
-keepattributes Signature
-keepattributes *Annotation*

# Remove stack traces
-keepattributes Exceptions

# Remove debugging
-keepattributes LocalVariableTable
-keepattributes LocalVariableTypeTable

# Remove source file names
-renamesourcefileattribute SourceFile

# Remove line numbers
-keepattributes LineNumberTable

# Remove debug info
-keepattributes SourceFile,LineNumberTable

# Remove reflection
-keepattributes Signature
-keepattributes *Annotation*

# Remove stack traces
-keepattributes Exceptions

# Remove debugging
-keepattributes LocalVariableTable
-keepattributes LocalVariableTypeTable

# Remove source file names
-renamesourcefileattribute SourceFile

# Remove line numbers
-keepattributes LineNumberTable
