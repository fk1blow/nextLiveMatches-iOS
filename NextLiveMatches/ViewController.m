//
//  ViewController.m
//  NextLiveMatches
//
//  Created by Dragosy on 4/25/13.
//  Copyright (c) 2013 Dragosy. All rights reserved.
//


#import "ViewController.h"
#import "EventCellView.h"
#import "SRWebSocket.h"


@interface ViewController () <SRWebSocketDelegate> {
    UIView *colorView;
}

@end

@implementation ViewController {
    SRWebSocket *_webSocket;
    NSMutableArray *_messages;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if ( self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil] )
	{
        [self populateWithParticipants];
	}
	
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    colorView = [[UIView alloc] init];
    UIColor *rowColor = [UIColor colorWithRed:0.46 green:0 blue:47 alpha:0.4];
    [colorView setBackgroundColor:rowColor];

//    [self _reconnect];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableView

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.participantsArr count];
}

- (CGFloat)tableView:(UITableView *)tableView
        heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 92.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"EventCellView";
    EventCellView *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    if ( cell == nil ) {
        NSArray *nibObject = [[NSBundle mainBundle] loadNibNamed:@"EventCellView"
                                                            owner:self
                                                          options:nil];
        cell = [nibObject objectAtIndex:0];
    }
		
	NSArray *itemsPart = [NSArray arrayWithArray:[self.participantsArr objectAtIndex:indexPath.row]];
	cell.participants.text = [NSString stringWithFormat:@"%@ - %@",
							  [itemsPart objectAtIndex:0],
							  [itemsPart objectAtIndex:1]];


//    [colorView setFrame:cell.frame];
//    [cell setSelectedBackgroundView:colorView];

    return cell;
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
//    UITableView *table = self.view;
    [(UITableView *)self.view reloadData];
}

#pragma mark Data

- (void)populateWithParticipants
{
    NSArray *first = [NSArray arrayWithObjects:@"Bayern Munich", @"FC Barcelona", nil];
    NSArray *second = [NSArray arrayWithObjects:@"Real Madrid", @"Borussia Dortmund", nil];
	NSArray *third = [NSArray arrayWithObjects:@"Chelsea London", @"Zenit St. Petersburg", nil];
    self.participantsArr = [NSArray arrayWithObjects: first, second, third, nil];
}

#pragma mark SocketRocket


- (void)_reconnect;
{
    _webSocket.delegate = nil;
    [_webSocket close];

//    NSString *url = @"ws://localhost:3000";
    NSString *url = @"ws://stage.betonvalue.com/rtfws";
    _webSocket = [[SRWebSocket alloc] initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    _webSocket.delegate = self;

    self.title = @"Opening Connection...";
    [_webSocket open];
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message;
{
    NSLog(@"Received \"%@\"", message);
}

- (void)webSocketDidOpen:(SRWebSocket *)webSocket;
{
    NSLog(@"Websocket Connected");
}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error;
{
    NSLog(@":( Websocket Failed With Error %@", error);
}

@end
