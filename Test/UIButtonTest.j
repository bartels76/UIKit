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

    [button layoutSubviews];

    [self assert:@"A Title" equals:[[button titleLabel] text]];
}

- (void)testThatUIButtonDoesNotRecognizeTapWhenDisabled
{
    var target = moq();
    [target selector:@selector(action:) times:0];

    var button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [button setTarget:target];
    [button setAction:@selector(action:)];
    [button setState:UIControlStateDisabled];
    [button touchstartDOMEvent:{touches:[{}]}];
    [button touchendDOMEvent:{touches:[{}]}];

    [target verifyThatAllExpectationsHaveBeenMet];
}

- (void)testThatUIButtonDoesHaveDifferentCurrentTitlesForDifferentStates
{
    var button = [[UIButton alloc] initWithFrame:CGRectMakeZero()];
    [button setTitle:@"First Title" forState:UIControlStateNormal];
    [button setTitle:@"Second Title" forState:UIControlStateDisabled];

    [self assert:@"First Title" equals:[button currentTitle]];

    [button setState:UIControlStateDisabled];

    [self assert:@"Second Title" equals:[button currentTitle]];
}

- (void)testThatUIButtonDoesReflectStatefulTitlesInLabel
{
    var button = [[UIButton alloc] initWithFrame:CGRectMakeZero()];
    [button setTitle:@"First Title" forState:UIControlStateNormal];
    [button setTitle:@"Second Title" forState:UIControlStateDisabled];

    [button layoutSubviews];

    [self assert:@"First Title" equals:[[button titleLabel] text]];
}

- (void)testThatUIButtonDoesCreateWithCustomButtonType
{
    var button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self assert:UIButtonTypeCustom equals:[button buttonType]];
}

@end