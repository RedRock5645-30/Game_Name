extends Control

var coins: int = 0
var click_damage: int = 1
var enemy_hp: int = 10
var enemy_max_hp: int = 10

var damage_upgrade_cost: int = 10

var auto_damage: int = 0
var auto_cost: int = 25

@onready var enemy_button = $EnemyButton
@onready var coin_label = $CoinLabel
@onready var damage_label = $DamageLabel
@onready var upgrade_danage = $upgradeDamage
@onready var upgrade_auto = $upgradeAuto
@onready var auto_timer = $AutoTimer

func _ready():
	update_ui()
	auto_timer.wait_time = 1
	auto_timer.start()
	
func on_enemy_button_pressed():
	attack_enemy(click_damage)

func attack_enemy(amount: int):
	enemy_hp -= amount

	if enemy_hp <= 0:
		coins += enemy_max_hp
		enemy_max_hp = int(enemy_max_hp * 1.25)
		enemy_hp = enemy_max_hp

	update_ui()

func on_upgrade_auto_button_pressed():
	if coins >= auto_cost:
		coins -= auto_cost
		auto_damage += 1
		auto_cost = int(auto_cost * 1.6)
		update_ui()

func on_auto_timer_timeout():
	if auto_damage > 0:
		attack_enemy(auto_damage)

func update_ui():
	coin_label.text = "Coins: " + str(coins)
	damage_label.text = "Damage: " + str(click_damage) + "\nEnemy HP: " + str(enemy_hp) + "/" + str(enemy_max_hp)
	
	upgrade_danage.text = "Upgrade Click Damage - " + str(upgrade_danage)
	upgrade_auto.text = "Upgrade Auto Damage - " + str(upgrade_auto)


func _on_enemy_button_pressed() -> void:
	on_enemy_button_pressed()

func _on_upgrade_damage_pressed() -> void:
	on_upgrade_auto_button_pressed()

func _on_upgrade_auto_pressed() -> void:
	on_upgrade_auto_button_pressed()

func _on_auto_timer_timeout() -> void:
	on_auto_timer_timeout()

func save_game():
	var data = {
		"coins": coins,
		"damage_per_click": click_damage,
		"enemy_hp": enemy_hp,
		"enemy_max_hp": enemy_max_hp,
		"damage_upgrade_cost": damage_upgrade_cost,
		"auto_damage": auto_damage,
		"auto_upgrade_cost": upgrade_auto
	}

	var file = FileAccess.open("user://save.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(data))

func load_game():
	if not FileAccess.file_exists("user://save.json"):
		return

	var file = FileAccess.open("user://save.json", FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())

	if data:
		coins = data.get("coins", 0)
		click_damage = data.get("click_damage", 1)
		enemy_hp = data.get("enemy_hp", 10)
		enemy_max_hp = data.get("enemy_max_hp", 10)
		damage_upgrade_cost = data.get("damage_upgrade_cost", 10)
		auto_damage = data.get("auto_damage", 0)
		upgrade_auto = data.get("upgrade_auto", 25)
