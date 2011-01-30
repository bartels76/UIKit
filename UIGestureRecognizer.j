@import <Foundation/CPObject.j>

@implementation UIGestureRecognizer : CPObject
{
    id      _target     @accessors(property=target);
    SEL     _action     @accessors(property=action);
}

- (id)initWithTarget:(id)target action:(SEL)action
{
    self = [super init];
    if (self)
    {
        _target = target;
        _action = action;
    }
    return self;
}

@end
