@import "../UITapGestureRecognizer.j"
@import <OJMoq/OJMoq.j>

@implementation UITapGestureRecognizerTest : OJTestCase
{
    id gestureRecognizer;
    id myDelegate;
}

- (void)setUp
{
    gestureRecognizer = [[UITapGestureRecognizer alloc] init];
    myDelegate = moq();
    [gestureRecognizer setDelegate:myDelegate];
}

- (void)testThatUITapGestureRecognizerDoesCallHandleGestureOnSingleTap
{
    var touches = [CPSet setWithObjects:[[CPObject alloc] init]];
    [myDelegate selector:@selector(handleGesture:) times:1];
    
    [gestureRecognizer touchesBegan:touches withEvent:nil];
    [gestureRecognizer touchesEnded:touches withEvent:nil];
    
    [myDelegate verifyThatAllExpectationsHaveBeenMet];
}

- (void)testThatUITapGestureRecognizerDoesCallHandleGestureOnSingleTapWithMultipleTouches
{
    var touches = [CPSet setWithObjects:[[CPObject alloc] init], [[CPObject alloc] init]];
    [myDelegate selector:@selector(handleGesture:) times:1];
    
    [gestureRecognizer setNumberOfTouchesRequired:2];
    
    [gestureRecognizer touchesBegan:touches withEvent:nil];
    [gestureRecognizer touchesEnded:touches withEvent:nil];
    
    [myDelegate verifyThatAllExpectationsHaveBeenMet];
}

- (void)testThatUITapGestureRecognizerDoesNotCallHandleGestureOnSingleTapWithMultipleTouchesWhenOnlyOneGiven
{
    var touches = [CPSet setWithObjects:[[CPObject alloc] init]];
    [myDelegate selector:@selector(handleGesture:) times:0];

    [gestureRecognizer setNumberOfTouchesRequired:2];

    [gestureRecognizer touchesBegan:touches withEvent:nil];
    [gestureRecognizer touchesEnded:touches withEvent:nil];

    [myDelegate verifyThatAllExpectationsHaveBeenMet];
}

@end