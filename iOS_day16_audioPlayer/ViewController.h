//
//  ViewController.h
//  iOS_day16_audioPlayer
//
//  Created by Student 5 on 27/09/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
- (IBAction)playButton:(id)sender;

- (IBAction)pauseButton:(id)sender;

- (IBAction)stopButton:(id)sender;

@property (strong, nonatomic) IBOutlet UISlider *volumeSlider;
- (IBAction)volumeButton:(id)sender;

@property (strong, nonatomic) IBOutlet UISlider *timeSlider;
- (IBAction)timeButton:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@property NSString *songName;

@property AVAudioPlayer *audioPlayer;

@property NSArray *songs;

@property NSURL *url;

@end

