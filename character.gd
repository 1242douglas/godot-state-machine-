extends "res://play.gd"

export var total := 2
var jumps := 0

func _process(delta: float) -> void:
	match state:
		StateMachine.IDLE: _state_idle(delta)
		StateMachine.WALK: _state_walk(delta)
		StateMachine.JUMP: _state_jump(delta)
		StateMachine.FAll: _state_fall(delta)
		StateMachine.JUMP2: _state_jump2(delta)
		StateMachine.ATK1: _state_atk1(delta)
		StateMachine.ATK2: _state_atk2(delta)
		StateMachine.ATK3: _stete_atk3(delta)
		StateMachine.DASHA: _stete_dasha(delta)
		
		
func _state_idle(delta: float ) -> void:
	_set_animation("idle")
	_apply_grivity(delta)
	_stop_movemet()
	
	if enter:
		jumps = 0
	
	
	if direction:
		_enter_state(StateMachine.WALK)
		
	elif Input.is_action_just_pressed("ui_jump"):
		_enter_state(StateMachine.JUMP)
		
	elif Input.is_action_just_pressed("ui_atk"):
		_enter_state(StateMachine.ATK1)
		
	elif Input.is_action_just_pressed("go"):
		_enter_state(StateMachine.DASHA)
					
	
	
	
	
	
func _state_walk(delta: float) -> void:
	_set_animation("wolk")
	_apply_grivity(delta)
	_move_and_slide(delta)
	_set_flip()
	
	if not direction:
		_enter_state(StateMachine.IDLE)
		
	elif Input.is_action_just_pressed("ui_jump") and total > jumps:
		_enter_state(StateMachine.JUMP2)
		
		
	elif Input.is_action_just_pressed("ui_atk"):
		_enter_state(StateMachine.ATK1)
		
	elif Input.is_action_just_pressed("go"):
		_enter_state(StateMachine.DASHA)				
		
		
func _state_jump(delta: float) -> void:
	_set_animation("jump")
	_apply_grivity(delta)
	_move_and_slide(delta)
	_set_flip()
	if enter:
		enter = false
		motion.y = -jump
		jumps += 1
	if motion.y > 0:
		_enter_state(StateMachine.FAll)
		
	if Input.is_action_just_pressed("ui_jump") and total > jumps:
		_enter_state(StateMachine.JUMP2)	
		
			






func _state_fall(delta: float) -> void:
	_set_animation("fall")
	_apply_grivity(delta)
	_move_and_slide(delta)
	_set_flip()
	
	if is_on_floor():
		_enter_state(StateMachine.IDLE)
		
	if Input.is_action_just_pressed("ui_jump") and total > jumps:
		_enter_state(StateMachine.JUMP2)	
		
		
		
		
		
func _state_jump2(delta: float) -> void:
	_set_animation("jump2")
	_apply_grivity(delta)
	if enter:
		enter = false
		motion.y = - jump
		jumps += 1
	
	
	if motion.y > 0:
		_enter_state(StateMachine.FAll)
		
	if Input.is_action_just_pressed("ui_jump") and total > jumps:
		jumps += 1
		motion.y = -jump
		
		
func _state_atk1(delta: float) -> void:
	_set_animation("atk1")
	_stop_movemet()
	
	if enter:
		enter = false
		timer_atk.wait_time = 1
		timer_atk.start()
		
	if Input.is_action_just_pressed("ui_atk"):
		timer_atk.stop()
		_enter_state(StateMachine.ATK2)	
		
func _state_atk2(delta: float) -> void:
	_set_animation("atk2")
	_stop_movemet()
	
	if enter:
		enter = false
		timer_atk.wait_time = 0.5
		timer_atk.start()
		
	if Input.is_action_just_pressed("ui_atk"):
		timer_atk.stop()
		_enter_state(StateMachine.ATK3)		
		
	
	
	
									
func _stete_atk3(delta: float) -> void:
	_set_animation("atk3")
	_stop_movemet()
	
	if enter:
		enter = false
		timer_atk.start()
		
		
func _stete_dasha(delta: float) -> void:
	_set_animation("dash")
	_move_and_slide(delta)
	
	if enter:
		enter = false
		timer_dash.wait_time = 0.3
		timer_dash.start()
		
	
	motion.x + 50 or   motion.x - 50
	if 	Input.is_action_just_pressed("go"):
		timer_atk.stop()			
						
	
	
	
			
	
	
