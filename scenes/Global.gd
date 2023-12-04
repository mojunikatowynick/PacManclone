extends Node

signal stat_changed
var game_play: bool = false
var pacman_pos
var marker_red_pos
var marker_yellow_pos
var marker_blue_pos
var marker_pink_pos
var g_restart_marker_pos
var big_dot_eaten: bool = false
var dot_remaining: int = 242


var lives: int = 3:
	set(value):
		lives = value
		stat_changed.emit()

var score: int = 0:
	set(value):
		score = value
		stat_changed.emit()

