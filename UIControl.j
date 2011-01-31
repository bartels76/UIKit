@import "UIView.j"

UIControlStateNormal               = 1 << 0;
UIControlStateHighlighted          = 1 << 1;
UIControlStateDisabled             = 1 << 2;
UIControlStateSelected             = 1 << 3;
UIControlStateApplication          = 1 << 4;
UIControlStateReserved             = 1 << 5;

@implementation UIControl : UIView
{
    UIControlState      _state      @accessors(property=state);
}

- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];
    if(self)
    {
        _state = UIControlStateNormal;
    }
    return self;
}

@end
