//
//  BoxCollectionViewController.m
//  MemoryBox
//
//  Created by Samia Al Rahmani on 4/18/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "BoxCollectionViewController.h"
#import "BoxCollectionViewCell.h"
#import "UIKit/UIKit.h"
#import "Box.h"

@interface BoxCollectionViewController ()

@property NSArray *boxArray;

@end

@implementation BoxCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    UIImage *myImage = [UIImage imageNamed:@"drawerIcon.png"];
    NSData *data = [NSData dataWithData:UIImagePNGRepresentation(myImage)];
    
    Box *box1 = [[Box alloc] init];
    box1.boxName = @"Samya";
    box1.imageData = data;

    Box *box2 = [[Box alloc] init];
    box2.boxName = @"Sam";
    box2.imageData = data;
    
    self.boxArray = @[box1, box2];
    
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:@"BoxCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"Cell"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSArray *)RLMResultsToNSArray:(RLMResults *)results {
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:results.count];
    for (RLMObject *object in results) {
        [array addObject:object];
    }
//    return [NSArray arrayWithArray:(NSArray *)results];
    return array;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.boxArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BoxCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    Box *box = self.boxArray[indexPath.item];
    cell.boxNameLabel.text = [box boxName];
    cell.boxImageView.image = [UIImage imageWithData:[box imageData]];
    NSLog(@"%@", NSStringFromCGRect(cell.boxImageView.frame));
    NSLog(@"%@", NSStringFromCGRect(cell.boxNameLabel.frame));

    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
