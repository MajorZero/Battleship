#import <Foundation/Foundation.h>
#import "Boat.h"


@interface Field : NSObject
{
    NSString *field [10][10];
    NSMutableArray *fleet;
}

//getter
-(NSString*) fieldX:(NSUInteger)coordX
                  Y:(NSUInteger)coordY;
//setter
-(void) setField:(NSString*)content
               X:(NSUInteger)coordX
               Y:(NSUInteger)coordY;
-(Field*) init;

-(id)fleet:(NSUInteger)n;

-(id)fleetById:(NSString*)anId;

-(void) setOnFleet:(Boat*)aBoat;

-(void) display;

-(void) displayFleet;

-(void)insertBoat:(Boat*)aBoat;

-(void)shotAtX:(NSUInteger)coordX
             Y:(NSUInteger)coordY;

-(NSUInteger)elaborateRandomCoord;

-(void)createStandardFleet;

@end
