import 'dart:html';
import 'dart:math';
import 'dart:collection';

CanvasElement canvas;
CanvasRenderingContext2D ctx;

const int CELL_SIZE = 10;


void main() {
  canvas = querySelector('Canvas');
  ctx = canvas.getContext('2d');

}

// Allows for drawing on the board
void draw( Point coord, String color){
  ctx..fillStyle = color;
  ctx..strokeStyle = "white"; // Don't know about this, its was ..strokeStyle instead.

  final int x = coord.x * CELL_SIZE;
  final int y = coord.y * CELL_SIZE;

  ctx..fillRect(x, y,CELL_SIZE, CELL_SIZE);
  ctx..strokeRect(x, y, CELL_SIZE, CELL_SIZE);

}

// This Fuction clears the board. and sets it back to (0,0)
void clear(){
  ctx..fillStyle = "white";
  ctx..fillRect(0, 0, canvas.width, canvas.height);
}

// this is to set up keybaord input for the game
class keyBoard{
  HashMap<int, num >_keys = new HashMap<int,num>();
  
  //listens and responding to they keypress
  Keyboard() {
    //put input into the hashmap. 
    window.onKeyDown.listen((KeyboardEvent event) {
      _keys.putIfAbsent(event.keyCode, () => event.timeStamp);
    });

    // this removes the keystroke from the hashmap. 
    window.onKeyUp.listen((KeyboardEvent event) {
      _keys.remove(event.keyCode);
    });
  }

  //This is boolean that keeps track if the key was pushed or not.
   bool isPressed(int keyCode) =>
    _keys.containsKey(keyCode);
}

// creating the nature/elts of the snake for this game.
class Snek{
  static const Point L = const Point(-1,0);
  static const Point R = const Point(1,0);
  static const Point U = const Point(0,-1);
  static const Point D = const Point(0,1);

  static  Point snekHead = const Point(5,5);
  static  Point moveRight = const Point(1,0);

  Point  newSnekHead = snekHead + moveRight; // pt(6,5)

  static const int START_LEN = 6;

  // this is the body of the snek.
  List<Point> _body;

  // Starting the snek on the right side.
  Point _dir = R;

  //The const of the snake for the game.
  // this will put the snake on the board.

  Snek(){ // What in the heck is going on here?
    int i = START_LEN -1 ;
    //mostly what the heck is going on down here??
    _body = new List<Point>.generate(START_LEN, (int index) => new Point (i--,0));
  }

  // this gets the starting point of the head.
  Point get head => _body.first;

}

//This is gonna be for the snek movement.

void _checkInput(){
  
}
