//
//  JailbreakDetection.m
//  DVIA - Damn Vulnerable iOS App
//
//  Updated in 2026 to support both Rootful and Rootless jailbreaks
//  (Dopamine, Palera1n rootless, RootHide Bootstrap, etc.)
//
//  Original Author: Prateek Gianchandani
//  Contribution: Improved modern jailbreak detection
//

#import <Foundation/Foundation.h>
#import "JailbreakDetection.h"

@implementation JailbreakDetection

+ (BOOL)isJailbroken {
    
#if !TARGET_IPHONE_SIMULATOR
    
    // === Modern + Rootless aware file existence checks ===
    NSArray *jailbreakPaths = @[
        // Classic Rootful paths (old)
        @"/Applications/Cydia.app",
        @"/Library/MobileSubstrate/MobileSubstrate.dylib",
        @"/bin/bash",
        @"/usr/sbin/sshd",
        @"/etc/apt",
        
        // Modern Rootless paths (2025-2026)
        @"/var/jb",                          // Main rootless symlink
        @"/var/jb/Applications/Cydia.app",
        @"/var/jb/Applications/Sileo.app",
        @"/var/jb/Applications/Zebra.app",
        @"/var/jb/bin/bash",
        @"/var/jb/usr/sbin/sshd",
        @"/var/jb/etc/apt",
        @"/var/jb/Library/MobileSubstrate/MobileSubstrate.dylib",
        @"/private/preboot",                 // Common in rootless setups
        @"/var/binpack"
    ];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    for (NSString *path in jailbreakPaths) {
        if ([fileManager fileExistsAtPath:path]) {
            return YES;
        }
    }
    
    // === Write test to /private/ (still useful) ===
    NSError *error = nil;
    NSString *stringToBeWritten = @"This is a test.";
    [stringToBeWritten writeToFile:@"/private/jailbreak.txt"
                        atomically:YES
                          encoding:NSUTF8StringEncoding
                             error:&error];
    
    if (error == nil) {
        [fileManager removeItemAtPath:@"/private/jailbreak.txt" error:nil];
        return YES;
    }
    
    // === URL Scheme check (include modern managers) ===
    NSArray *urlSchemes = @[@"cydia://", @"sileo://", @"zbra://", @"cydia://package/com.example.package"];
    
    for (NSString *scheme in urlSchemes) {
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:scheme]]) {
            return YES;
        }
    }
    
#endif
    
    // All checks failed â†’ most probably not jailbroken
    return NO;
}

@end
