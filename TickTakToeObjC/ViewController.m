//
//  ViewController.m
//  TickTakToeObjC
//
//  Created by James Smith on 01/06/2014.
//  Copyright © 2017 James Smith. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end
@implementation ViewController

//Prepare segments and images stored in memory ready for use.
@synthesize img1, img2, img3, img4, img5, img6, img7, img8, img9;
UIImage *image, *player1img, *player2img;//Temp image storage of players tile.
//Set defaults ready for game play.
int turn = 0;
bool win = false;
char *pl = false;
int rounds = 0;
int play1 = 0;
int play2 = 0;
BOOL lockup = true;
const int Val = 9;
bool validate[Val] = {false, false, false, false, false, false, false, false, false};
//Game Matrix (Games Map). Used to store where a player has selected 1 of the 9 segments of the game board. Store F representing First player,
//S representing Secound Player.
const int ROW = 3;
const int COL = 3;
//2 D array represents rows and columns, simulating a table like format. Data is stored using index of row value and value of column value.
//Data is retrieved in the same way.
char board [ROW][COL] = {{'0', '0', '0'},
                         {'0', '0', '0'},
                         {'0', '0', '0'}};

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Load images into memory ready for use.
    player1img = [UIImage imageNamed:@"GreenRubber.png"];
    player2img = [UIImage imageNamed:@"RedRubber.png"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)PlayersTurn{
    NSString *showRound = [NSString stringWithFormat:@"%d", rounds];
    _playerRoundLbl.text = showRound;
    if(win == false){//if true players cannot carry on playing.
        switch(turn){
                //temp image changes based on who's go is next.
                //Used later to give image to UIImage.
                //switch playersTurn over to the next player, function will automatically go into
                //next case providing next players setup ready, including colour of players label,
                //pl being an String type letter which will later be stored in matrix.
                //switch over to next player ready for next players turn.
            case 1:
                image = player1img;//store in temp memory icon for player.
                _player1Lbl.textColor = [UIColor redColor];//change colour of text, indicating who's turn is next.
                _player2Lbl.textColor = [UIColor blackColor];
                pl = "F";
                turn = 2;
                break;
            case 2:
                image = player2img;
                _player2Lbl.textColor = [UIColor greenColor];
                _player1Lbl.textColor = [UIColor blackColor];
                pl = "S";
                turn = 1;
                break;
            default:
                //error handling.
                break;
        }
    }
}


//check for any touches/taps have taken place.
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)evt
{
    
    UITouch *tap = [[evt allTouches] anyObject];//provide access to all forms of touches/taps.
    if(lockup == false){//ensure players should select a segment or not.
        //check which segment has been touched, and pass on which segment had been touched.
        //Lock up segment once been used.
        
        //check touch/tap against each segment, for example touch==segment, this is done due to the touch checks checking all possible touch locations on the screen, the code below checks the lcoations against the locations of each UIImage.
        //validate is used to act as a locking system, once an segment has been touched already, players should not be able to touch it again, otherwise the image will be changed based on next players turn.
        //Call ControlMoves passing values 1 to 9.
        if(CGRectContainsPoint([img1 frame], [tap locationInView:self.view])&&(validate[0] == false)){
            [self ControlMoves:1];
        }else if(CGRectContainsPoint([img2 frame], [tap locationInView:self.view])&&(validate[1] == false)){
            [self ControlMoves:2];
        }else if(CGRectContainsPoint([img3 frame], [tap locationInView:self.view])&&(validate[2] == false)){
            [self ControlMoves:3];
        }else if(CGRectContainsPoint([img4 frame], [tap locationInView:self.view])&&(validate[3] == false)){
            [self ControlMoves:4];
        }else if(CGRectContainsPoint([img5 frame], [tap locationInView:self.view])&&(validate[4] == false)){
            [self ControlMoves:5];
        }else if(CGRectContainsPoint([img6 frame], [tap locationInView:self.view])&&(validate[5] == false)){
            [self ControlMoves:6];
        }else if(CGRectContainsPoint([img7 frame], [tap locationInView:self.view])&&(validate[6] == false)){
            [self ControlMoves:7];
        }else if(CGRectContainsPoint([img8 frame], [tap locationInView:self.view])&&(validate[7] == false)){
            [self ControlMoves:8];
        }else if(CGRectContainsPoint([img9 frame], [tap locationInView:self.view])&&(validate[8] == false)){
            [self ControlMoves:9];
        }
    }
    
}


-(void)ControlMoves:(int)segment{
    
    switch(segment){
            //segments (1, 2 ,3).
        case 1:
            img1.image = image;//alloc image already stored in temp memory.
            validate[0] = true;//lock touch/tap checks after already been touched/tapped.
            //call playturn function to change player kept false at this point.
            //update matrix after a move has been taken.
            //call next function to check if game needs to carry on playing or not.
            board[0][0] =* pl;
            [self verifyGameStatus];
            break;
        case 2:
            img2.image = image;
            validate[1] = true;
            board[0][1] =* pl;
            [self verifyGameStatus];
            break;
        case 3:
            img3.image = image;
            validate[2] = true;
            board[0][2] =* pl;
            [self verifyGameStatus];
            break;
            //segments (4,5,6).
        case 4:
            img4.image = image;
            validate[3] = true;
            board[1][0] =* pl;
            [self verifyGameStatus];
            break;
        case 5:
            img5.image = image;
            validate[4] = true;
            board[1][1] =* pl;
            [self verifyGameStatus];
            break;
        case 6:
            img6.image = image;
            validate[5] = true;
            board[1][2] =* pl;
            [self verifyGameStatus];
            break;
            //segments (7,8,9).
        case 7:
            img7.image = image;
            validate[6] = true;
            board[2][0] =* pl;
            [self verifyGameStatus];
            break;
        case 8:
            img8.image = image;
            validate[7] = true;
            board[2][1] = *pl;
            [self verifyGameStatus];
            break;
        case 9:
            img9.image = image;
            validate[8] = true;
            board[2][2] =* pl;;
            [self verifyGameStatus];
            break;
    }
}

-(char)ScoreManager
{
    //Definiation.
    //Segment 1= row 0, column 0 ,segment 2=row 0, column 1, segment 3=row 0, column 2.
    //Segment 4= row 1, column 0 ,segment 5=row 1, column 1, segment 6=row 1, column 2.
    //Segment 7= row 2, column 0 ,segment 8=row 2, column 1, segment 9=row 2, column 2.
    for (int h = 0; h < 3; h ++){//increment Row, scanning through
        //horz checks.
        //Row 0, Column 0, Row 0 Column 1, Row 0, column 2 = match on first row.
        //Row 1, Column 0, Row 1 Column 1, Row 1, column 2 = match on 2nd row.
        //Row 2, Column 0, Row 2 Column 1, Row 2, column 2 = match on 3rd row.
        if(board[h][0] == 'F' && board[h][1] == 'F' && board[h][2] == 'F'){//row checks for player 1.
            return 'F';//Return players symbol.
        }else if(board[h][0] == 'S' && board[h][1] =='S' && board[h][2] == 'S'){//player checks for player 2.
            return 'S';
        }
    }
    //Row 0, Column 0, Row 1 Column 0, Row 2, column 0 = match on first column.
    //Row 0, Column 1, Row 1 Column 1, Row 2, column 1 = match on 2nd column.
    //Row 0, Column 2, Row 1 Column 2, Row 2, column 2 = match on 3rd column.
    for(int v = 0;v < 3; v++){
        if(board[0][v] =='F' && board[1][v] == 'F' && board[2][v] == 'F'){
            return 'F';
        }else if(board[0][v] == 'S' && board[1][v] == 'S' && board[2][v] == 'S'){
            return 'S';
        }
    }   //diagonal
    ////Row 0, Column 0, Row 1 Column 1, Row 2, column 2 = match on 1+5+9.
    //Row 0, Column 2, Row 1 Column 1, Row 2, column 0 = match on 3+5+7.
    if((board[0][0] == 'F' && board[1][1] == 'F' && board[2][2] == 'F')||
       (board[0][2] == 'F' && board[1][1] == 'F' && board[2][0] == 'F')){
        return 'F';
    }else if((board[0][0] == 'S' && board[1][1] == 'S' && board[2][2] == 'S')||
             (board[0][2] == 'S' && board[1][1] == 'S' && board[2][0] == 'S')){
        return 'S';
    }
    return '0';
}

//set values when a round has been won.
-(void)verifyBoardStatus{
    if([self ScoreManager] == 'F'){//player 1.
        win = true;
        rounds ++;
        play1 ++;
        NSString* player1Txt = [NSString stringWithFormat:@"%@ %i",@"Player 1 ", play1];
        _player1Lbl.text = player1Txt;
        [self checkRound:@"player1 won" roundCount:play1];
    }else if([self ScoreManager] == 'S'){//player2.
        win = true;
        rounds ++;
        play2 ++;
        NSString* player2Txt = [NSString stringWithFormat:@"%@ %i",@"Player 2 ", play2];
        _player2Lbl.text = player2Txt;
        [self checkRound:@"player2 won" roundCount:play2];
        //check if all segments has been touched, at this point no wins have taken place, resulting in a draw.
    }else if (validate[0] == true && validate[1] == true && validate[2] == true && validate[3] == true && validate[4] == true
              && validate[5] == true && validate[6] == true && validate[7] == true && validate[8] == true){
        [self checkRound:@"Draw" roundCount: 0];
    }else{
        [self PlayersTurn];
    }
}


- (IBAction)startBtn:(id)sender {
    //Preset game ready for player 1 to take their turn.
    lockup = false;
    turn = 1;
    image = player1img;//store in temp memory icon for player.
    _player1Lbl.textColor = [UIColor redColor];//change colour of text, indicating who's turn is next.
    _player2Lbl.textColor = [UIColor blackColor];
    pl = "F";
}

- (IBAction)resetBtn:(id)sender {
    [self resetGame];//Invoke reset.
}

- (IBAction)exitBtn:(id)sender {
    exit(0);//Close App.
}

-(void)resetGame{
    //reset all variables, ready for new game, after reset button has been touched.
    rounds = 0;
    lockup = true;
    _playerRoundLbl.text = @"0";
    play1 = 0;
    play2 = 0;
    _player1Lbl.text = @"Player 1";
    _player2Lbl.text = @"Player 2";
    [self setToDefault];//call other function to reset rest of the board.
}

//Reset most of the board to default, ready for next round also called by resetGame function.
-(void)setToDefault{//used to reset game play of board after each round and rest game board
    //after reset button as been touched.
    img1.image = NULL, img2.image = NULL, img3.image = NULL, img4.image = NULL,
    img5.image = NULL, img6.image = NULL, img7.image = NULL, img8.image = NULL,
    img9.image = NULL;
    
    for(int i = 0;i < 9; i++){//reset validation.
        validate[i] = false;
    }
    //reset game metrix.
    for(int i = 0;i < 3; i++){
        for(int k = 0; k < 3; k++){
            board[i][k] = '0';//reset all of array to 0 ready for next game.
        }
    }
    
    _player1Lbl.textColor = [UIColor blackColor];
    _player2Lbl.textColor = [UIColor blackColor];
    win = false;
}

//Check players score, round before deciding if game should carry on playing, if game is finished, pass string with players round count to alert view, displaying all scores indicating total score.

-(void)checkRound:(NSString*)plas roundCount:(int)counts{
    
    if((rounds <= 3 && play1 != play2) || (rounds <= 3 && play1 == play2)){
        [self endGameScoreBoard:plas];
    }else if(rounds > 3 && play1 != play2){
        NSString *winMsg = [NSString stringWithFormat:@"%@ %@  %d %@ %@ %d", @"player 1", @"SCORED", play1,@"player 2 ", @"SCORED", play2];
        [self EndRoundMessage:winMsg];
    } else if (rounds > 3 && play1 == play2){
        turn = 0;
        lockup = true;
        NSString *winMsg = [NSString stringWithFormat:@"%@", @"Both players has tided "];
        [self EndRoundMessage:winMsg];
    }
    for(int i = 0;i < 9; i++){//reset validation.
        validate[i] = true;
    }
}

-(void)verifyGameStatus{//double check if someone has won or not.
    
    if(win == false){
        [self verifyBoardStatus];
    }else if(win == true) {//we have a winner.
        turn = 0;//stop game play.
        lockup = true;//lock up touches around game play area.
        for(int i = 0; i < 9; i++){//lock up any untouched segments.
            validate[i] = true;
        }
    }
}


-(void)EndRoundMessage:(NSString*)theWinner{//Display final results.
    
    UIAlertView* Mess2 = [[UIAlertView alloc]
                        initWithTitle:@"ScoreBoard" message:theWinner
                        delegate:self cancelButtonTitle:@"Exit Game"otherButtonTitles:@"Okay", nil];
    [Mess2 show];
}


-(void)endGameScoreBoard:(NSString*)Msg1{//display results of round played.
    
    NSString* messages = [NSString stringWithFormat:@"%@ %@ %d", Msg1, @"round ", rounds];
    
    UIAlertView* Mess = [[UIAlertView alloc]
                       initWithTitle:@"ScoreBoard" message:messages
                       delegate:self cancelButtonTitle:@"Exit Game"
                       otherButtonTitles:@"Next", nil];
    [Mess show];
}

//check alert views buttons for a change, call functions to setup game for next round, or exit game if exit button has been pressed.
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == [alertView cancelButtonIndex]){
        exit(0);
    }else if([alertView buttonTitleAtIndex:buttonIndex=1]){
        if(rounds <= 3){
            [self setToDefault];
            [self PlayersTurn];
        }
    }
}
@end
