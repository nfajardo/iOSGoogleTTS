//
//  ViewController.m
//  iOSGoogleTTS
//
//  Created by Nelson Fajardo on 8/08/13.
//  Copyright (c) 2013 BeautifulChaos. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) AVPlayer *player;
@end

@implementation ViewController

@synthesize player = _player;
@synthesize playButton=_playButton;
@synthesize pickerView=_pickerView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSArray *arrayToLoadPicker = [[NSArray alloc] initWithObjects:@"es",@"en", nil];
    languages_array= arrayToLoadPicker;
     [_language_tf setInputView:_pickerView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)play:(id)sender {
    NSString* escapedUrlString = [_texto.text stringByAddingPercentEscapesUsingEncoding: NSASCIIStringEncoding];
    
    if([escapedUrlString length]>0 && [_language_tf.text length]>0)
    {
        [_playButton setEnabled:NO];
        NSString *_sound =[NSString stringWithFormat:@"http://translate.google.com/translate_tts?tl=%@&q=%@",_language_tf.text,escapedUrlString];
        NSURL *_url =[[NSURL alloc] initWithString:_sound];
        
        _player = [[AVPlayer alloc] initWithURL:_url];
        [_player play];
        
        _player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(PlayerItemDidReachEnd:)
                                                     name:AVPlayerItemDidPlayToEndTimeNotification
                                                   object:[_player currentItem]];

        
    }
}

-(void)PlayerItemDidReachEnd:(NSNotification *)notification
{
     [_playButton setEnabled:YES];
        AVPlayerItem *p = [notification object];
        [p seekToTime:kCMTimeZero];
}
#pragma mark - Picker View delegates

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [languages_array count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [languages_array objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    NSString *message = [NSString stringWithFormat:@"%@",[languages_array objectAtIndex:row]];
    _language_tf.text = message;
    [_language_tf resignFirstResponder];

}
@end
