@import "UIControl.j"
@import "UITapGestureRecognizer.j"
@import "UILabel.j"

@implementation UIButton : UIControl
{
    id              _target         @accessors(property=target);
    SEL             _action         @accessors(property=action);
    
    UILabel         _titleLabel     @accessors(property=titleLabel);
    
    CPDictionary    _stateTitles;
}

- (void)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];
    if (self)
    {
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)]];
        
        _stateTitles = [CPDictionary dictionary];
        _titleLabel = [[UILabel alloc] initWithFrame:aFrame];
    }
    return self;
}

- (void)handleGesture:(UIGestureRecognizer)gestureRecognizer
{
    if (_state !== UIControlStateDisabled)
    {
        [_target performSelector:_action withObject:self];
    }
}

- (void)setTitle:(CPString)title forState:(UIControlState)state
{
    [_stateTitles setObject:title forKey:state];
}

- (CPString)currentTitle
{
    return [_stateTitles objectForKey:[self state]];
}

- (void)layoutSubviews
{
    [_titleLabel setText:[_stateTitles objectForKey:[self state]]];
}

@end
