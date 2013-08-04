//
//  KYUserTableViewCell.m
//  Kai
//
//  Created by Shola Oyedele on 8/3/13.
//  Copyright (c) 2013 Shola Oyedele. All rights reserved.
//

#import "KYUserTableViewCell.h"

@implementation KYUserTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(IBAction)timelineButtonTapped:(id)sender
{
   //navigate to timeline view
}

@end
