/*
 * UIResponder.j
 * UIKit
 *
 * Created by Amari Robinson.
 * Copyright 2011, Amari Robinson.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

@import <Foundation/CPObject.j>

/* UIGestureRecognizerState */
var UIGestureRecognizerStatePossible = 0,
	UIGestureRecognizerStateBegan = 1,
	UIGestureRecognizerStateChanged = 2,
	UIGestureRecognizerStateEnded = 3,
	UIGestureRecognizerStateCancelled = 4,
	UIGestureRecognizerStateFailed = 5,
	UIGestureRecognizerStateRecognized = 6;
	
@implementation UIGestureRecognizer : CPObject
{
	UIGestureRecognizerState	_state              @accessors(getter=state,setter=_setState:);
	UIView	                    _view               @accessors(getter=view,setter=_setView:);
	BOOL	                    _enabled            @accessors(property=enabled);

	BOOL 	                _cancelsTouchesInView   @accessors(property=cancelsTouchesInView);
	BOOL 	                _delaysTouchesBegan     @accessors(property=delaysTouchesBegan);
	BOOL	                _delaysTouchesEnded     @accessors(property=delaysTouchesEnded);
	
	SEL                         _action             @accessors(property=action);
	id                          _target             @accessors(property=target);
}

- (id)initWithTarget:(id)target action:(SEL)action {
	if (target == nil || action == nil)
		return nil;

	if (self = [super init]) {
		_state = nil;
		_view = nil;
		_enabled = YES;
		
		_cancelsTouchesInView = YES;
	}
	return self;
}

/* Adding and Removing Targets and Actions */

- (void)addTarget:(id)target action:(SEL)action {
	if (target != nil && action != nil) {
		
	}
}

- (void)removeTarget:(id)target action:(SEL)action {
	if (target != nil && action != nil) {
		
	}
}

/* Getting the Touches and Location of a Gesture */

- (CGPoint)locationInView:(UIView)view {
	
}

- (CGPoint)locationOfTouch:(NSUInteger)touchIndex inView:(UIView)view {
	
}

- (NSUInteger)numberOfTouches {
	
}

/* Specifying Dependencies Between Gesture Recognizers */

- (void)requireGestureRecognizerToFail:(UIGestureRecognizer)otherGestureRecognizer {
	
}

/*
    @ignore
    'private' function to add gesture recognizers.
*/
- (void)addGestureRecognizer:(UIGestureRecognizer)gestureRecognizer
{
    [_gestureRecognizers addObject:gestureRecognizer];
}

@end