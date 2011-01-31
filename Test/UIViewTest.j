@import "../UIView.j"

@implementation UIViewTest : OJTestCase

- (void)testThatUIViewDoesLayoutSubviewsWhenNeedsLayout
{
    var view = [[MyView alloc] initWithFrame:CGRectMakeZero()];
    [view setNeedsLayout:YES];
    [view layoutIfNeeded];
    [self assertTrue:[view called]];
}

@end

@implementation MyView : UIView
{
    BOOL called @accessors;
}

- (id)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];
    if (self)
    {
        called = false;
    }
    return self;
}

- (void)layoutSubviews
{
    called = true;
}

@end
