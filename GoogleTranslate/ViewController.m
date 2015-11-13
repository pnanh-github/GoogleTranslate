//
//  ViewController.m
//  GoogleTranslate
//
//  Created by ADMIN on 11/10/15.
//  Copyright © 2015 Nhat Tung Media. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/NSJSONSerialization.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtEng;
- (IBAction)Translate:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtVN;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Translate:(id)sender {
    NSString *apiKEY = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://pnanh.azurewebsites.net/translate_api.txt"] encoding:NSUTF8StringEncoding error:nil];
    NSString *data = [self.txtEng.text stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    NSURL *url =[NSURL URLWithString:[NSString stringWithFormat:@"https://translate.yandex.net/api/v1.5/tr.json/translate?key=%@&text=%@&lang=en-vi&format=plain",apiKEY,data]];
    NSError *error=nil;
    //NSString *string = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    if(error!=nil){
        NSLog(@"Error: %@",error);
    }
    //NSLog(@"%@",string);
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:url] options:0 error:nil];
    NSString *string = [[dict objectForKey:@"text"] objectAtIndex:0];
    NSLog(@"%@",string);
    self.txtVN.text = string;
}
@end
