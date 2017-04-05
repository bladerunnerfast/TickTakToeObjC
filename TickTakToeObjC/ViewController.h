//
//  ViewController.h
//  TickTakToeObjC
//
//  Created by James Smith on 04/01/2017.
//  Copyright © 2017 James Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *player1Lbl;
@property (weak, nonatomic) IBOutlet UILabel *player2Lbl;
@property (weak, nonatomic) IBOutlet UILabel *playerRoundLbl;
@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UIImageView *img2;
@property (weak, nonatomic) IBOutlet UIImageView *img3;
@property (weak, nonatomic) IBOutlet UIImageView *img4;
@property (weak, nonatomic) IBOutlet UIImageView *img5;
@property (weak, nonatomic) IBOutlet UIImageView *img6;
@property (weak, nonatomic) IBOutlet UIImageView *img7;
@property (weak, nonatomic) IBOutlet UIImageView *img8;
@property (weak, nonatomic) IBOutlet UIImageView *img9;
- (IBAction)startBtn:(id)sender;
- (IBAction)resetBtn:(id)sender;
- (IBAction)exitBtn:(id)sender;

-(void)verifyGameStatus;
-(void)resetGame;
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)evt;
-(void)PlayersTurn;

//-(void)Score;
-(void)verifyBoardStatus;
-(void)endGameScoreBoard:(NSString*)Msg1;
-(void)setToDefault;


@end
