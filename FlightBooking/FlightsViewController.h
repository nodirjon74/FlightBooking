//
//  FlightsViewController.h
//  FlightBooking
//
//  Created by Nodir on 29/07/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlightsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

-(NSArray *) doSomethingWithTheJson;

@property (weak, nonatomic) NSArray *flightArr;

@end

NS_ASSUME_NONNULL_END
