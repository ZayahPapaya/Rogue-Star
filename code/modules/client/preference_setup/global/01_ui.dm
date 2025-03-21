/datum/category_item/player_setup_item/player_global/ui
	name = "UI"
	sort_order = 1

/datum/category_item/player_setup_item/player_global/ui/load_preferences(var/savefile/S)
	S["UI_style"]				>> pref.UI_style
	S["UI_style_color"]			>> pref.UI_style_color
	S["UI_style_alpha"]			>> pref.UI_style_alpha
	S["ooccolor"]				>> pref.ooccolor
	S["tooltipstyle"]			>> pref.tooltipstyle
	S["client_fps"]				>> pref.client_fps
	S["ambience_chance"] 		>> pref.ambience_chance
	S["tgui_fancy"]				>> pref.tgui_fancy
	S["tgui_lock"]				>> pref.tgui_lock
	S["tgui_input_mode"]		>> pref.tgui_input_mode
	S["tgui_input_lock"]		>> pref.tgui_input_lock
	S["tgui_large_buttons"]		>> pref.tgui_large_buttons
	S["tgui_swapped_buttons"]	>> pref.tgui_swapped_buttons
	S["chat_timestamp"]			>> pref.chat_timestamp

/datum/category_item/player_setup_item/player_global/ui/save_preferences(var/savefile/S)
	S["UI_style"]				<< pref.UI_style
	S["UI_style_color"]			<< pref.UI_style_color
	S["UI_style_alpha"]			<< pref.UI_style_alpha
	S["ooccolor"]				<< pref.ooccolor
	S["tooltipstyle"]			<< pref.tooltipstyle
	S["client_fps"]				<< pref.client_fps
	S["ambience_chance"] 		<< pref.ambience_chance
	S["tgui_fancy"]				<< pref.tgui_fancy
	S["tgui_lock"]				<< pref.tgui_lock
	S["tgui_input_mode"]		<< pref.tgui_input_mode
	S["tgui_input_lock"]		<< pref.tgui_input_lock
	S["tgui_large_buttons"]		<< pref.tgui_large_buttons
	S["tgui_swapped_buttons"]	<< pref.tgui_swapped_buttons
	S["chat_timestamp"]			<< pref.chat_timestamp

/datum/category_item/player_setup_item/player_global/ui/sanitize_preferences()
	pref.UI_style			= sanitize_inlist(pref.UI_style, all_ui_styles, initial(pref.UI_style))
	pref.UI_style_color		= sanitize_hexcolor(pref.UI_style_color, initial(pref.UI_style_color))
	pref.UI_style_alpha		= sanitize_integer(pref.UI_style_alpha, 0, 255, initial(pref.UI_style_alpha))
	pref.ooccolor			= sanitize_hexcolor(pref.ooccolor, initial(pref.ooccolor))
	pref.tooltipstyle		= sanitize_inlist(pref.tooltipstyle, all_tooltip_styles, initial(pref.tooltipstyle))
	pref.client_fps			= sanitize_integer(pref.client_fps, 0, MAX_CLIENT_FPS, initial(pref.client_fps))
	pref.ambience_chance 	= sanitize_integer(pref.ambience_chance, 0, 100, initial(pref.ambience_chance)) // 0-100 range.
	pref.tgui_fancy			= sanitize_integer(pref.tgui_fancy, 0, 1, initial(pref.tgui_fancy))
	pref.tgui_lock			= sanitize_integer(pref.tgui_lock, 0, 1, initial(pref.tgui_lock))
	pref.tgui_input_mode	= sanitize_integer(pref.tgui_input_mode, 0, 1, initial(pref.tgui_input_mode))
	pref.tgui_input_lock	= sanitize_integer(pref.tgui_input_lock, 0, 1, initial(pref.tgui_input_lock))
	pref.tgui_large_buttons	= sanitize_integer(pref.tgui_large_buttons, 0, 1, initial(pref.tgui_large_buttons))
	pref.tgui_swapped_buttons	= sanitize_integer(pref.tgui_swapped_buttons, 0, 1, initial(pref.tgui_swapped_buttons))
	pref.chat_timestamp		= sanitize_integer(pref.chat_timestamp, 0, 1, initial(pref.chat_timestamp))

/datum/category_item/player_setup_item/player_global/ui/content(var/mob/user)
	. = "<b>UI Style:</b> <a href='?src=\ref[src];select_style=1'><b>[pref.UI_style]</b></a><br>"
	. += "<b>Custom UI</b> (recommended for White UI):<br>"
	. += "-Color: <a href='?src=\ref[src];select_color=1'><b>[pref.UI_style_color]</b></a>�[color_square(hex = pref.UI_style_color)]�<a href='?src=\ref[src];reset=ui'>reset</a><br>"
	. += "-Alpha(transparency): <a href='?src=\ref[src];select_alpha=1'><b>[pref.UI_style_alpha]</b></a>�<a href='?src=\ref[src];reset=alpha'>reset</a><br>"
	. += "<b>Tooltip Style:</b> <a href='?src=\ref[src];select_tooltip_style=1'><b>[pref.tooltipstyle]</b></a><br>"
	. += "<b>Client FPS:</b> <a href='?src=\ref[src];select_client_fps=1'><b>[pref.client_fps]</b></a><br>"
	. += "<b>Ambience Chance:</b> <a href='?src=\ref[src];select_ambience_chance=1'><b>[pref.ambience_chance]</b></a><br>"
	. += "<b>TGUI Window Mode:</b> <a href='?src=\ref[src];tgui_fancy=1'><b>[(pref.tgui_fancy) ? "Fancy (default)" : "Compatible (slower)"]</b></a><br>"
	. += "<b>TGUI Window Placement:</b> <a href='?src=\ref[src];tgui_lock=1'><b>[(pref.tgui_lock) ? "Primary Monitor" : "Free (default)"]</b></a><br>"
	. += "<b>TGUI Input Framework:</b> <a href='?src=\ref[src];tgui_input_mode=1'><b>[(pref.tgui_input_mode) ? "Enabled" : "Disabled (default)"]</b></a><br>"
	. += "<b>TGUI Input Lock:</b> <a href='?src=\ref[src];tgui_input_lock=1'><b>[(pref.tgui_input_lock) ? "Enabled" : "Disabled (default)"]</b></a><br>"
	. += "<b>TGUI Large Buttons:</b> <a href='?src=\ref[src];tgui_large_buttons=1'><b>[(pref.tgui_large_buttons) ? "Enabled (default)" : "Disabled"]</b></a><br>"
	. += "<b>TGUI Swapped Buttons:</b> <a href='?src=\ref[src];tgui_swapped_buttons=1'><b>[(pref.tgui_swapped_buttons) ? "Enabled" : "Disabled (default)"]</b></a><br>"
	. += "<b>Chat Timestamps:</b> <a href='?src=\ref[src];chat_timestamps=1'><b>[(pref.chat_timestamp) ? "Enabled" : "Disabled (default)"]</b></a><br>"
	if(can_select_ooc_color(user))
		. += "<b>OOC Color:</b>"
		if(pref.ooccolor == initial(pref.ooccolor))
			. += "<a href='?src=\ref[src];select_ooc_color=1'><b>Using Default</b></a><br>"
		else
			. += "<a href='?src=\ref[src];select_ooc_color=1'><b>[pref.ooccolor]</b></a> [color_square(hex = pref.ooccolor)]<a href='?src=\ref[src];reset=ooc'>reset</a><br>"

/datum/category_item/player_setup_item/player_global/ui/OnTopic(var/href,var/list/href_list, var/mob/user)
	if(href_list["select_style"])
		var/UI_style_new = tgui_input_list(user, "Choose UI style.", "Character Preference", all_ui_styles, pref.UI_style)
		if(!UI_style_new || !CanUseTopic(user)) return TOPIC_NOACTION
		pref.UI_style = UI_style_new
		return TOPIC_REFRESH

	else if(href_list["select_color"])
		var/UI_style_color_new = input(user, "Choose UI color, dark colors are not recommended!", "Global Preference", pref.UI_style_color) as color|null
		if(isnull(UI_style_color_new) || !CanUseTopic(user)) return TOPIC_NOACTION
		pref.UI_style_color = UI_style_color_new
		return TOPIC_REFRESH

	else if(href_list["select_alpha"])
		var/UI_style_alpha_new = tgui_input_number(user, "Select UI alpha (transparency) level, between 50 and 255.", "Global Preference", pref.UI_style_alpha, 255, 50)
		if(isnull(UI_style_alpha_new) || (UI_style_alpha_new < 50 || UI_style_alpha_new > 255) || !CanUseTopic(user)) return TOPIC_NOACTION
		pref.UI_style_alpha = UI_style_alpha_new
		return TOPIC_REFRESH

	else if(href_list["select_ooc_color"])
		var/new_ooccolor = input(user, "Choose OOC color:", "Global Preference") as color|null
		if(new_ooccolor && can_select_ooc_color(user) && CanUseTopic(user))
			pref.ooccolor = new_ooccolor
			return TOPIC_REFRESH

	else if(href_list["select_tooltip_style"])
		var/tooltip_style_new = tgui_input_list(user, "Choose tooltip style.", "Global Preference", all_tooltip_styles, pref.tooltipstyle)
		if(!tooltip_style_new || !CanUseTopic(user)) return TOPIC_NOACTION
		pref.tooltipstyle = tooltip_style_new
		return TOPIC_REFRESH

	else if(href_list["select_client_fps"])
		var/fps_new = tgui_input_number(user, "Input Client FPS (1-200, 0 uses server FPS)", "Global Preference", pref.client_fps, 200, 0)
		if(isnull(fps_new) || !CanUseTopic(user)) return TOPIC_NOACTION
		if(fps_new < 0 || fps_new > MAX_CLIENT_FPS) return TOPIC_NOACTION
		pref.client_fps = fps_new
		if(pref.client)
			pref.client.fps = fps_new
		return TOPIC_REFRESH
	/* //RS Edit. See PR #67 for reference. Commenting this out to prevent href hacks.
	else if(href_list["select_ambience_freq"])
		var/ambience_new = tgui_input_number(user, "Input how often you wish to hear ambience repeated! (1-60 MINUTES, 0 for disabled)", "Global Preference", pref.ambience_freq, 60, 0)
		if(isnull(ambience_new) || !CanUseTopic(user)) return TOPIC_NOACTION
		if(ambience_new < 0 || ambience_new > 60) return TOPIC_NOACTION
		pref.ambience_freq = ambience_new
		return TOPIC_REFRESH
	*/
	else if(href_list["select_ambience_chance"])
		var/ambience_chance_new = tgui_input_number(user, "Input the chance you'd like to hear ambience played to you (On area change, or by random ambience). 35 means a 35% chance to play ambience. This is a range from 0-100. 0 disables ambience playing entirely. This is also affected by Ambience Frequency.", "Global Preference", pref.ambience_chance, 100, 0) //RS Edit: Fixes what it defaults to.
		if(isnull(ambience_chance_new) || !CanUseTopic(user)) return TOPIC_NOACTION
		if(ambience_chance_new < 0 || ambience_chance_new > 100) return TOPIC_NOACTION
		pref.ambience_chance = ambience_chance_new
		return TOPIC_REFRESH

	else if(href_list["tgui_fancy"])
		pref.tgui_fancy = !pref.tgui_fancy
		return TOPIC_REFRESH

	else if(href_list["tgui_lock"])
		pref.tgui_lock = !pref.tgui_lock
		return TOPIC_REFRESH

	else if(href_list["tgui_input_mode"])
		pref.tgui_input_mode = !pref.tgui_input_mode
		return TOPIC_REFRESH

	else if(href_list["tgui_input_lock"])
		pref.tgui_input_lock = !pref.tgui_input_lock
		return TOPIC_REFRESH

	else if(href_list["tgui_large_buttons"])
		pref.tgui_large_buttons = !pref.tgui_large_buttons
		return TOPIC_REFRESH

	else if(href_list["tgui_swapped_buttons"])
		pref.tgui_swapped_buttons = !pref.tgui_swapped_buttons
		return TOPIC_REFRESH

	else if(href_list["chat_timestamps"])
		pref.chat_timestamp = !pref.chat_timestamp
		return TOPIC_REFRESH

	else if(href_list["reset"])
		switch(href_list["reset"])
			if("ui")
				pref.UI_style_color = initial(pref.UI_style_color)
			if("alpha")
				pref.UI_style_alpha = initial(pref.UI_style_alpha)
			if("ooc")
				pref.ooccolor = initial(pref.ooccolor)
		return TOPIC_REFRESH

	return ..()

/datum/category_item/player_setup_item/player_global/ui/proc/can_select_ooc_color(var/mob/user)
	return config.allow_admin_ooccolor && check_rights(R_ADMIN|R_EVENT|R_FUN, 0, user)
