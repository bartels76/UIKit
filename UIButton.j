@import "UIView.j"
@import "UITapGestureRecognizer.j"

@implementation UIButton : UIView
{
    id      _target         @accessors(property=target);
    SEL     _action         @accessors(property=action);
}

- (void)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];
    if (self)
    {
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)]];
    }
    return self;
}

- (void)handleGesture:(UIGestureRecognizer)gestureRecognizer
{
    [_target performSelector:_action withObject:self];
}

@end
