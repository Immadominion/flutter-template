# Deployment Guide for Celo Composer Flutter App

This document provides step-by-step instructions for deploying your Flutter app to Firebase Hosting for web deployment and to the Google Play Store and Apple App Store for mobile deployment.

## Prerequisites

1. **Flutter installed**: Ensure Flutter is installed on your system.
2. **Firebase CLI installed**: Ensure Firebase CLI is installed on your system.
3. **Google Play Developer Account**: For Android deployment.
4. **Apple Developer Account**: For iOS deployment.

## Web Deployment Using Firebase Hosting

### Step 1: Install Firebase CLI

Install Firebase CLI globally using npm:

```bash
npm install -g firebase-tools
```

### Step 2: Login to Firebase

Log in to your Firebase account:

```bash
firebase login
```

Follow the on-screen instructions to authenticate your account.

### Step 3: Initialize Firebase in Your Project

Navigate to the root directory of your Flutter app and initialize Firebase:

```bash
cd your_flutter_project
firebase init
```

Select the following options during initialization:

- Hosting: Configure files for Firebase Hosting and (optionally) set up GitHub Action deploys.
- Use an existing project or create a new one.
- Select the public directory as `build/web`.
- Configure as a single-page app: Yes.

### Step 4: Build Your Flutter Web App

Build your Flutter web app:

```bash
flutter build web
```

### Step 5: Deploy to Firebase Hosting

Deploy your Flutter web app to Firebase Hosting:

```bash
firebase deploy
```

After deployment, you’ll receive a deployment URL:

```bash
https://<project-id>.web.app
```

## Mobile Deployment

### Android Deployment Using Google Play Store

#### Step 1: Prepare Your App for Release

1. Update the `android/app/build.gradle` file with your app's version information.
2. Create a keystore file and update the `key.properties` file with your keystore information.

#### Step 2: Build the APK

Build the release APK:

```bash
flutter build apk --release
```

#### Step 3: Upload to Google Play Console

1. Sign in to your [Google Play Console](https://play.google.com/console).
2. Create a new application and fill in the required details.
3. Upload the APK file located at `build/app/outputs/flutter-apk/app-release.apk`.
4. Complete the remaining steps to publish your app.

### iOS Deployment Using Apple App Store

#### Step 1: Prepare Your App for Release

1. Update the `ios/Runner.xcodeproj` file with your app's version information.
2. Ensure you have a valid Apple Developer account and certificates.

#### Step 2: Build the iOS App

Build the release IPA:

```bash
flutter build ios --release
```

Open the project in Xcode:

```bash
open ios/Runner.xcworkspace
```

Archive the app and upload it to the App Store using Xcode.

#### Step 3: Upload to App Store Connect

1. Sign in to your [App Store Connect](https://appstoreconnect.apple.com/).
2. Create a new app and fill in the required details.
3. Upload the IPA file using Xcode or Transporter.
4. Complete the remaining steps to publish your app.

## Configure Environment Variables

If your app uses environment variables, configure them in your build process:

### For Web

1. Go to the Firebase Console.
2. Select your project.
3. Go to Hosting > Environment Variables.
4. Add variables for your web app.

### For Mobile

1. Use a `.env` file and the `flutter_dotenv` package to manage environment variables.
2. Ensure sensitive information is not included in your version control.

## Update Deployment

Whenever you make changes to your code, update the deployment:

### For Web

```bash
flutter build web
firebase deploy
```

### For Mobile

- Android: Build a new APK and upload it to the Google Play Console.
- iOS: Build a new IPA and upload it to App Store Connect.

Thank you for using Celo Composer Flutter! If you have any questions or need further assistance, please refer to the README or reach out to our team.

**_🔥 Voila, you have a dApp ready to go. Start building your dApp on Celo._**
