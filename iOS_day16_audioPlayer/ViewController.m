//
//  ViewController.m
//  iOS_day16_audioPlayer
//
//  Created by Student 5 on 27/09/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
int flag=0;
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.songs=[[NSArray alloc]initWithObjects:@"01 - Kala Chashma",@"01 - Sau Tarah Ke - Dishoom [DJMaza.Cool]",@"Chalti Hai Kya 9 Se 12-(Mr-Jatt.com)",@"Befikra",@"Cheez Badi (Machine)",@"Oonchi Hai Building-(Mr-Jatt.com)",@"Tu Hai Ki Nahi (Roy) - Ankit Tiwari -320Kbps",nil];
    self.url=[[NSBundle mainBundle]URLForResource:self.songName withExtension:@"mp3"];
    //NSURL *url=[[NSBundle mainBundle]URLForResource:self.selectedSong withExtension:@"mp3"];
    //self.songName=@"01 - Kala Chashma.mp3";
    self.audioPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:self.url error:nil];
    self.audioPlayer.volume=3;
    self.timeSlider.minimumValue=0;
    self.timeSlider.maximumValue=self.audioPlayer.duration;
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.songs.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text=[self.songs objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.audioPlayer.currentTime >0)
    {
        self.audioPlayer.currentTime=0;
        [self.audioPlayer stop];
    }
    
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    self.songName=cell.textLabel.text;
    self.nameLabel.text=self.songName;
    self.url=[[NSBundle mainBundle]URLForResource:self.songName withExtension:@"mp3"];
    self.audioPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:self.url error:nil];
    self.audioPlayer.volume=3;
    self.timeSlider.minimumValue=0;
    self.timeSlider.maximumValue=self.audioPlayer.duration;

    
}

- (IBAction)playButton:(id)sender
{
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(seekTime) userInfo:nil repeats:YES];
    self.audioPlayer.currentTime=self.timeSlider.value;
    [self.audioPlayer play];
    //self.nameLabel.text=self.songName;
    flag=0;
}

-(void)seekTime
{
    if(flag==0)
    {
        self.timeSlider.value=self.timeSlider.value+1;
    }
}

- (IBAction)pauseButton:(id)sender
{
    [self.audioPlayer pause];
    flag=2;
}

- (IBAction)stopButton:(id)sender
{
    [self.audioPlayer stop];
    self.timeSlider.value=0;
    self.nameLabel.text=@" ";
    flag=1;
}

- (IBAction)volumeButton:(id)sender
{
    self.audioPlayer.volume=self.volumeSlider.value;
}

- (IBAction)timeButton:(id)sender
{
    self.audioPlayer.currentTime=self.timeSlider.value;

}

@end
