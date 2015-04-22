//
//  BoxCollectionViewController.m
//  MemoryBox
//
//  Created by Samia Al Rahmani on 4/18/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "BoxCollectionViewController.h"
#import "AddBoxViewController.h"
#import "BoxCollectionViewCell.h"
#import "UIKit/UIKit.h"
#import "Box.h"

@interface BoxCollectionViewController ()

@property (nonatomic, strong) RLMResults *array;
@property (nonatomic, strong) RLMNotificationToken *notification;

@end

@implementation BoxCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.array = [Box allObjects];
    
    // Set realm notification block
    __weak typeof(self) weakSelf = self;
    self.notification = [RLMRealm.defaultRealm addNotificationBlock:^(NSString *note, RLMRealm *realm) {
        [weakSelf.collectionView reloadData];
    }];
    [self.collectionView reloadData];

    // self.clearsSelectionOnViewWillAppear = NO;
    
//    UIImage *myImage = [UIImage imageNamed:@"drawerIcon.png"];
//    NSData *data = [NSData dataWithData:UIImagePNGRepresentation(myImage)];
//    
//    Box *box1 = [[Box alloc] init];
//    box1.boxName = @"Samya";
//    box1.imageData = data;
//
//    Box *box2 = [[Box alloc] init];
//    box2.boxName = @"Sam";
//    box2.imageData = data;
//    
//    self.boxArray = @[box1, box2];
    
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:@"BoxCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"Cell"];
}

//#pragma mark - AddObjectVCDelegate
//
//- (void)addTask:(Todo *)task{
//    [self.todoItems addObject:task];
//    [self.tableView reloadData];
//}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([[segue identifier] isEqualToString:@"showDetail"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        Todo *object = self.todoItems[indexPath.row];
    
//        [[segue destinationViewController] setDetailItem:object];
     if ([[segue identifier] isEqualToString:@"addBox"]) {
        AddBoxViewController *addBoxVC = [segue destinationViewController];
//        addBoxVC.delegate = self;
     }
}

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
    return [self.array count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BoxCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    Box *box = self.array[indexPath.item];
    cell.boxNameLabel.text = [box boxName];
    cell.boxImageView.image = [UIImage imageWithData:[box imageData]];
    NSLog(@"%@", NSStringFromCGRect(cell.boxImageView.frame));
    NSLog(@"%@", NSStringFromCGRect(cell.boxNameLabel.frame));

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   // [self performSegueWithIdentifier:<#(NSString *)#> sender:<#(id)#>]
}

- (void)add
{
    RLMRealm *realm = RLMRealm.defaultRealm;
    [realm beginWriteTransaction];
    //    UIImage *myImage = [UIImage imageNamed:@"drawerIcon.png"];
    //    NSData *data = [NSData dataWithData:UIImagePNGRepresentation(myImage)];
    //
    //    Box *box1 = [[Box alloc] init];
    //    box1.boxName = @"Samya";
    //    box1.imageData = data;

    [Box createInRealm:realm withObject:@[[self randomString], [self randomDate]]];
    [realm commitWriteTransaction];
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
