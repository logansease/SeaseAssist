//
//  SATableViewController.m
//  SeaseAssist
//
//  Created by Logan Sease on 12/12/15.
//  Copyright © 2015 Logan Sease. All rights reserved.
//

#import "SATableViewController.h"

#import "UIAlertView+Helpers.h"
#import "UIAlertController+Helpers.h"
#import "UIViewController+Top.h"
#import "UILabel+Message.h"


@interface SATableViewController ()

@end

@implementation SATableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
        return 4;
    }
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
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
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        [UIAlertView showWithTitle:@"That Was Easy" andMessage:@"A 1 Liner for a popup. how cool!"];
    }
    else if(indexPath.row == 1)
    {
        //note you don't even need to pass in a from ViewController... it will figure it out on its own!
        [UIAlertController showDialogWithTitle:@"So simple" andMessage:@"We can even get an alert controller with 1 line!" from:nil andActions:@[@"I love it", @"I Hate it", @"Whatever"] completionHandler:^(NSInteger selected) {
            [UIAlertView showWithTitle:@"You Pressed" andMessage:[NSString stringWithFormat:@"%li",selected]];
        }];
    }
    else if(indexPath.row == 2)
    {
        UIViewController * top = [UIViewController topViewController];
        [UIAlertView showWithTitle:@"Found the top" andMessage:[NSString stringWithFormat:@"Top VC is a %@",[top class]]];
    }
    else if(indexPath.row == 3)
    {
        [UILabel showMessage:@"Cheers!" ofSize:18 ofColor:[UIColor blueColor] inView:self.view.window forDuration:1.5];
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
