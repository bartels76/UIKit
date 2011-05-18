@import "UIGestureRecognizer.j"

@implementation UITapGestureRecognizer : UIGestureRecognizer
{
    int         _numberOfTouchesRequired    @accessors(property=numberOfTouchesRequired);
}

- (id)initWithTarget:(id)target action:(SEL)action
{
    self = [super initWithTarget:target action:action];
    if (self)
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
    var arrayOfTouches = [touches allObjects];
    for (var i = 0, ii = [arrayOfTouches count]; i < ii; i++)
    {
        [[arrayOfTouches objectAtIndex:i] addGestureRecognizer:self];
    }
}

- (void)touchesMoved:(CPSet)touches withEvent:(UIEvent)event
{
}

- (void)touchesEnded:(CPSet)touches withEvent:(UIEvent)event
{
    if ([touches count] === _numberOfTouchesRequired)
    {
        [[self target] performSelector:[self action] withObject:self];
    }
}

- (void)touchesCancelled:(CPSet)touches withEvent:(UIEvent)event
{
}

@end
