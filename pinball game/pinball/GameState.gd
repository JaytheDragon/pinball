extends Node

var money = 0
var hiscore = 0
var balls_left = 3
var escape_part_cost = 2500

var double = false

func check_win_condition():
	return money >= 800

func check_lose_condition():
	return balls_left <= 0 and money < escape_part_cost

func check_win_condition_2():
	return money >= 2500
	
func check_win_condition_3():
	return money >= 5000
