#import "MyToast.h"
#import "IOSNativeToast.h"
#import <React/RCTLog.h>

@interface MyToast()
@property (nonatomic, retain) IOSNativeToast *toast;
@end

@implementation MyToast

- (instancetype)init {
  self = [super init];
  if (self) {
    self.toast = [[IOSNativeToast alloc] init];
  }
  return self;
}

+ (BOOL)requiresMainQueueSetup
{
  return YES;
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(show:(NSString *)text)
{
    RCTLogInfo(@"Pretending to create an event %@", text);
//  [self.toast showToast:text];
}

@end
