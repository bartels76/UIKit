@import "../UIButton.j"
@import <OJMoq/OJMoq.j>

@implementation UIButtonTest : OJTestCase

- (void)testThatUIButtonDoesRecognizeTap
{
    var target = moq();
    [target selector:@selector(action:) times:1];
    
    var button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [button setTarget:target];
    [button setAction:@selector(action:)];
    [button touchstartDOMEvent:{touches:[{}]}];
    [button touchendDOMEvent:{touches:[{}]}];
    
    [target verifyThatAllExpectationsHaveBeenMet];
}

- (void)testThatUIButtonSetsTheTitleOnTheUILabel
{
    var button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [button setTitle:@"A Title" forState:UIControlStateNormal];
    [self assert:@"A Title" equals:[[button titleLabel] text]];
}

@end