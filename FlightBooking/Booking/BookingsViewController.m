//
//  ViewController.m
//  FlightBooking
//
//  Created by Nodir on 27/07/22.
//

#import "BookingsViewController.h"
#import "OneWayCell.h"
#import "RoundTripCell.h"

@interface BookingsViewController ()

@end

@implementation BookingsViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.bookingsTableView.delegate = self;
    self.bookingsTableView.dataSource = self;
    
    
    [self.bookingsTableView registerNib:[UINib nibWithNibName:@"OneWayCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"oneWay"];
    [self.bookingsTableView registerNib:[UINib nibWithNibName:@"RoundTripCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"roundTrip"];
    
    
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    [self setFlightArr:[self doSomethingWithTheJson]];
    NSLog(@"ads %lu", (unsigned long)self.flightArr.count);
    return self.flightArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [self setFlightArr:[self doSomethingWithTheJson]];
    
    NSDictionary *data = self.flightArr[indexPath.row];
    NSString *flight = [data objectForKey:@"flight"];
    
    if ([flight  isEqual: @"oneWay"]) {
        OneWayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"oneWay"];
        cell.departureCity.text = [data objectForKey:@"origin"];
        cell.departureTime.text = [data objectForKey:@"departureTime"];
        cell.arrivingCity.text = [data objectForKey:@"destination"];
        cell.arrivingTime.text = [data objectForKey:@"arrivalTime"];
        cell.flightClass.text = [data objectForKey:@"class"];
        cell.passCount.text = [NSString stringWithFormat:@"%@ %@", @"Passengers", [NSString stringWithFormat:@"%@", [data objectForKey:@"passenger"]]];
        
        return cell;
    } else {
        RoundTripCell *cell = [tableView dequeueReusableCellWithIdentifier:@"roundTrip"];
        cell.departureCityIn.text = [data objectForKey:@"origin"];
        cell.departureTimeIn.text = [data objectForKey:@"departureTime"];
        cell.arrivingCityIn.text = [data objectForKey:@"destination"];
        cell.arrivingTimeIn.text = [data objectForKey:@"arrivalTime"];
        cell.flightClassOut.text = [data objectForKey:@"class"];
        cell.passCountOut.text = [NSString stringWithFormat:@"%@ %@", @"Passengers", [NSString stringWithFormat:@"%@", [data objectForKey:@"passenger"]]];
        
        cell.departureCityOut.text = [data objectForKey:@"originBack"];
        cell.departureTimeOut.text = [data objectForKey:@"departureTime"];
        cell.arrivingCityOut.text = [data objectForKey:@"destinationBack"];
        cell.arrivingTimeOut.text = [data objectForKey:@"arrivalTime"];
        cell.flightClassIn.text = [data objectForKey:@"class"];
        cell.passCountIn.text = [NSString stringWithFormat:@"%@ %@", @"Passengers", [NSString stringWithFormat:@"%@", [data objectForKey:@"passenger"]]];
        
        return cell;
    }
    
    
}


- (NSArray *)doSomethingWithTheJson {
    NSDictionary *dict = [self JSONFromFile];

    NSArray *flight = [dict objectForKey:@"flights"];

    return flight;
}

- (NSDictionary *)JSONFromFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"flights" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

@end

