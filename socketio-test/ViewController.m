//
//  ViewController.m
//  socketio-test
//
//  Created by 伏見 遼平 on 2014/06/02.
//  Copyright (c) 2014年 伏見 遼平. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.


    // socket.io サーバに接続
    AZSocketIO *socket = [[AZSocketIO alloc] initWithHost:@"localhost" andPort:@"9000" secure:NO];

    // 接続完了
    [socket connectWithSuccess:^{
        // hello イベント (なかみは "dsj") を送信
        [socket emit:@"hello" args:@"dsj" error:nil];
    } andFailure:^(NSError *error) {
        NSLog(@"Error: %@", error);
    }];

    // 解析結果のイベントリスナを設定
    [socket setEventRecievedBlock:^(NSString *eventName, id data) {
        // eventName と data の組がやってくる
        NSLog(@"%@ : %@", eventName, data);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
