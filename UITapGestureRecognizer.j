@import "UIGestureRecognizer.j"

@implementation UITapGestureRecognizer : UIGestureRecognizer
{
    id          _delegate       @accessors(property=delegate);
}

- (id)init
{
    self = [super init];
    if(self)
    {
    }
    return self;
}

- (void)reset
{
}

- (void)touchesBegan:(CPSet)touches withEvent:(UIEvent)event
{
}

- (void)touchesMoved:(CPSet)touches withEvent:(UIEvent)event
{
}

- (void)touchesEnded:(CPSet)touches withEvent:(UIEvent)event
{
    [_delegate handleGesture:self];
}

- (void)touchesCancelled:(CPSet)touches withEvent:(UIEvent)event
{
}

@end
