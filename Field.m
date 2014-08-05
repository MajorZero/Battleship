#import "Field.h"

@implementation Field

//getter
-(NSString*) fieldX:(NSUInteger)coordX
                  Y:(NSUInteger)coordY
{
    return field[coordX][coordY];
}
//setter
-(void) setField:(NSString*)content
               X:(NSUInteger)coordX
               Y:(NSUInteger)coordY
{
    field[coordX][coordY]=content;
}

-(Field*) init
{
    
    for(NSUInteger x=0; x<10;x++)
    {
        for(NSUInteger y=0; y<10; y++)
        {
            NSString *s=@"0";
            [self setField:s X:x Y:y];
        }
    }
    
    field[0][0]=@"X";
    
    field[0][1]=@"A";
    field[0][2]=@"B";
    field[0][3]=@"C";
    field[0][4]=@"D";
    field[0][5]=@"E";
    field[0][6]=@"F";
    field[0][7]=@"G";
    field[0][8]=@"H";
    field[0][9]=@"I";
    
    field[1][0]=@"1";
    field[2][0]=@"2";
    field[3][0]=@"3";
    field[4][0]=@"4";
    field[5][0]=@"5";
    field[6][0]=@"6";
    field[7][0]=@"7";
    field[8][0]=@"8";
    field[9][0]=@"9";
    
    fleet=[[NSMutableArray alloc]init];
    
    return self;
}

-(id)fleet:(NSUInteger)n
{
    return [fleet objectAtIndex:n];
}

-(id) fleetById:(NSString*)anId
{
    id boat;
    for(NSUInteger i=0; i<[fleet count]; i++)
    {
        if([[[self fleet:i]bodyId]isEqualToString:anId])
        {
            boat=[self fleet:i];
        }
    }
    return boat;
}

-(void) setOnFleet:(Boat*)aBoat
{
    [fleet insertObject:aBoat atIndex:0];
}

-(void) display
{
    for(NSUInteger x=0; x<10; x++)
    {
        for(NSUInteger y=0; y<10; y++)
        {
            const char *c=[[self fieldX:x Y:y] UTF8String];
            printf("[%s]", c);
        }
    printf("\n");
    }
}

-(void)displayFleet
{
    for(NSUInteger i=0; i<[fleet count]; i++)
    {
        [[self fleet:i]displayBoat];
    }
}

-(void)insertBoat:(Boat*)aBoat
{
    
    NSUInteger x=[aBoat coordX];
    NSUInteger y=[aBoat coordY];
    
    if([[aBoat direction]isEqualToString:@"v"])
    {
        
        for(NSUInteger i=0; i<[aBoat bodySize]; i++)
        {
            if(![[self fieldX:x Y:y]isEqualToString:@"0"])
            {
                NSLog(@"BOAT %@ OVER BOAT %@!", [aBoat bodyId], [self fieldX:x Y:y]);
                [self createStandardFleet];
            }
            else
            {
                [self setField:[aBoat bodyAtN:i] X:x Y:y];
                x++;
            }
        }
    }
    else if([[aBoat direction]isEqualToString:@"o"])
    {
        for(NSUInteger i=0; i<[aBoat bodySize]; i++)
        {
            if(![[self fieldX:x Y:y]isEqualToString:@"0"])
            {
                NSLog(@"BOAT %@ OVER BOAT %@!", [aBoat bodyId], [self fieldX:x Y:y]);
                [self createStandardFleet];
            }
            else
            {
                [self setField:[aBoat bodyAtN:i] X:x Y:y];
                y++;
            }
        }
    }
    else
    {
        NSLog(@"Direction not clear!");
    }
    [self setOnFleet:aBoat];
}

-(void)shotAtX:(NSUInteger)coordX
             Y:(NSUInteger)coordY
{
    if(!([[self fieldX:coordX Y:coordY]isEqualToString:@"0"]))
    {
        id boat=[self fleetById:[self fieldX:coordX Y:coordY]];
        
        if([[boat direction]isEqualToString:@"v"])
        {
            NSUInteger hit=coordX-[boat coordX];
            [boat shot:hit];
        }
        else
        {
            NSUInteger hit=coordY-[boat coordY];
            [boat shot:hit];
        }
    }
    [self setField:@"9" X:coordX Y:coordY];
}

-(NSUInteger)elaborateRandomCoord;
{
    NSUInteger i=arc4random()%10;
    if(i==0)
    {
        [self elaborateRandomCoord];
    }
    else
    {
    //NSLog(@"Random number is: %ld", i);
    }
    return i;
}

-(void)createStandardFleet;
{
    NSUInteger x=[self elaborateRandomCoord];
    NSUInteger y=[self elaborateRandomCoord];
    NSUInteger z=[self elaborateRandomCoord];
    NSString *dir=@"";
    
    if(z%2)
    {
        dir=@"v";
    }
    else
    {
        dir=@"o";
    }

    Boat *myBoat=[[Boat alloc]initWithSize:([fleet count]+2) ID:[NSString stringWithFormat: @"%lu", ([fleet count]+1)] coordX:x coordY:y direction:dir];
    
    if((x+[myBoat bodySize])>10)
    {
        [self createStandardFleet];
    }
    else if((y+[myBoat bodySize])>10)
    {
        [self createStandardFleet];
    }
    else
    {
        [self insertBoat:myBoat];
    }
}


@end
