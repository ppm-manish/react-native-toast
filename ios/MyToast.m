#import "MyToast.h"
#import "IOSNativeToast.h"
#import <React/RCTLog.h>

#import <Payabbhi/Payabbhi-Swift.h>

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

RCT_EXPORT_METHOD(open:(NSDictionary *)options)
{
    
    RCTLogInfo(@"Pretending to create an event %@", options);
    
    NSString *accessID = (NSString *)[options objectForKey:@"access_id"];
    dispatch_sync(dispatch_get_main_queue(), ^{
        Payabbhi *payabbhi = [[Payabbhi alloc] initWithAccessID: accessID delegate:self];
        
        PayabbhiError *error = [payabbhi openWithOptions: options];
        
        RCTLogInfo(@"ERROR: Message: %@,  Code: %ld", error.getMessage, error.getCode);
    });
    
//  [self.toast showToast:text];
    
    
}

@end
