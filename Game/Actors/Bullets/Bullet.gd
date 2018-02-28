extends RigidBody2D

export (int) var damage = 1

export (int) var bullet_amount = -1 # -1 Cantidad infinita de balas
export (int) var is_normal_bullet = true

export (int) var velocity = 600

enum BulletOwner {PLAYER, ENEMY}
var bullet_owner = BulletOwner.ENEMY

func normal_impulse():
	if bullet_owner == BulletOwner.ENEMY:
		apply_impulse(Vector2(0,0), Vector2(0, velocity))
	else:
		apply_impulse(Vector2(0,0), Vector2(0, -velocity))