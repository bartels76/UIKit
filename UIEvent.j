@import <Foundation/CPObject.j>

@implementation UIEvent : CPObject
{
}

- (id)init
{
    self = [super init];
    if(self)
    {
    }
    return self;
}

+ (UIEvent)eventWithJSEvent:(id)anEvent
{
    return [[UIEvent alloc] init];
}

@end
