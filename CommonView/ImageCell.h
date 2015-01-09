//
//  ImageCell.h
//  PicCard
//
//  Created by ZR.Faisal on 8/29/14.
//  Copyright (c) 2014 Audacity IT Solution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *labelFolderName;

@end
