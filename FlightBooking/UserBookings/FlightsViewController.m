//
//  FlightsViewController.m
//  FlightBooking
//
//  Created by Nodir on 29/07/22.
//

#import "FlightsViewController.h"
#import "OneWayCell.h"
#import "RoundTripCell.h"

@interface FlightsViewController ()

@end

@implementation FlightsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"OneWayCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"oneWay"];
    [self.tableView registerNib:[UINib nibWithNibName:@"RoundTripCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"roundTrip"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    [self setFlightArr:[self doSomethingWithTheJson]];
    
    self.filtered = [self.flightArr filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF contains[c] 'RoundTrip'"]];
    if (!self.tripSwitch.isOn) {
        NSLog(@"FM %lu", (unsigned long)self.flightArr.count);
        return self.flightArr.count;
        
    } else {
        NSLog(@"FL %lu", (unsigned long)self.filtered.count);
        return self.filtered.count;
        
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [self setFlightArr:[self doSomethingWithTheJson]];
    
    
    NSDictionary *data = self.flightArr[indexPath.row];
    
    if (!self.tripSwitch.isOn) {
        
        OneWayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"oneWay"];
        cell.departureCity.text = [data objectForKey:@"origin"];
        cell.departureTime.text = [data objectForKey:@"departureTime"];
        cell.arrivingCity.text = [data objectForKey:@"destination"];
        cell.arrivingTime.text = [data objectForKey:@"arrivalTime"];
        cell.flightClass.text = [data objectForKey:@"class"];
        cell.passCount.text = [NSString stringWithFormat:@"%@ %@", @"Passengers:", [NSString stringWithFormat:@"%@", [data objectForKey:@"passenger"]]];
        
        return cell;
    } else {
        
        self.filtered = [self.flightArr filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF contains[c] 'RoundTrip'"]];
        NSDictionary *data = self.filtered[indexPath.row];
        
        RoundTripCell *cell = [tableView dequeueReusableCellWithIdentifier:@"roundTrip"];
        cell.departureCityIn.text = [data objectForKey:@"origin"];
        cell.departureTimeIn.text = [data objectForKey:@"departureTime"];
        cell.arrivingCityIn.text = [data objectForKey:@"destination"];
        cell.arrivingTimeIn.text = [data objectForKey:@"arrivalTime"];
        cell.flightClassOut.text = [data objectForKey:@"class"];
        cell.passCountOut.text = [NSString stringWithFormat:@"%@ %@", @"Passengers:", [NSString stringWithFormat:@"%@", [data objectForKey:@"passenger"]]];
        
        cell.departureCityOut.text = [data objectForKey:@"originBack"];
        cell.departureTimeOut.text = [data objectForKey:@"departureTime"];
        cell.arrivingCityOut.text = [data objectForKey:@"destinationBack"];
        cell.arrivingTimeOut.text = [data objectForKey:@"arrivalTime"];
        cell.flightClassIn.text = [data objectForKey:@"class"];
        cell.passCountIn.text = [NSString stringWithFormat:@"%@ %@", @"Passengers:", [NSString stringWithFormat:@"%@", [data objectForKey:@"passenger"]]];
        
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)changeSwitch:(id)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    if ([mySwitch isOn]) {
        NSLog(@"its on!");
    } else {
        NSLog(@"its off!");
    }
    [self.tableView reloadData];
}
@end
