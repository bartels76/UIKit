@import "UIResponder.j"

@implementation UIView : UIResponder
{
    CPArray         _gestureRecognizers;
    
    BOOL            _needsLayout            @accessors(property=needsLayout);
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self)
    {
        _gestureRecognizers = [CPArray array];
    }
    return self;
}

- (void)touchesBegan:(CPSet)touches withEvent:(UIEvent)anEvent
{
    _gestureRecognizers.forEach(function (x) { [x touchesBegan:touches withEvent:anEvent] });
}

- (void)touchesEnded:(CPSet)touches withEvent:(UIEvent)anEvent
{
    _gestureRecognizers.forEach(function (x) { [x touchesEnded:touches withEvent:anEvent] });
}

- (void)touchesMoved:(CPSet)touches withEvent:(UIEvent)anEvent
{
    _gestureRecognizers.forEach(function (x) { [x touchesMoved:touches withEvent:anEvent] });
}

- (void)addGestureRecognizer:(UIGestureRecognizer)gestureRecognizer
{
    [_gestureRecognizers addObject:gestureRecognizer];
}

- (void)layoutIfNeeded
{
    if (_needsLayout)
    {
        _needsLayout = NO;

        [self layoutSubviews];
    }
}

/*
    Subclasses override this to fill in their ephemeral subviews.
 */
- (void)layoutSubviews
{
}

@end
