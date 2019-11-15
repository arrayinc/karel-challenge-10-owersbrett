/* File: Challenge-10.k
 ---------------------------
In this exercise, your job is to get Karel to create a checkerboard pattern of
beepers inside an empty rectangular world.

This problem has a nice decomposition structure along with some interesting
algorithmic issues. As you think about how you will solve the problem,
you should make sure your solution works with checkerboards that are different
in size from the standard 8×8 checkerboard shown in the example. Odd-sized
checkerboards are tricky, and you should make sure that your program generates
the following pattern in a 5×3 world.

Another special case you need to consider is that of a world that is only
one column wide or one row high.
*/

import "turns";

function Solve(){
	if(frontIsBlocked()){
		if(rightIsBlocked()){
			turnAround();
			if(frontIsBlocked()){
			columnSolve();
			}
		}
	}
	checkerStraight();
}

function columnSolve(){
	turnNorth();
	checkIt();
	checkBehind();
}

function checkBehind(){
	if(noBeepersFound()){
		turnAround();
		moveC();
		if(noBeepersFound()){
			turnAround();
			moveC();
			putBeeper();
		}
	}
}

function checkIt(){
	while(frontIsClear()){
		putBeeper();
		moveC();
		moveC();
	}
}


function checkerStraight(){
	checkIt();
	check();
}

function check(){
	checkHere();
	checkEnd();
}

function checkEnd(){
	moveC();
	turnNorth();
	if(frontIsClear()){
		checkWall();
	}
	turnAround();
	moveC();
	if(noBeepersPresent()){
		turnAround();
		moveC();
		if(noBeepersPresent()){
			putBeeper();
		}
	}else{
		turnAround();
		moveC();
	}
}



function checkWall(){
	if(rightIsBlocked()){
		if(beepersPresent()){
			moveC();
			turnLeft();
			moveC();
			checkerStraight();
		}else{
			moveC();
			turnLeft();
			checkerStraight();
		}
	}
	if(frontIsClear()){
		if(leftIsBlocked()){
			if(beepersPresent()){
				moveC();
				turnRight();
				moveC();
				checkerStraight();
			}else{
				moveC();
				turnRight();
				checkerStraight();
			}
		}
	}
}

function checkHere(){
	if(noBeepersPresent()){
		if(rightIsBlocked()){
			checkBehind();
		}
	}
}

function checkBehind(){
	turnAround();
	moveC();
	if(noBeepersPresent()){
		turnAround();
		moveC();
		putBeeper();
	}else{
		turnAround();
		moveC();
	}
}



function moveC(){
	if(frontIsClear()){
		move();
	}
}

function turnNorth(){
	while(notFacingNorth()){
		turnLeft();
	}
}
