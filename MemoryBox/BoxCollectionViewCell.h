//
//  BoxCollectionViewCell.h
//  MemoryBox
//
//  Created by Samia Al Rahmani on 4/18/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Box.h"

@interface BoxCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UIImageView *boxImageView;

@property (weak, nonatomic) IBOutlet UILabel *boxNameLabel;

@property (nonatomic, strong) Box *box;

@end
