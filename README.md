# wolcen_guide

울센 가이드 앱

## Flutter 기초 사용 방법
### 프로젝트 생성
Visual Studio 팔렛트에서 Flutter : New Project 실행

### 기타 명령어
```bash
flutter help
flutter doctor
flutter upgrade
# Version 변경
flutter version [VERSION]
```

## Developer's manual
### 국제화 (i18n)
#### Extracting Messages
```bash
# 초기 셋팅 시 활용
flutter pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/l10n/localization.dart

flutter pub run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/l10n/localization.dart lib/l10n/intl_messages.arb

# 본격 활용
## 코드 => ARB
flutter pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/l10n/localization.dart

## ARB => 코드
flutter pub run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/l10n/localization.dart lib/l10n/intl_en.arb lib/l10n/intl_ko.arb
```

### Admob 광고
https://pub.dev/packages/firebase_admob 참조하여 AndroidManifest.xml 및 Info.plist 파일에 앱ID를 입력하여야 함

#### Android
ca-app-pub-5924040435579261~4220470288
ca-app-pub-5924040435579261/5190238341
pubspec.yaml 파일에 firebase_admob 디펜던시 추가 시 반드시 아래의 설정을 넣어야 함
추가하지 않을 경우 앱이 정상적으로 동작하지 않음 
```xml
</activity>
<meta-data
    android:name="com.google.android.gms.ads.APPLICATION_ID"
    android:value="[ADMOB_APP_ID]"/>
```
#### IOS
```xml
<key>GADApplicationIdentifier</key>
<string>[ADMOB_APP_ID]</string>
```

## Build Manual - 공통
### App Launcher Icon
아이콘 적용 방법
```bash
flutter packages pub run flutter_launcher_icons:main
```
## Build Manual - 안드로이드
### Key Store 생성 방법 (참고용)
- 매번 생성할 필요 없음
keytool -genkey -v -keystore D:/dev/etcs/ss-todo-key.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias key

### 키스토어 지정
/android/key.properties 파일 생성 (이전 사용하던 것 복사)

### Gradle에서 서명 설정하기
/android/app/build.gradle 편집

```groovy
   def keystoreProperties = new Properties()
   def keystorePropertiesFile = rootProject.file('key.properties')
   if (keystorePropertiesFile.exists()) {
       keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
   }

   android {
```

```groovy
   signingConfigs {
       release {
           keyAlias keystoreProperties['keyAlias']
           keyPassword keystoreProperties['keyPassword']
           storeFile file(keystoreProperties['storeFile'])
           storePassword keystoreProperties['storePassword']
       }
   }
   buildTypes {
       release {
           signingConfig signingConfigs.release // debug를 반드시 release로 바꿀 것
       }
   }
```

### 빌드 설정 확인
/android/app/build.gradle 확인

```groovy
    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId "com.sixsam.so_simple_todo" //FINAL, UNIQUE
    }
```

### App Manifest 파일 확인
/android/app/src/main/AndroidManifest.xml 아래와 같이 수정
Firebase_admob 사용을 위해 INTERNET 사용 권한 주어야 함

```xml
<application  
    android:label="@string/title" >
    <!-- ... -->
</application>
<uses-permission android:name="android.permission.INTERNET" />
```

/android/app/src/main/res/ 폴더 안에 strings.xml 생성
- value/strings.xml
- value-en/strings.xml
- value-ko/strings.xml

각 strings.xml 내엔 아래와 같이 제목 입력
```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <!-- 앱의 이름 입력 -->    
    <string name="title">정말 심플한 할 일 관리</string>
</resources>
```

### Appbundle 빌드
flutter build appbundle