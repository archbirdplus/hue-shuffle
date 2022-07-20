
The object of the game I Love Hue is to sort the shuffled tiles via two-tile swaps to follow the gradients established by anchor tiles.
The score for one level is the number of swaps taken to place all of the tiles in their intended position, subject to minimization.

Although the naive player algorithm to solve the level is optimal, there is a large variation in the minimum score for different instances of the same level, which makes the game less competitive.
The function `scramble` provided here solves the problem by providing an algorithm that scrambles levels such that all possible outputs have the same best score.

