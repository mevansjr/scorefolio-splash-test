//
//  iCarouselExampleViewController.m
//  iCarouselExample
//
//  Created by Nick Lockwood on 03/04/2011.
//  Copyright 2011 Charcoal Design. All rights reserved.
//

#import "iCarouselExampleViewController.h"


@interface iCarouselExampleViewController ()
{
    int selectedIndex;
}

@property (nonatomic, strong) NSMutableArray *items1;
@property (nonatomic, strong) NSMutableArray *items2;

@end


@implementation iCarouselExampleViewController

@synthesize carousel1;
@synthesize carousel2;
@synthesize items1;
@synthesize items2;

- (void)awakeFromNib
{
    //set up data sources
    self.items1 = [NSMutableArray array];
    for (int i = 0; i < 3; i++)
    {
        [items1 addObject:[NSNumber numberWithInt:i]];
    }
    
    self.items2 = [NSMutableArray array];
    for (int i = 0; i < 3; i++)
    {
        [items2 addObject:[NSNumber numberWithInt:i]];
    }
}

- (void)dealloc
{
    //it's a good idea to set these to nil here to avoid
    //sending messages to a deallocated viewcontroller
    carousel1.delegate = nil;
    carousel1.dataSource = nil;
    carousel2.delegate = nil;
    carousel2.dataSource = nil;
    
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //configure carousel
    carousel1.type = iCarouselTypeCoverFlow2;
    carousel2.type = iCarouselTypeLinear;
    
    if (self.items1 != nil) {
        if (self.items1.count >= 1) {
            [self.carousel1 scrollToItemAtIndex:1 animated:YES];
            selectedIndex = 1;
        }
        
        NSLog(@"1 carousel pos :: %ld", (long)selectedIndex);
        
        [self.carousel1 reloadData];
        
        NSLog(@"2 carousel pos :: %ld", (long)selectedIndex);
    }
    
    NSLog(@"3 carousel pos :: %ld", (long)selectedIndex);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    //free up memory by releasing subviews
    self.carousel1 = nil;
}

#pragma mark -
#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //return the total number of items in the carousel
    if (carousel == carousel1)
    {
        return [items1 count];
    }
    return 0;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    //create new view if no view is available for recycling
    if (view == nil)
    {
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 158.0f, 173.0f)];
        switch (index) {
            case 0:
                ((UIImageView *)view).image = [UIImage imageNamed:@"coachSelect@2x.png"];
                break;
            case 1:
                ((UIImageView *)view).image = [UIImage imageNamed:@"playerSelect@2x.png"];
                break;
            case 2:
                ((UIImageView *)view).image = [UIImage imageNamed:@"fanSelect@2x.png"];
                break;
                
            default:
                break;
        }
        view.contentMode = UIViewContentModeScaleAspectFill;
    }
    
    switch (index) {
        case 0:
            ((UIImageView *)view).image = [UIImage imageNamed:@"coachSelect@2x.png"];
            break;
        case 1:
            ((UIImageView *)view).image = [UIImage imageNamed:@"playerSelect@2x.png"];
            break;
        case 2:
            ((UIImageView *)view).image = [UIImage imageNamed:@"fanSelect@2x.png"];
            break;
            
        default:
            break;
    }
    
    return view;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"carousel click :: %li", (long)index);
    selectedIndex = (int)index;
    NSLog(@"carousel select :: %li", (long)selectedIndex);
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value {
    switch (option) {
        case iCarouselOptionFadeMax:
            return 0.2f;
            break;
        case iCarouselOptionFadeMin:
            return -0.2f;
            break;
        case iCarouselOptionFadeRange:
            return 2.5f;
            break;
            
        default:
            return value;
            break;
    }
}

@end
