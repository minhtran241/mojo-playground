# ===----------------------------------------------------------------------=== #
# Tic Tac Toe Game (Learning the Basics of Mojo Language Programming)
#
# This is a simple implementation of the Tic Tac Toe game in Mojo.
# The game is played between the user and the computer. The user is represented by 1, and the computer is represented by 2.
# The user starts the game by entering a number between 1 and 9. The number represents the position on the board where the user wants to make a move.
# The computer then makes a random move on the board.
# The game continues until there is a winner or the board is full.
# The winner is determined by checking the rows, columns, and diagonals of the board.
# If the user wins, the game prints "You won".
# If the computer wins, the game prints "You lost".
# If the board is full and there is no winner, the game prints "It's a tie".
# If there is no winner, the game prints the board and continues.

# To run the game, execute the following command:
# mojo run tic_tac_toe.mojo
# Or you can build the game using the following command:
# mojo build tic_tac_toe.mojo

# Apr 2024, Minh Tran
# ===----------------------------------------------------------------------=== #

from python import Python
from collections.vector import InlinedFixedVector

var size: Int = 9


fn fill_with_0(inout board: InlinedFixedVector[Int, 9]):
    """
    Fill the board with 0s.

    Args:
        board: The board to fill with 0s. It should be a 1D array of size 9.
    """
    for i in range(9):
        board.append(0)

fn print_board(borrowed board: InlinedFixedVector[Int, 9]):
    """
    Print the board.

    Args:
        board: The board to print. It should be a 1D array of size 9.
    """
    for i in range(3):
        for j in range(3):
            print(board[i * 3 + j], end=" ")
        print()

fn validate_input(borrowed user_inp: Int) -> Bool:
    """
    Validate the user input. The input should be between 1 and 9.

    Args:
        user_inp: The user input to validate.

    Returns:
        True if the input is valid, False otherwise.
    """
    return user_inp >= 1 and user_inp <= 9

fn is_full(borrowed board: InlinedFixedVector[Int, 9]) -> Bool:
    """
    Check if the board is full.

    Args:
        board: The board to check. It should be a 1D array of size 9.

    Returns:
        True if the board is full, False otherwise.
    """
    for i in range(9):
        if board[i] == 0:
            return False
    return True

fn random_move(inout board: InlinedFixedVector[Int, 9]) raises:
    """
    Make a random move for the computer.

    Args:
        board: The board to make the move on. It should be a 1D array of size 9.
    """
    var py = Python().import_module("random")
    if is_full(board):
        print("It's a tie")
        return
    var random_number = atol(py.randint(0, 8))
    while board[random_number] != 0:
        random_number = atol(py.randint(0, 8))
    board[random_number] = 2

fn compute_winner(borrowed board: InlinedFixedVector[Int, 9]) -> Int:
    """
    Compute the winner of the game. The winner can be 0 (no winner), 1 (user), or 2 (computer).

    Args:
        board: The board to compute the winner on. It should be a 1D array of size 9.
    
    Returns:
        The winner of the game.
    """
    for i in range(3):
        if board[i * 3] == board[i * 3 + 1] and board[i * 3 + 1] == board[i * 3 + 2]:
            return board[i * 3]
        if board[i] == board[i + 3] and board[i + 3] == board[i + 6]:
            return board[i]
    if board[0] == board[4] and board[4] == board[8]:
        return board[0]
    if board[2] == board[4] and board[4] == board[6]:
        return board[2]
    return 0


fn main() raises:
    # Initialize the board.
    var vector = InlinedFixedVector[Int, 9](9)
    fill_with_0(vector)
    print_board(vector)

    # Start the game.
    var py = Python().import_module("builtins")
    while True:
        if is_full(vector):
            print("It's a tie")
            break
        # Get the user input.
        var user_inp =  atol(py.input("Enter a number between 1 and 9: "))
        # Validate the user input. If it is valid, make the move and check the winner.
        if validate_input(user_inp):
            vector[user_inp - 1] = 1
            random_move(vector)
            var winner = compute_winner(vector)
            if winner == 1:
                print("You won")
                break
            elif winner == 2:
                print("You lost")
                break
            # If there is no winner, print the board and continue the game.
            print_board(vector)
        else:
            print("Invalid input. Please enter a number between 1 and 9.")