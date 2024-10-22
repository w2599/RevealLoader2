#import <Foundation/Foundation.h>
#import "MKRLRootListController.h"

@implementation MKRLRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

@end
