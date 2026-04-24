# DVIA-v2

Powered by <a href="https://8ksec.io">8ksec.io</a>

DDamn Vulnerable iOS App (DVIA) is an iOS application that is damn vulnerable. Its main goal is to provide a platform to mobile security enthusiasts, professionals, and students to test their iOS penetration testing skills in a legal environment.
This project was originally developed and maintained by @prateekg147. The current version is written in Swift and covers vulnerabilities tested up to iOS 16.

1. Local Data Storage
2. Jailbreak Detection
3. Excessive Permissions
4. Runtime Manipulation
5. Anti Anti Hooking/Debugging
6. Binary Protection
7. Touch/Face ID Bypass
8. Phishing
9. Side Channel Data Leakage
10. IPC Issues
11. Broken Cryptography
12. Webview Issues
13. Network Layer Security
14. Application Patching
15. Sensitive Information in Memory

## What's New in This Fork
1. Updated Jailbreak Detection module to support modern rootless jailbreaks (palera1n, Dopamine)
2. Added detection for rootless paths
3. Added modern package manager URL scheme checks (sileo://, zbra://)
4. Refactored Swift jailbreak tests to use a centralized, unified detection method

## Installing DVIA on any iOS device 

The best way to install DVIA from a Mac is using <a href="https://support.apple.com/en-ae/apple-configurator
">Apple Configurator App</a>.
If you are using Windows or Linux, you can use AltStore, Cydia Impactor etc. A paid developer account might be required in some cases.

## Compiling DVIA using Xcode

### Steps

1. Clone the DVIA repo , git clone https://github.com/sunain007/DVIA-v2.git
2. cd to the project root directory where the <em>Podfile</em> is present (/DVIA-v2/DVIA-v2). Then run <em>pod install</em>
3. Open the <em>DVIA-v2.xcworkspace</em> file with Xcode. You can now directly run the app on a simulator.
4. For running on the device, go under Project settings in Xcode on the top left, head over to the <em>General</em> tab and under <em>Signing</em>, enter credentials for your Apple ID.
5. Now you can build and run the project on the device. You will have to trust the app again by going under Settings -> General -> Device Management. 

## NOTE
This is an unsigned ipa file, so if you are running it into jailbreak devices with tools like trollstore installed in it, then it will not be a problem. But if you are running the app into a non-jailbreak device then you have to sign it first using xcode and your devlopers account.

