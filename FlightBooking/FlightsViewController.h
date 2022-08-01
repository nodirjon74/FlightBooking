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
@property (weak, nonatomic) IBOutlet UIDatePicker *fromCalendar;
@property (weak, nonatomic) IBOutlet UIDatePicker *toCalendar;
@property (weak, nonatomic) IBOutlet UISwitch *tripSwitch;

-(NSArray *) doSomethingWithTheJson;

@property (weak, nonatomic) NSArray *flightArr;
@property (weak, nonatomic) NSArray * filtered;

- (IBAction)changeSwitch:(id)sender;

@end

NS_ASSUME_NONNULL_END
