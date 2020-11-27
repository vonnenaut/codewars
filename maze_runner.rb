# maze_runner.rb
# PEDAC practice #51

# Problem
# Examples/Test Cases
# Data Structure
# Algorithm
# Code


# Problem & Examples
#####################
=begin
Welcome Adventurer. Your aim is to navigate the maze and reach the finish point without touching any walls. Doing so will kill you instantly! 

  You will be given a 2D array of the maze and an array of directions. Your task is to follow the directions given. If you reach the end point before all your moves have gone, you should return Finish. If you hit any walls or go outside the maze border, you should return Dead. If you find yourself still in the maze after using all the moves, you should return Lost. 

0 = Safe place to walk
1 = Wall
2 = Start Point
3 = Finish Point

Rules
1. The Maze array will always be square i.e. N x N but its size and content will alter from test to test.
2. The start and finish positions will change for the final tests.
3. The directions array will always be in upper case and will be in the format of N = North, E = East, W = West and S = South.
=end


# Data Structure
##################
=begin
input -- a maze as a coded set of integers described above and stored as a 2-d array; a set of directions, capital letters for the cardinal directions, stored in a 1-dimensional array.

output -- one of three stings representing the end state after directions are followed through the maze:
  'Dead' for hitting a wall or going outside the maze; 
  'Lost' for still being in the maze at the end of following the directions;
  'Finish' for getting to the end of the maze.
=end


# Algorithm
###############
=begin
# Variables:
position (index of maze position, an integer, always starts at 2 and 3 is the finish)
current_direction (current candinal direction to follow next, index and value from directions, or possibly just index)

# Methods:
get_next_direction
completed_directions?
check_position
  is_lost?
  is_finished?
  is_dead?
move

# Logic: 
Instantiate position = 2
current_direction = directions[0]
LOOP get_next_direction --> current_direction
  move(current_direction)
    check_position(position)
      is_dead? --> return 'Dead'
      completed_directions?
        is_finished? --> return 'Finished'
        is_lost?  --> return 'Lost'
END LOOP
=end


# Code
#########
def get_start_location(maze)
  end_idx = maze.first.length - 1

  (0..end_idx).each do |row|
    (0..end_idx).each do |col|
      return [row, col] if maze[row][col] == 2
    end
  end
end

def check_position(maze, position)
  boundary = maze.first.length-1

  return 'Dead' if position[0] > boundary || position[0] < 0 || position[1] > boundary || position[1] < 0 || maze[position[0]][position[1]] == 1
  return 'Finish' if maze[position[0]][position[1]] == 3
  return position
end

def move(maze, position, direction)
  case direction
  when 'N' then position[0] -= 1
  when 'S' then position[0] += 1
  when 'E' then position[1] += 1
  when 'W' then position[1] -= 1
  end

  check_position(maze, position)
end

def maze_runner(maze, directions)
  position = get_start_location(maze)

  directions.each do |current_direction|
    position = move(maze, position, current_direction) if !['Dead', 'Finish'].include? position
  end
  return 'Lost' if !['Dead', 'Finish'].include? position
  return position
end


# Test Cases
#############
maze = [[1,1,1,1,1,1,1],
        [1,0,0,0,0,0,3],
        [1,0,1,0,1,0,1],
        [0,0,1,0,0,0,1],
        [1,0,1,0,1,0,1],
        [1,0,0,0,0,0,1],
        [1,2,1,0,1,0,1]]

# get_start_location
# position = get_start_location(maze)
# direction = 'N'
# p "position: #{position}"

# check_position
# position = [0, 0]
# p check_position(maze, position) == 'Dead'
# position = [1, 6]
# p check_position(maze, position) == 'Finish'

# move
# p position = get_start_location(maze)
# direction = 'N'
# p position = move(maze, position, direction)
# direction = 'E'
# p position = move(maze, position, direction)
# direction = 'N'
# p position = move(maze, position, direction)

# 
# p maze_runner(maze,["N","N","N","N","N","E","E","E","E","E"]) =="Finish"
# p maze_runner(maze,["N","N","N","N","N","E","E","S","S","E","E","N","N","E"]) == "Finish"
p maze_runner(maze,["N","N","N","N","N","E","E","E","E","E","W","W"]) == "Finish"
# p maze_runner(maze,["N","N","N","W","W"]) == "Dead"
# p maze_runner(maze,["N","N","N","N","N","E","E","S","S","S","S","S","S"]) == "Dead"
# p maze_runner(maze,["N","E","E","E","E"]) == "Lost"
