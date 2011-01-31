@import "../UITapGestureRecognizer.j"
@import "../UITouch.j"
@import <OJMoq/OJMoq.j>

@implementation UITapGestureRecognizerTest : OJTestCase
{
    id gestureRecognizer;
    id myDelegate;
}

- (void)setUp
{
    myDelegate = moq();
    gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:myDelegate action:@selector(handleGesture:)];
}

- (void)testThatUITapGestureRecognizerDoesCallHandleGestureOnSingleTap
{
    var touches = [CPSet setWithObjects:[[UITouch alloc] init]];
    [myDelegate selector:@selector(handleGesture:) times:1];

    [gestureRecognizer touchesBegan:touches withEvent:nil];
    [gestureRecognizer touchesEnded:touches withEvent:nil];

    [myDelegate verifyThatAllExpectationsHaveBeenMet];
}

- (void)testThatUITapGestureRecognizerDoesCallHandleGestureOnSingleTapWithMultipleTouches
{
    var touches = [CPSet setWithObjects:[[UITouch alloc] init], [[UITouch alloc] init]];
    [myDelegate selector:@selector(handleGesture:) times:1];

    [gestureRecognizer setNumberOfTouchesRequired:2];

    [gestureRecognizer touchesBegan:touches withEvent:nil];
    [gestureRecognizer touchesEnded:touches withEvent:nil];

    [myDelegate verifyThatAllExpectationsHaveBeenMet];
}

- (void)testThatUITapGestureRecognizerDoesNotCallHandleGestureOnSingleTapWithMultipleTouchesWhenOnlyOneGiven
{
    var touches = [CPSet setWithObjects:[[UITouch alloc] init]];
    [myDelegate selector:@selector(handleGesture:) times:0];

    [gestureRecognizer setNumberOfTouchesRequired:2];

    [gestureRecognizer touchesBegan:touches withEvent:nil];
    [gestureRecognizer touchesEnded:touches withEvent:nil];

    [myDelegate verifyThatAllExpectationsHaveBeenMet];
}

- (void)testThatUITapGestureRecognizerDoesAddItselfToUITouchHandlers
{
    var touch = [[UITouch alloc] init],
        touches = [CPSet setWithObjects:touch];

    [gestureRecognizer touchesBegan:touches withEvent:nil];

    [self assertTrue:[[touch gestureRecognizers] containsObject:gestureRecognizer]];
}

- (void)testThatUITapGestureRecognizerDoesUseGivenTargetAction
{
    var touches = [CPSet setWithObjects:[[UITouch alloc] init]];

    [gestureRecognizer setAction:@selector(anotherAction:)];
    [myDelegate selector:@selector(handleGesture:) times:0];
    [myDelegate selector:@selector(anotherAction:) times:1];

    [gestureRecognizer touchesBegan:touches withEvent:nil];
    [gestureRecognizer touchesEnded:touches withEvent:nil];

    [myDelegate verifyThatAllExpectationsHaveBeenMet];
}


- (void)testThatUITapGestureRecognizerDoesUseGivenTargetActionWithNoArguments
{
    var touches = [CPSet setWithObjects:[[UITouch alloc] init]];

    [gestureRecognizer setAction:@selector(anotherAction)];
    [myDelegate selector:@selector(handleGesture:) times:0];
    [myDelegate selector:@selector(anotherAction) times:1];

    [gestureRecognizer touchesBegan:touches withEvent:nil];
    [gestureRecognizer touchesEnded:touches withEvent:nil];

    [myDelegate verifyThatAllExpectationsHaveBeenMet];
}

@end