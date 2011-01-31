@import "UIView.j"

UIControlStateNormal               = 0;
UIControlStateHighlighted          = 1 << 0;
UIControlStateDisabled             = 1 << 1;
UIControlStateSelected             = 1 << 2;
UIControlStateApplication          = 1 << 3;
UIControlStateReserved             = 1 << 4;

@implementation UIControl : UIView
{
    UIControlState      _state      @accessors(property=state);
}

- (id)init
{
    self = [super init];
    if(self)
    {
        _state = UIControlStateNormal;
    }
    return self;
}

@end
