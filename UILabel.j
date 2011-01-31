@import "UIControl.j"

@implementation UILabel : UIControl
{
    CPString    _text           @accessors(property=text);
}

- (id)init
{
    self = [super init];
    if(self)
    {
        _stateTitles = [CPDictionary dictionary];
    }
    return self;
}

@end
