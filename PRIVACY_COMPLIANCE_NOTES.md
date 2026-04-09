# Planarity Privacy Compliance Notes

Date: 2026-04-09

This note is a practical compliance summary for the current repository. It is not legal advice.

## Bottom line

The privacy policy draft in [PRIVACY_POLICY.md](/Users/wxlfe/Documents/Code/planarity/PRIVACY_POLICY.md) is a truthful draft for the app as it exists today, after you fill in the placeholders.

However, the current app is not ready to be represented as compliant for users under 13 on Apple's Kids Category or Google Play's Families requirements. A privacy policy alone is not enough to fix that.

## Current code paths that create child-directed compliance risk

- `lib/main.dart` initializes Google Mobile Ads at startup.
- `lib/main.dart` initializes Firebase Analytics at startup.
- `lib/main.dart` supports Google Sign-In.
- `lib/main.dart` supports friend invites, friend lists, and leaderboards.
- `lib/main.dart` supports sharing through the operating system share sheet.
- `lib/main.dart` does not currently expose an obvious in-app account deletion flow for created accounts.

## Why that matters

### Apple

Apple's App Review Guidelines say Kids Category apps should not include third-party analytics or third-party advertising, with only limited exceptions. Apple also requires a privacy policy for apps that can collect or share personal information from minors, and apps that support account creation must let users initiate account deletion within the app.

### Google Play

Google Play's Families policies require apps that include children in their target audience to:

- accurately disclose child data practices;
- avoid transmitting Android Advertising ID and certain other identifiers from children or users of unknown age;
- avoid requiring access through APIs or SDKs not approved for child-directed services;
- use child-appropriate ad SDKs and child-appropriate ad serving where ads are shown to children or users of unknown age; and
- add extra safeguards for social features, including adult action before children can exchange personal information.

### COPPA and similar laws

If the app is directed to children under 13, or if you have actual knowledge you are collecting personal information from children under 13, U.S. COPPA generally requires verifiable parental consent before collecting, using, or disclosing personal information except in narrow cases.

## What you should do next

Choose one path before publishing:

### Option A: Make Planarity a general-audience app, not for children under 13

This is the lowest-risk path for the current codebase.

Recommended steps:

- do not declare children under 13 in Google Play target audience;
- do not enroll as a Made for Kids / Kids Category app on Apple;
- keep the privacy policy language stating the app is not directed to children under 13;
- add a real in-app account deletion flow for created accounts before App Store submission; and
- make sure your App Store privacy answers and Google Play Data safety answers match the SDKs and data practices actually used in production.

### Option B: Make Planarity available to children under 13

This will require product and engineering changes before your policy can truthfully promise compliance.

Recommended changes:

- add a neutral age screen before any analytics, ads, or child-restricted SDK initialization;
- do not initialize analytics or ads for users who are children or whose age is unknown unless the SDK and configuration are permitted for child-directed use;
- review whether Google Sign-In is approved for your child-directed use case and avoid requiring it for access to child content;
- add verifiable parental consent and parental notice flows where required by law;
- add parental controls or adult-action gating around social features, sharing, friend invites, and link-outs;
- add an in-app account deletion flow;
- review every SDK version against Apple and Google child-directed rules; and
- update the privacy policy after those product changes are complete.

## Official sources reviewed

- Apple App privacy requirements: https://developer.apple.com/help/app-store-connect/manage-app-information/manage-app-privacy
- Apple App Review Guidelines, including Kids Category and account sign-in/deletion guidance: https://developer.apple.com/appstore/resources/approval/guidelines.html
- Apple account deletion requirement: https://developer.apple.com/support/offering-account-deletion-in-your-app
- Google Play Families policies: https://support.google.com/googleplay/android-developer/answer/9893335
- Google Play Families data practices: https://support.google.com/googleplay/android-developer/answer/11043825
- Google Play Families ads policy: https://support.google.com/googleplay/android-developer/answer/9898834
- FTC COPPA guidance: https://www.ftc.gov/tips-advice/business-center/guidance/complying-coppa-frequently-asked-questions
