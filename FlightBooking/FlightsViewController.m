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
    
    return self.flightArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [self setFlightArr:[self doSomethingWithTheJson]];
    OneWayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"oneWay"];
    NSDictionary *data = self.flightArr[indexPath.row];
    NSLog(@"Data %@", data);
    cell.departureCity.text = [data objectForKey:@"origin"];
    cell.departureTime.text = [data objectForKey:@"departureTime"];
    cell.arrivingCity.text = [data objectForKey:@"destination"];
    cell.arrivingTime.text = [data objectForKey:@"arrivalTime"];
    return cell;
}


- (NSArray *)doSomethingWithTheJson {
    NSDictionary *dict = [self JSONFromFile];
    

    NSArray *flight = [dict objectForKey:@"flights"];
    NSLog(@"JSON %@", flight);

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

@end
