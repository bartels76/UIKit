@import "../UITapGestureRecognizer.j"
@import <OJMoq/OJMoq.j>

@implementation UITapGestureRecognizerTest : OJTestCase

- (void)testThatUITapGestureRecognizerDoesCallHandleGestureOnSingleTap
{
    var myDelegate = moq();
    
    [myDelegate selector:@selector(handleGesture:) times:1];
    
    var gestureRecognizer = [[UITapGestureRecognizer alloc] init];
    [gestureRecognizer setDelegate:myDelegate];
    
    [gestureRecognizer touchesBegan:nil withEvent:nil];
    [gestureRecognizer touchesEnded:nil withEvent:nil];
    
    [myDelegate verifyThatAllExpectationsHaveBeenMet];
}

@end