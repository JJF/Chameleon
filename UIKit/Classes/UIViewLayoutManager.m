//  Created by Sean Heber on 6/2/10.
#import "UIViewLayoutManager.h"
#import <QuartzCore/CALayer.h>

static UIViewLayoutManager *theLayoutManager = nil;

@implementation UIViewLayoutManager

+ (void)initialize
{
	if (self == [UIViewLayoutManager class]) {
		theLayoutManager = [self new];
	}
}

+ (UIViewLayoutManager *)layoutManager
{
	return theLayoutManager;
}

- (void)layoutSublayersOfLayer:(CALayer *)theLayer
{
	id<UIViewLayoutManagerProtocol> view = [theLayer delegate];

	[view layoutSubviews];

	if ([view respondsToSelector:@selector(_didLayoutSubviews)]) {
		[view _didLayoutSubviews];
	}
}

@end
