# drawer_task

A new Flutter project.

## Getting Started

This project will guide you about implementing CI/CD using fastlane.

A few resources to get you started:

- [Docs: Fastlane starting docs](https://fastlane.tools/)
- [Reference code:](https://docs.fastlane.tools/getting-started/cross-platform/flutter/)
- [Reference code using android:](https://jaysavsani07.medium.com/flutter-ci-cd-with-github-actions-fastlane-part-1-android-14473438072d)
- [Reference code using ios:](https://jaysavsani07.medium.com/flutter-ci-cd-with-github-actions-fastlane-part-2-ios-a4b281921d39)

This article is for you if you’re

Flutter developer, want to integrate CI/CD in your project.
Don’t have any previous knowledge on implementing CI/CD for mobile apps.
Don’t have any previous experience on Fastlane.

### Prerequisites

git cli

fastlane cli

GnuPG cli

Steps to work with fastlane :
Android:
First we have to enter secret key, inside our project repository, for that we need to push our code to github server.

On GitHub.com, navigate to the main page of the repository.

Under your repository name, click  Settings.

Under your settings click secrets, then click Actions.

Click New repository secret.

Type a name for your secret in the Name input box.

Enter the value for your secret, and value is the personalised token for this click on profile icon.

Click Settings, click developer settings

Click personalised access token then click generate new token then generate new token(classic) and once generated saved it somewhere
and also add it in secret input box.

Click Add secret.

Next we have to open terminal of android studio and execute below commands:

cd android
fastlane init 

this will create fastlane folder inside android and also it will generate two files Fastfile & Appfile created inside ./fastlane folder and Gemfile inside ./android root directory.

Next we can configure our app to play store 

Ios:

We have to open terminal, secret key need to save one time we can use it for both ios and android.

cd ios
fastlane init

Now Fastlane would ask you few questions for your setup. Select any option.

In next step, fastlane would ask you for your apple developer credentials.

Fastlane will check if your package name(com.xyz) is available in your Developer Portal or not. If you’re doing it for your fresh app and haven’t registered your App ID just like me then say yes and proceed next. You’ll be prompted to enter an App name and then hit Enter.

So fastlane just created an app for us. You can check it on your App Store connect and you’d find your newly created app. Also your Fastfile & Appfille will be generated inside ./ios/fastlane/ folder & Gemfile inside your ./ios/ root folder.

Open your Gemfile and add below code, install this plugin via fastlane install plugin command in your terminal.

gem "fastlane-plugin-flutter_version", git: "https://github.com/tianhaoz95/fastlane-plugin-flutter-version"
This plugin helps Fastlane to fetch build’s version code from your pubspec.yml. This version_code will be used to create build number of our app.

First you need to create an empty private repository on your github account. This will be used by match to save your certificate on this repo. Once you create this repo, now you need to initialise match for iOS app.

cd ios
fastlane match init

match will ask you to provide storage mode where you want to store certificates & profiles. We’ll select the option “git” for cloud storage and provide link for our github repository.

A Matchfile will be created inside your ./ios/fastlane/ folder.

Open Matchfile, add type("appstore")below line type(“development”) if its not their.

fastlane match appstore - use this command then it will ask your apple developer account ID and password and also 6 digit verification code.

next we need to edit fastfile and code already shared in reference links

after that our code will successfully deployed to app store.

