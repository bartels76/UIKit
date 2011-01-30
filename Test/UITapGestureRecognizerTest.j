@import "../UITapGestureRecognizer.j"
@import <OJMoq/OJMoq.j>

@implementation UITapGestureRecognizerTest : OJTestCase

- (void)testThatUITapGestureRecognizerDoesCallHandleGestureOnSingleTap
{
    var touches = [CPSet setWithObjects:[[CPObject alloc] init]];
    
    var myDelegate = moq();
    
    [myDelegate selector:@selector(handleGesture:) times:1];
    
    var gestureRecognizer = [[UITapGestureRecognizer alloc] init];
    [gestureRecognizer setDelegate:myDelegate];
    
    [gestureRecognizer touchesBegan:touches withEvent:nil];
    [gestureRecognizer touchesEnded:touches withEvent:nil];
    
    [myDelegate verifyThatAllExpectationsHaveBeenMet];
}

- (void)testThatUITapGestureRecognizerDoesCallHandleGestureOnSingleTapWithMultipleTouches
{
    var touches = [CPSet setWithObjects:[[CPObject alloc] init], [[CPObject alloc] init]];

    var myDelegate = moq();
    
    [myDelegate selector:@selector(handleGesture:) times:1];
    
    var gestureRecognizer = [[UITapGestureRecognizer alloc] init];
    [gestureRecognizer setDelegate:myDelegate];
    [gestureRecognizer setNumberOfTouchesRequired:2];
    
    [gestureRecognizer touchesBegan:touches withEvent:nil];
    [gestureRecognizer touchesEnded:touches withEvent:nil];
    
    [myDelegate verifyThatAllExpectationsHaveBeenMet];
}

- (void)testThatUITapGestureRecognizerDoesNotCallHandleGestureOnSingleTapWithMultipleTouchesWhenOnlyOneGiven
{
    var touches = [CPSet setWithObjects:[[CPObject alloc] init]];
    
    var myDelegate = moq();

    [myDelegate selector:@selector(handleGesture:) times:0];

    var gestureRecognizer = [[UITapGestureRecognizer alloc] init];
    [gestureRecognizer setDelegate:myDelegate];
    [gestureRecognizer setNumberOfTouchesRequired:2];

    [gestureRecognizer touchesBegan:touches withEvent:nil];
    [gestureRecognizer touchesEnded:touches withEvent:nil];

    [myDelegate verifyThatAllExpectationsHaveBeenMet];
}

@end