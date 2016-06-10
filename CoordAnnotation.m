//
//  CoordAnnotation.m
//  MapWork
//
//  Created by Ольга Выростко on 17.11.14.
//  Copyright (c) 2014 Ольга Выростко. All rights reserved.
//

#import "CoordAnnotation.h"

@implementation CoordAnnotation
{
    NSString * _title;
    CLLocationCoordinate2D _coord;
    NSDateFormatter * _dateFmt;
}

@synthesize title=_title;
@synthesize coordinate=_coord;

-(id) init
{
    self = [super init];
    if (self != nil)
    {
        _dateFmt = [[NSDateFormatter alloc] init];
        [_dateFmt setDateFormat: @"HH:mm:ss"];
    }
    return self;
}

-(void) dealloc
{
    [_title release];
    [_dateFmt release];
    
    [super dealloc];
}

-(NSString *) title
{
    NSDate * curDate = [NSDate date];
    NSString * title = [NSString stringWithFormat: @"My location at %@", [_dateFmt stringFromDate: curDate]];
    return title;
}
@end
