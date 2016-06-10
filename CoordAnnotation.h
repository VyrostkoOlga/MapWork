//
//  CoordAnnotation.h
//  MapWork
//
//  Created by Ольга Выростко on 17.11.14.
//  Copyright (c) 2014 Ольга Выростко. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CoordAnnotation : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@end
