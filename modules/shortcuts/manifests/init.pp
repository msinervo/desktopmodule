class shortcuts {

	file { '/home/matilda/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml':
		content => template('shortcuts/xfce4-keyboard-shortcuts.xml'),
	}
}
