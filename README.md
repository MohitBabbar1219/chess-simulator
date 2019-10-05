# Chess Simulator

## Initial Setup

### 1. Setting up ruby-2.5.3 (Using rbenv)
For setting up `rbenv`, follow the steps on
[Github rbenv](https://github.com/rbenv/rbenv) <br/>
Or <br/>
Check if `rbenv` is already installed using: <br/>
`rbenv -v` <br/>

Install ruby-2.5.3: <br/>
`rbenv install 2.5.3`

### 2. Resolving dependencies
Check if `bundler` already exists <br/>
`bundle -v` <br/>
Or <br/>
Install Bundler <br/>
`gem install bundler`

Change directory to the correct path: <br/>
`cd <clone-directory>` <br/>
Then run: <br/>
`bundle install`

## Running the tests
Change directory to the correct path: <br/>
`cd <clone-directory>` <br/>
Then run: <br/>
`rspec --format doc`

## Running the code
Change directory to the correct path: <br/>
`cd <clone-directory>/lib` <br/>
Then run: <br/>
`ruby chess.rb` <br/>
Further instructions will be displayed on screen, which are as follows: <br/>
- Board dimensions are 8x8 starting from (0,0) to (7,7).
- Initial state of the game is same as a new chess game.
- To move a piece from one position to another, enter the command `<from-x-coordinate>,<from-y-coordinate>:<to-x-coordinate>,<to-y-coordinate>`. Eg. <br/>
`3,4:4,5` <br/>
Entering the aforesaid command will move the piece at position (3, 4) to position (5, 6).
- After every move, a json string will be printed on the screen.
- To visualize the state of the board, Copy the aforesaid json, visit https://chess-simulator.herokuapp.com/ and paste it there.

## The Visualizer Web App
[Chess State Visualizer Github](https://github.com/MohitBabbar1219/chess-state-visualizer)
