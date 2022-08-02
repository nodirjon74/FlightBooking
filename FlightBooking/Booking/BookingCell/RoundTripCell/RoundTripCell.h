//
//  RoundTripCell.h
//  FlightBooking
//
//  Created by Nodir on 28/07/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RoundTripCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *departureCityOut;
@property (weak, nonatomic) IBOutlet UILabel *departureTimeOut;
@property (weak, nonatomic) IBOutlet UILabel *arrivingCityOut;
@property (weak, nonatomic) IBOutlet UILabel *arrivingTimeOut;
@property (weak, nonatomic) IBOutlet UILabel *flightClassOut;
@property (weak, nonatomic) IBOutlet UILabel *passCountOut;


@property (weak, nonatomic) IBOutlet UILabel *departureCityIn;
@property (weak, nonatomic) IBOutlet UILabel *departureTimeIn;
@property (weak, nonatomic) IBOutlet UILabel *arrivingCityIn;
@property (weak, nonatomic) IBOutlet UILabel *arrivingTimeIn;
@property (weak, nonatomic) IBOutlet UILabel *flightClassIn;
@property (weak, nonatomic) IBOutlet UILabel *passCountIn;

@end

NS_ASSUME_NONNULL_END
