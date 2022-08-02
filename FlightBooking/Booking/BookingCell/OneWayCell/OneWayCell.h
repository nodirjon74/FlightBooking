//
//  OneWayCell.h
//  FlightBooking
//
//  Created by Nodir on 28/07/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OneWayCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *departureCity;
@property (weak, nonatomic) IBOutlet UILabel *departureTime;
@property (weak, nonatomic) IBOutlet UILabel *arrivingCity;
@property (weak, nonatomic) IBOutlet UILabel *arrivingTime;
@property (weak, nonatomic) IBOutlet UILabel *flightClass;
@property (weak, nonatomic) IBOutlet UILabel *passCount;

@end

NS_ASSUME_NONNULL_END
