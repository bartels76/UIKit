@import <Foundation/CPObject.j>

@implementation UITouch : CPObject
{
    CPArray         _gestureRecognizers     @accessors(property=gestureRecognizers);
}

- (id)init
{
    self = [super init];
    if(self)
    {
        _gestureRecognizers = [CPArray array];
    }
    return self;
}

+ (UITouch)touchWithJSTouch:(id)anEvent
{
    return [[UITouch alloc] init];
}

/*
    @ignore
    'private' function to add gesture recognizers.
*/
- (void)addGestureRecognizer:(UIGestureRecognizer)gestureRecognizer
{
    [_gestureRecognizers addObject:gestureRecognizer];
}

@end
