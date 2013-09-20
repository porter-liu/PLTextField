//
//  PLTextField.m
//
//  Created by Porter Liu on 9/19/13.
//  Copyright (c) 2013 Porter Liu. All rights reserved.
//

#import "PLTextField.h"


@implementation PLTextField

@synthesize placeholderTextColor = _placeholderTextColor;
@synthesize placeholderFont      = _placeholderFont;


- (id)init
{
	return( [self initWithFrame:CGRectZero] );
}

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if( self )
	{
		_placeholderTextColor = [[UIColor alloc] initWithRed:164.0/255.0 green:164.0/255.0 blue:164.0/255.0 alpha:1];
		_placeholderFont      = nil;
	}

	return( self );
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
	return( CGRectMake( 0, 0, self.frame.size.width, self.frame.size.height ) );
}

- (void)drawPlaceholderInRect:(CGRect)rect
{
	[self.placeholderTextColor setFill];

	CGSize  size = CGSizeMake( 0, 0 );
	UIFont *font = nil;

	if( self.placeholderFont )
	{
		size = [self.placeholder sizeWithFont:self.placeholderFont
							constrainedToSize:CGSizeMake( MAXFLOAT, MAXFLOAT )];

		font = self.placeholderFont;
	}
	else
	{
		
		CGFloat fontSize = self.font.pointSize + 1;

		do
		{
			fontSize--;
			size = [self.placeholder sizeWithFont:[UIFont fontWithName:self.font.fontName size:fontSize]
								constrainedToSize:CGSizeMake( MAXFLOAT, MAXFLOAT )];
		}
		while( size.width > rect.size.width );

		font = [UIFont fontWithName:self.font.fontName size:fontSize];
	}

	rect.origin.y = ( rect.size.height - size.height ) / 2.0;
	[[self placeholder] drawInRect:rect withFont:font];
}

@end
