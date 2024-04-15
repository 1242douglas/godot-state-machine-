extends KinematicBody2D

enum StateMachine {IDLE, WALK, JUMP, FAll, JUMP2, ATK1, ATK2, ATK3, DASHA}

export var speed := 100
export var jump := 150
export var gravity := 98

var state = StateMachine.IDLE
var motion := Vector2()
var animation := ""
var direction := 0
var enter = true


onready var sprite : Sprite = get_node("Sprite")
onready var animator : AnimationPlayer = get_node("AnimationPlayer")
onready var timer_atk : Timer = get_node("attack")
onready var timer_dash : Timer = get_node("tep")

func _process(delta: float) -> void:
	direction = Input.get_axis("t", "u")


func _physics_process(delta: float) -> void:
	motion = move_and_slide(motion, Vector2.UP)
	
	
	
	
	
func _move_and_slide(delta: float) -> void:
	motion.x = direction * speed
	
	
func _apply_grivity(delta: float) -> void:
	motion.y += gravity * delta 



func _set_animation(anim: String) -> void:
	if animation != anim:
		animation = anim
		animator.play(animation)
		
		
		
		
func _stop_movemet() -> void:
	motion.x = 0
	
	
	
	
	
	
func _set_flip() -> void:
	if direction >0 :
		sprite.flip_h = false
		
	elif direction <0:
		 sprite.flip_h = true
		
		
		
func _enter_state(new_state) -> void:
	if state != new_state:
		state = new_state
		enter = true			


func _on_attack_timeout():
	_enter_state(StateMachine.IDLE)
	



func _on_tep_timeout():
	_enter_state(StateMachine.IDLE)
