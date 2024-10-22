#import <Foundation/Foundation.h>
#import <dlfcn.h>
#import <rootless.h>

%ctor {
    NSString *framewokPath = ROOT_PATH_NS(@"/Library/Frameworks/RevealServer.framework/RevealServer");
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:ROOT_PATH_NS(@"/var/mobile/Library/Preferences/com.masterking.revealloader2.plist")];
    NSArray *selectedApplications = [dict objectForKey:@"selectedApplications"];
    if ([selectedApplications containsObject:[[NSBundle mainBundle] bundleIdentifier]]) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:framewokPath]) {
            void *handle = dlopen([framewokPath UTF8String], RTLD_NOW);
            if (handle) {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"IBARevealRequestStart" object:nil];
                NSLog(@"Reveal Loader 2 loaded %@", framewokPath);
            } else {
                char *error = dlerror();
                NSLog(@"dlopen error: %s", error);
            }
        }
    } else {
        NSLog(@"当前 app 没有被选中注入 RevealServer...请在设置中打开");
    }
}