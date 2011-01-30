@import "UIGestureRecognizer.j"

@implementation UITapGestureRecognizer : UIGestureRecognizer
{
    id          _delegate       @accessors(property=delegate);
    
    int         _numberOfTouchesRequired    @accessors(property=numberOfTouchesRequired);
}

- (id)init
{
    self = [super init];
    if(self)
    {
        _numberOfTouchesRequired = 1;
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
    if ([touches count] === _numberOfTouchesRequired)
    {
        [_delegate handleGesture:self];
    }
}

- (void)touchesCancelled:(CPSet)touches withEvent:(UIEvent)event
{
}

@end
