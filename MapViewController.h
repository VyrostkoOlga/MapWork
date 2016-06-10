//
//  MapViewController.h
//  MapWork
//
//  Created by Ольга Выростко on 17.11.14.
//  Copyright (c) 2014 Ольга Выростко. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (nonatomic, retain) IBOutlet MKMapView * mapView;

@end
