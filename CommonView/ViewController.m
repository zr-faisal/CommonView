//
//  ViewController.m
//  CommonView
//
//  Created by Zahidur Rahman Faisal on 1/9/15.
//  Copyright (c) 2015 Zahidur Rahman Faisal. All rights reserved.
//

#import "ViewController.h"
#import "ImageCell.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labelViewType;
@property (weak, nonatomic) IBOutlet UIView *viewHolder;

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UICollectionView *collectionView;

@property (strong, nonatomic) NSMutableArray *dataSource;

@end

@implementation ViewController

static NSString *kCellID = @"ImageCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _dataSource = [NSMutableArray array];
    [_dataSource addObject:@"A"];
    [_dataSource addObject:@"B"];
    [_dataSource addObject:@"C"];
    [_dataSource addObject:@"D"];
    [_dataSource addObject:@"E"];
    [_dataSource addObject:@"F"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionGridClicked:(id)sender {
    _labelViewType.text = @"Grid View";
    
    // remove the TableView first
    if (_tableView) {
        [_tableView removeFromSuperview];
        
        _tableView.dataSource = nil;
        _tableView.delegate = nil;
        _tableView = nil;
    }
    
    // initialize the CollectionView
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, _viewHolder.frame.size.width, _viewHolder.frame.size.height) collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;

        // init cell
        UINib *cellNib = [UINib nibWithNibName:@"ImageCell" bundle:nil];
        [_collectionView registerNib:cellNib forCellWithReuseIdentifier:kCellID];
        [_collectionView setBackgroundColor:[UIColor clearColor]];
        
        [_viewHolder addSubview:_collectionView];
        [_collectionView reloadData];
    }
}

- (IBAction)actionListClicked:(id)sender {
    _labelViewType.text = @"List View";
    
    // remove the CollectionView first
    if (_collectionView) {
        [_collectionView removeFromSuperview];
        
        _collectionView.dataSource = nil;
        _collectionView.delegate = nil;
        _collectionView = nil;
    }
    
    // initialize the TableView
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, _viewHolder.frame.size.width, _viewHolder.frame.size.height)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        [_viewHolder addSubview:_tableView];
        [_tableView reloadData];
    }
}

#pragma mark - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"TableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [_dataSource objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"TableView item selected -> %ld", (long)indexPath.row);
}

#pragma mark - CollectionView
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
    cell.labelFolderName.text = [_dataSource objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(150, 150);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"CollectionView item selected -> %ld", (long)indexPath.row);    
}

@end
