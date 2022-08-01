//
//  ViewController.h
//  FlightBooking
//
//  Created by Nodir on 27/07/22.
//

#import <UIKit/UIKit.h>

@interface BookingsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *bookingsTableView;

-(NSArray *) doSomethingWithTheJson;

@property (weak, nonatomic) NSArray *flightArr;

@end

