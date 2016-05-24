//
//  ViewController.m
//  https://github.com/c6357/YUChineseSorting
//
//  Created by BruceYu on 15/4/19.
//  Copyright (c) 2015年 BruceYu. All rights reserved.
//

#import "ViewController.h"
#import "ChineseString.h"

@interface ViewController ()
@property(nonatomic,strong)NSMutableArray *indexArray;
@property(nonatomic,strong)NSMutableArray *letterResultArr;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSArray *stringsToSort=[NSArray arrayWithObjects:
                            @{@"name":@"zhangsan",@"image":@""},@{@"name":@"李四",@"image":@""},@{@"name":@"王五",@"image":@"屏幕快照"},@{@"name":@"王五",@"image":@"屏幕快照"},@{@"name":@"王五",@"image":@"屏幕快照"},@{@"name":@"王五",@"image":@"屏幕快照"},@{@"name":@"王五",@"image":@"屏幕快照"},@{@"name":@"王五",@"image":@"屏幕快照"},@{@"name":@"王五",@"image":@"屏幕快照"},@{@"name":@"王五",@"image":@"屏幕快照"},
                            nil];
    
    self.indexArray = [ChineseString IndexArray:stringsToSort];
    self.letterResultArr = [ChineseString LetterSortArray:stringsToSort];
    
    
}


#pragma mark -
#pragma mark - UITableViewDataSource

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.indexArray;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *key = [self.indexArray objectAtIndex:section];
    return key;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.indexArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.letterResultArr objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.imageView.image=[UIImage imageNamed:[[self.letterResultArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row][@"image"]];
    cell.textLabel.text = [[self.letterResultArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row][@"name"];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return index;
}

#pragma mark - 
#pragma mark - UITableViewDelegate
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    lab.backgroundColor = [UIColor grayColor];
    lab.text = [self.indexArray objectAtIndex:section];
    lab.textColor = [UIColor whiteColor];
    return lab;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"---->%@",[[self.letterResultArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row][@"name"]);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:[[self.letterResultArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row][@"name"]
                                                   delegate:nil
                                          cancelButtonTitle:@"YES" otherButtonTitles:nil];
    [alert show];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
