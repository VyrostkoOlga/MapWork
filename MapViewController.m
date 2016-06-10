//
//  MapViewController.m
//  MapWork
//
//  Created by Ольга Выростко on 17.11.14.
//  Copyright (c) 2014 Ольга Выростко. All rights reserved.
//

#import "MapViewController.h"
#import "CoordAnnotation.h"

@interface MapViewController ()

@end

@implementation MapViewController
{
    MKMapView * _mapView;
    CLLocationManager * _locationManager;
}

@synthesize mapView=_mapView;

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    if (self != nil)
    {
        //TODO
    }
    return self;
}

-(void) dealloc
{
    [_locationManager release];
    [_mapView release];
    
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mapView.mapType = MKMapTypeSatellite;
    
    if (nil == _locationManager)
        _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    _locationManager.distanceFilter = 500;
    
    _mapView.scrollEnabled = YES;
    _mapView.zoomEnabled = YES;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-( void ) viewWillAppear: ( BOOL )animated
{
    [ super viewWillAppear: animated ];
    
    [ _locationManager startUpdatingLocation ];
}

-( void ) viewWillDisappear: ( BOOL )animated
{
    [ super viewWillDisappear: animated ];
    
    [ _locationManager stopUpdatingLocation ];
}

#pragma mark - CLLocationManagerDelegate

-( void ) locationManager: ( CLLocationManager* )manager didUpdateLocations: (NSArray *) locations
{
    CLLocation * newLocation = [locations lastObject];
    NSLog( @"Move to location: [ %f ; %f ]", newLocation.coordinate.latitude, newLocation.coordinate.longitude );
    
    CoordAnnotation* ann = [ [ [ CoordAnnotation alloc ] init ] autorelease ];
    ann.coordinate = newLocation.coordinate;
    
    [ _mapView addAnnotation: ann ];
}

#pragma mark - MKMapViewDelegate

-( MKAnnotationView* ) mapView: ( MKMapView* )mapView viewForAnnotation: ( id< MKAnnotation > )annotation
{
    MKAnnotationView* view = [ mapView dequeueReusableAnnotationViewWithIdentifier: @"UserLocationAnnotation" ];
    if ( nil == view )
    {
        view = [ [ [ MKPinAnnotationView alloc ] initWithAnnotation: annotation reuseIdentifier: @"UserLocationAnnotation" ] autorelease ];
    }
    
    view.annotation = annotation;
    view.canShowCallout = YES;
    
    return view;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
