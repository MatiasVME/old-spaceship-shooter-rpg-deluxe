extends Node

func new_score(score):
	Persistence.load_data()
	Persistence.data["Score"] = score
	Persistence.save_data()

func is_high_score(score):
	if Persistence.data["Score"] < score:
		return true
	
	return false

func new_time(level, time):
	Persistence.load_data()
	Persistence.data["Time"][level] = time
	Persistence.save_data()

func is_low_time(level, time):
	if not Persistence.data["Time"].has(level) or Persistence.data["Time"][level] < time:
		return true
	
	return false

func delete_score():
	Persistence.reset_file()