@import "UIControl.j"
@import "UITapGestureRecognizer.j"
@import "UILabel.j"

UIButtonTypeCustom = 0;
UIButtonTypeRoundedRect = 1;
UIButtonTypeDetailDisclosure = 2;
UIButtonTypeInfoLight = 3;
UIButtonTypeInfoDark = 4;
UIButtonTypeContactAdd = 5;

@implementation UIButton : UIControl
{
    UIButtonType    _buttonType     @accessors(property=buttonType);
    UILabel         _titleLabel     @accessors(property=titleLabel);
    
    CPDictionary    _stateTitles;
}

+ (UIButton)buttonWithType:(UIButtonType)buttonType
{
    var result = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [result setButtonType:buttonType];
    return result;
}

- (void)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];
    if (self)
    {
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)]];
        
        _stateTitles = [CPDictionary dictionary];
        _titleLabel = [[UILabel alloc] initWithFrame:aFrame];
        _buttonType = UIButtonTypeRoundedRect;
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
