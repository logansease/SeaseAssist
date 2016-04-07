//
//  SATableViewController.m
//  SeaseAssist
//
//  Created by Logan Sease on 12/12/15.
//  Copyright © 2015 Logan Sease. All rights reserved.
//

#import "SATableViewController.h"
#import "ValuePickerTextField.h"
#import "UITextField+Toolbar.h"

//move this into your pch (precompiled header file) so you don't have to include this
//#import "SeaseAssist.h"

@interface SATableViewController ()

@end

@implementation SATableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view hideKeyboardOnClick];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0)
    {
        return 11;
    }
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString * identifier = @"Cell";
    
    if(indexPath.row == 8)
    {
        identifier = @"DatePickerCell";
    }
    else if(indexPath.row == 9)
    {
        identifier = @"ValuePickerCell";
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.detailTextLabel.text = @"";
    
    // Configure the cell...
    if(indexPath.row == 0)
    {
        cell.textLabel.text = @"UIAlertView Helper";
    }
    else if(indexPath.row == 1)
    {
        cell.textLabel.text = @"UIAlertController Helper";
    }
    else if(indexPath.row == 2)
    {
        cell.textLabel.text = @"Find the top ViewController from anywhere!";
    }
    else if(indexPath.row == 3)
    {
        cell.textLabel.text = @"Make a toast!";
    }
    else if(indexPath.row == 4)
    {
        cell.textLabel.text = @"Progress Indicator";
    }
    else if(indexPath.row == 5)
    {
        cell.textLabel.text = @"Speak!";
    }
    else if(indexPath.row == 6)
    {
        cell.textLabel.text = @"Sounds";
    }
    else if(indexPath.row == 7)
    {
        cell.textLabel.text = @"Check Network Connection";
    }
    else if(indexPath.row == 8)
    {
        
    }
    else if(indexPath.row == 9)
    {
        ValuePickerTextField * field = [cell viewWithTag:1];
        field.values = @[@"Select 1", @"2"];
        [field addToolbarWithLeftButton:@"LeftAction" withSelector:@selector(left) andRightButton:@"right" withSelector:@selector(right) andTarget:self];
        field.currentValue = @"2";
    }
    else if(indexPath.row == 10)
    {
        cell.textLabel.text = [[UIDevice currentDevice]uniqueDeviceIdentifier];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(indexPath.row == 0)
    {
        [UIAlertController  showAlertWithTitle:@"That Was Easy" andMessage:@"A 1 Liner for a popup. how cool!" from:self];
    }
    else if(indexPath.row == 1)
    {
        //note you don't even need to pass in a from ViewController... it will figure it out on its own!
        [UIAlertController showDialogWithTitle:@"So simple" andMessage:@"We can even get an alert controller with 1 line!" from:nil andActions:@[@"I love it", @"I Hate it", @"Whatever"] completionHandler:^(NSInteger selected) {
            [UIAlertController showAlertWithTitle:@"You Pressed" andMessage:[NSString stringWithFormat:@"%li",selected] from:self];
        }];
    }
    else if(indexPath.row == 2)
    {
        UIViewController * top = [UIViewController topViewController];
        [UIAlertController showAlertWithTitle:@"Found the top" andMessage:[NSString stringWithFormat:@"Top VC is a %@",[top class]] from:self];
    }
    else if(indexPath.row == 3)
    {
        [UILabel showMessage:@"Cheers!" ofSize:18 ofColor:[UIColor blueColor] inView:self.view.window forDuration:1.5];
    }
    else if(indexPath.row == 4)
    {
        [SAMBProgressHUD showWithTitle:@"Testing!"];
        SAMBProgressHUD * hud = [SAMBProgressHUD commonHUD];
        [hud performSelector:@selector(hide:) withObject:[NSNumber numberWithBool:YES] afterDelay:3];
    }
    else if(indexPath.row ==5)
    {
        [[SpeechService sharedService]speakText:@"Sease Assist"];
    }
    else if(indexPath.row == 6)
    {
        [SoundService playSoundAtPath:@"Click.wav"];
    }
    else if(indexPath.row == 7)
    {
        NSString * status = [ReachabilityTest connected] ? @"Connected" : @"No Connection";
        [UIAlertController showAlertWithTitle:@"Network Status" andMessage:status from:self];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//these are called by the textField + Toolbar
-(void)left{
             
}

-(void)right{}

@end
