Name
	advmame, advmess, advpac - The AdvanceMAME Emulator

Synopsys
	:advmame GAME [-default] [-remove] [-log] [-listinfo]
	:	[-record FILE] [-playback FILE]

	:advpac GAME [-default] [-remove] [-log] [-listinfo]
	:	[-record FILE] [-playback FILE]

	:advmess MACHINE [images...] [-default] [-remove] [-log]
	:	[-listinfo] [-record FILE] [-playback FILE]

Description
	AdvanceMAME is an unofficial MAME version for DOS and Linux with
	an advanced video support for helping the use with TVs, Arcade
	Monitors, Fixed Frequencies Monitors and also with normal
	PC Monitors.

	The major features are:

	* Automatic creation of `perfect' video modes with the correct
		size and clock.
	* A lot of video boards supported for direct hardware registers
		programming. (see the card.txt file)
	* Support for 8, 15, 16 and 32 bits video modes.
	* Real hardware scanlines.
	* Software video image stretching by fractional factors, for
		example to play vertical games like "Pac-Man" with horizontal
		Arcade Monitors or TVs.
	* Special `blit' effects to improve the image quality in
		stretching.
	* Special `RGB' effects to simulate the aspect of a real Arcade
		Monitor.
	* Special `scale2x' effects to improve the aspect with modern
		PC Monitors.
	* Change of the video mode and other options at runtime.
	* Automatic exit after some time of inactivity.
	* Scripts capabilities to drive external devices.
	* Support of Symmetric Multi-Processing (SMP) with a multiple
		thread architecture (only for Linux).
	* Sound and video recording in WAV, PNG and MNG files.

Options
	This is the list of the available command line options:

	=GAME/MACHINE
		The game or machine to emulate. If the specified
		GAME/MACHINE is unknown, a list of possible `guesses'
		is printed.

	-default
		Add to the configuration file all the missing options
		with default values.

	-remove
		Remove from the configuration file all the options
		with default values.

	-log
		A very detailed log of operations is saved in
		a `.log' file. Very useful for debugging problems.

	-listinfo
		Outputs a very complete report of the emulated games.

	-record FILE
		Record all the game inputs in the specified file.
		The file is saved in the directory specified by the
		`dir_inp' configuration option.

	-playback FILE
		Play back the previously recorded game inputs in the
		specified file.

	On the command line you can also specify all configuration
	options with the format -OPTION ARGUMENT. For boolean options
	you don't need to specify the argument but you must use the
	-OPTION or -noOPTION format. For example:

		:advmame pacman -device_sound sb -nodisplay_scanlines

	You can use short options if they are unambigous. You can remove
	any prepending tag separated with `_' or truncate it.
	For example `-dev_cartdrige' can be written as `-dev_cart',
	`-cartdrige', `-cart', ...

Features
	This section contains a brief description of all the features
	of AdvanceMAME.

  Automatic Video Mode Generation
	AdvanceMAME has the ability to directly control your video
	board to get the best possibile video modes with always the
	correct size and aspect ratio.

	You can control how the mode are generated with the 
	`display_adjust' option. More details are in the `install.txt'
	file.

  Video Menu
	AdvanceMAME adds a new `Video' menu in MAME to change the video
	options.

	You can select the desired video mode, the resize type and the
	video effects.

	The selected option is displayed at the right side of the menu,
	the effective value used for the option is displayed in `[]'.

  Resize
	AdavanceMAME supports many software stretching types of the
	game image. Generally they are not used, because a video
	mode of the correct size is automatically generated.
	But in some conditions it isn't possible, in this case the
	image is stretched.

	There are four strech type: `none', `integer', `mixed', `fractional'.
	You can contol the type of stretching with the `display_resize' option.

	The `none' option simply disables any type of stretching.
	The `integer' option allows only integer stretching in the
	horizontal and vertical directions. For example 1x2, 2x1, 2x2.
	The `mixed' option allows integer stretching in the horizontal
	direction and fractional stretching in the vertical direction.
	For example 1x1.23, 2x1.18.
	The `fractional' option allows fractional stretching in any
	directions. For example 1.08x1.08, 1.34x1.78.

	Usually the best choice is the `mixed' option. It's very fast
	and the image quality doesn't suffer too much.

  Blit Effects
	AdvanceMAME supports many special video effects to improve
	the image quality when it's strecthed.

	There are five types of video effects: `none', `max', `mean',
	`filter' and `scale2x'. 
        You can select the favorite effect with the `display_resizeeffect'
	option.

	The `none' effect simply duplicates and removes rows and lines
	when the image is stretched.
	The `max' effect tries to save the image details displaying the
	most lighting pixels when some rows are removed.
	The `mean' effect tries to save the image details displaying the
	mean color of the pixels in the rows that need to be reduced.
	The `filter' effect applies a generic blur filter computing the
	mean color in the horizontal and vertical directions. The best
	results are when the image is stretched almost by a double
	factor. When the image is enlarged the filter is applied after
	stretching; when reduced, it's applied before.
	The `scale2x' effect add missing pixels trying to match the
	image patterns.

	The `max', `mean' and `filter' effects work only in RGB video
	modes (not palettized).
	The `scale2x' effect works only if the image is magnified by a
	factor of 2. To enable it you should also use the `magnify'
	option.

  RGB Effects
	AdvanceMAME supports also some special video effects to simulate
	the aspect of the game as displayed in an old fashion Arcade
	Monitor.

	You can simulate the RGB triads of the screen or the vertical and
	horizonal scanlines.

  Mode Selection
	In the `Video Mode' submenu you can select the favorite video
	mode.

	If you choose `auto', the best video mode is chosen
	automatically.

	You can change the active video mode pressing `,' and `.' when
	in game play.

	You can force a specific video mode with the option
	`display_mode'.

  Per Game options
	All the video options are customizable for the single
	game or for a group og games. You can also save them
	directly from the `Video Menu'.

  Scripts
	AdvanceMAME support a basic script language capable to
	control an external hardware throught the parallel port
	or keyboard led signals.

	The scripts are described in the `script.txt' file.

  Aspect Ratio Control
	AdvanceMAME tries always to display the game with the
	correct aspect ratio.

	But if you want, you can permit a small aspect error
	to enlarge the effective game image on the screen.
	It's very useful to display vertical games on an
	horizontal monitor and viceversa.

	More details are in the description of the
	`display_expand' option.

  Speed Control
	AdvanceMAME permits a special speed control of the game
	play.

	You can play the game in a faster way, skip the
	startup process at the maximum speed, or skip the
	game animations pressing a key.

	More details are in the description of the `misc_speed',
	`misc_turbospeed' and `misc_startuptime' options.

  Exit Control
	If you have a real Arcade Cabinet you can configure AdvanceMAME
	to automatically exit after some time of inactivity to save
	your monitor screen.

	For some supported games you can force the display of an
	exit menu during the game play to prevent unwanted exit.

	More details are in the description of the `misc_safequit',
	and `input_idleexit' options.

  Input Control
	AdvanceMAME support a very fine control of the mapping
	of the analog inputs on the MAME analog port.

	More details are in the description of the `input_map'
	option.

  Audio and Video Recording
	AdvanceMAME can saves the game play in .WAV audio files and
	.MNG video files.

	More details are in the description of the `record_*'
	options.

Use Cases
	This section describes some useful cases for AdvanceMAME.

  With a PC MultiSync Monitor
	On a PC MultySync monitor you can get ANY Resolution at ANY
	Vertical Frequency. In this case AdvanceMAME always generates
	a `perfect' video mode with the correct size and clock. It
	doesn't require any type of stretching.
	For example for the game "Bomb Jack" a video mode of 400x256
	at 60 Hz (perfect size and perfect frequency) is used.

  With a PC VGA Monitor/Fixed Frequency Monitor/Arcade Monitor
	On Fixed Frequency monitors you are physically limited on
	the choice of Horizontal Frequency in the video mode. In this
	case AdvanceMAME takes care of your monitor's limitations
	and in the most cases is able to use a video mode with the
	correct size but not with the correct frequency due to the
	monitor's limitations.
	For example for the game "Pac-Man" and a VGA monitor (31.5 kHz)
	a video mode of 400x288 at 100 Hz (perfect size) is used.

  With a NTSC or PAL TV
	On a TV you are physically limited to use both fixed Horizontal
	and Vertical Frequencies. This results on a prefixed number of
	rows for the video mode.
	For example for a NTSC TV you can get 240 rows (480 if
	interlaced) and for a PAL TV 288 rows (576 if interlaced).
	In this case AdvanceMAME uses a video mode with the prefixed
	number of rows but with the correct number of columns. So,
	ONLY a vertical image stretching is required.
	For example for the game "Pac-Man" on a NTSC TV a video mode
	of 400x240 (perfect horizontal size) is used.

  With a Multiformat NTSC and PAL TV
	If your TV supports both formats, AdvanceMAME automatically
	chooses the format which better fits the game requirements.
	For example for the game "Mr. Do!" a video mode of 336x240
	NTSC (perfect size) is used. For the game "Pac-Man" a video mode
	of 400x288 PAL (perfect size) is used.

Other Ports
	This section compares AdvanceMAME with the other MAME ports.

  Windows MAME
	The official Windows MAME generally doesn't use a video mode
	with the correct size but it stretches the image (losing in
	quality) to match the best video mode found on the system list.
	Depending on the type of your video drivers you can sometimes
	edit this list.
	The TV support depends on the video drivers of your board and
	it's generally limited at the interlaced mode 640x480.
	Arcade monitors are used as NTSC TVs.
	Generally this port is limited by Windows to get the best from
	your monitor.

  DOS MAME
	The official DOS MAME (v0.53) is limited to use only the
	standard VESA resolutions. Generally they are only 320x200,
	320x240, 400x300, 512x384, 640x480, ...
	The Arcade/TV support is limited at the mode 640x480 for the
	ATI boards.

  XMAME
	The XMAME port has nearly the same video capabilities of
	AdvanceMAME. The only drawback is that it requires a manual
	modeline creation. AdvanceMAME uses the latest SVGALIB
	library on witch you can create modeline dinamically and
	that doesn't require the root access.

	AdvanceMAME has also some uniqe features like the `scale2x',
	`filter' and `rgb' effects, the turbo mode, the scripts, SMP,
	8 bit depth, ...

Configuration
	The DOS version of AdvanceMAME reads configuration options
	from the file `advmame.rc', `advmess.rc' and `advpac.rc'
	in the current directory.

	The Linux version reads configuration options from the files
	`advmame.rc', `advmess.rc' and `advpac.rc' in the $root and
	the $home directory.
	The $root directory is PREFIX/share/advance/ where
	PREFIX is the installation directory configured in the
	`makefile', generally it's `/usr/local'.
	The $home directory is HOME/.advance/ where HOME is the
	value of the HOME environment variable. If the HOME
	environment variable is missing the same $root directory is
	used.

	The options in the $root directory overwrite the options in
	the $home directory.

	The $home directory is also used to write all the information
	by the program. The files in the $root directory are only read.

	The options are specified in this format :

		:[SECTION/]OPTION VALUE

	If the SECTION is omitted the `' (empty) section is assumed.

	You can split long options in a multiline format ending the line
	with the char `\' :

		:[SECTION/]OPTION FIRST_LINE \
		:	SECOND_LINE \
		:	... \
		:	LAST_LINE

	When you run a game every option is read in three different
	sections in the following order:

		`game' - The short game name, like `pacman'.
		`resolution' - The resolution of the game, like
			`244x288' for raster games or `vector' for
			vector games.
		`orientation' - The game orientation. Or `vertical'
			or `horizontal'.
		`' - The default empty section.

	You can override any global option inserting a new
	value only for a single game or a single game resolution.
	For example:

		:display_scanlines no
		:pacman/display_scanlines yes
		:pacman/dir_rom C:\PACMAN
		:vertical/display_ror yes
		:horizontal/display_ror no

  Software Configuration Options

    dev_*
	Load a specific device for the AdvanceMESS emulator. These
	options are mainly used on the command line to specify the
	machine software to load.
	The file specified is searched in the directory list specified
	in the `dir_image' option.

	:dev_COMMAND FILE

	Commands:
		cartridge - Load a cartridge.
		floppydisk - Load a floppydisk.
		harddisk - Load an harddisk.
		cylinder - Load a cylinder.
		cassette - Load a cassette.
		punchcard - Load a punchcard.
		punchtape - Load a punchtape.
		printer - Load a printer.
		serial - Load a serial.
		parallel - Load a parallel.
		snapshot - Load a snapshot.
		quickload - Load a quickload.

	Examples:
		:advmess ti99_4a -dev_cartridge attackg.bin

	Example using the command line autocompletion:
		:advmess ti99_4a -cart alpinerc.bin -cart alpinerg.bin

  Directory Configuration Options

    dir_*
	All the directories specifications. The DOS version uses the
	`;' char as directory separator, instead, the Linux version
	uses the `:' char.

	:dir_* DIR[;DIR]... (DOS)
	:dir_* DIR[:DIR]... (Linux)

	Options:
		dir_rom - Multi directory specification for the
			AdvanceMAME `rom' files and AdvanceMESS `bios'
			files.
		dir_image - Multi directory specification for the
			disk/cartdrige/... image files.
		dir_imagediff - Multi directory specification for the
			disk image differential files.
		dir_sample - Multi directory specification for the
			zipped `sample' files. Only the zipped format
			is supported.
		dir_artwork - Multi directory specification for the
			zipped `artwork' files. Only the zipped format
			is supported.
		dir_nvram - Single directory for `nvram' files.
		dir_memcard - Single directory for `memcard' files.
		dir_hi - Single directory for `hi' files.
		dir_cfg - Single directory for `cfg' files.
		dir_inp - Single directory for `inp' files.
		dir_sta - Single directory for `sta' files.
		dir_snap - Single directory for the `snapshot'
			files.
		dir_crc - Single directory for the `crc' files.

	Defaults for the DOS version :
		dir_rom - rom
		dir_imager - image
		dir_imagerw - image
		dir_imagediff - image
		dir_sample - sample
		dir_artwork - artwork
		dir_nvram - nvram
		dir_memcard - memcard
		dir_hi - hi
		dir_cfg - cfg
		dir_inp - inp
		dir_sta - sta
		dir_snap - snap
		dir_crc - crc

	Defaults for the Linux version :
		dir_rom - $home/rom:$root/rom
		dir_imager - $home/image:$root/image
		dir_imagerw - $home/image:$root/image
		dir_imagediff - $home/image:$root/image
		dir_sample - $home/sample:$root/sample
		dir_artwork - $home/artwork:$root/artwork
		dir_nvram - $home/nvram
		dir_memcard - $home/memcard
		dir_hi - $home/hi
		dir_cfg - $home/cfg
		dir_inp - $home/inp
		dir_sta - $home/sta
		dir_snap - $home/snap
		dir_crc - $home/crc

	For the `dir_rom' and `dir_image' the following file
	combinations are tried:

	* DIR/GAME/Name.EXT
	* DIR/GAME.zip/Name.EXT
	* DIR/GAME/Name.zip/Name.EXT

	Where DIR is every directories specified, GAME is the name of
	the game or machine emulated, Name if the rom name, EXT if the
	rom extension.

	For the files searched in the `dir_image' option you can also
	specify a different zip name separing the zip name without
	the extension from the file name with the `=' char.
	For example to run the `ti99_4a' emulator and load the
	cartdriges `crom.bin' and `grom.bin' both contained in
	the zip file `alpiner.zip' you can use this syntax:

		:advmess ti99_4a -cart alpiner=crom.bin -cart alpiner=grom.bin

	This feature is used automatically by AdvanceMENU to correctly
	open software in zip files.

  Display Configuration Options
    device_video_*
	All the `device_video_*' options defined in the `advv.txt' file can
	be used.

	If you are using the `sdl' target you don't need to set these options.

	On the other targets these options are used to select and create the
	correct video mode. They are mandatory. You can use the `advcfg'
	utility to set them interactively.

    display_mode
	Selects a specific modeline by its name.

	:display_mode auto | MODELINE_NAME

	Options:
		MODELINE_NAME - Specific modeline, as named with
			the `advmamev' utility.
		auto - Automatically chooses the best modeline
			available (default).

    display_adjust
	If and how to generate a `perfect' video mode for the
	emulated game. Correct using of this option removes the need
	of any software stretching improving a lot the game image.

	:display_adjust none | x | clock | xclock | generate

	Options:
		none - No automatic video mode creation. Use only the
			available modelines (default).
		x - Adjusts the available modeline width to match the
			game image's size. The stretched modeline keeps
			all the clock attributes of the original
			modeline. Also all other modeline attributes,
			like doublescan and interlace, are maintained.
		clock - Adjusts the available modeline's vertical clock
			to match the game's frame rate.
		xclock - Adjusts the available modeline's width and the
			vertical clock.
		generate - Creates automatically some new modelines using
			the format specified on the `device_video_format'
			option.
			The generated modelines will have the names :
			`generate', `generate-double', `generate-triple'
			`generate-scanline' and `generate-interlace'.
			Check the `advmamev.txt' file for other
			explanation or simply use the `advcfg' utility 
			to set it up correctly.
			If the `device_video_format' option isn't
			specified a default value is used.

	The `generate' option is the most powerful, you don't need to
	create a list of modelines with the `advmamev' utility.
	With all the other options you need to create a list of good
	modeline with the `advv' utility.

	The `advcfg' utility always sets up the `generate' option.

	If you can't get good result with the `generate' you should
	create a list of modelines and try with the `xclock' option.
	The horizontal resolution of the modelines isn't important
	because the video modes are stretched in any case.
	Instead you should create a wide set of different vertical
	resolutions on wich the video mode can be choosen.
	A good choice is to create all the resolutions with a step of
	16 rows.

	If you use `generate' you can set the option
	`display_resize integer' for a MultiSync Monitor or
	`display_resize mixed' for an Arcade/TV to disable
	software stretching.

    display_depth
	Control the bit depth of the video mode.

	:display_depth auto | 8 | 15 | 16 | 32

	Options:
		auto - Automatically choose the best option.
		8 - 8 bit palettized/RGB mode.
		15,16,32 - 15, 16, 32 bit RGB modes.

    display_resize
	Used to suggest the favourite image stretching.
	This option doesn't have any effect for vector games.

	:display_resize none | integer | mixed | fractional

	Options:
		none - Original size.
		integer - Integer stretch, i.e. x2, x3, x4,...
		mixed - Integer horizontal stretch and fractional
			vertical stretch (default).
		fractional - Fractional stretch.

	The `fractional' option involves a big slowdown, so the `mixed' 
	option is suggested.

	Examples:
		:display_resize mixed

    display_magnify
	Used to suggest the use of a double resolution video mode.
	It is mainly used to enable the `scale2x' effect.
	This option doesn't have any effect for vector games.

	:display_magnify yes | no

    display_rgb
	Used to suggest the use of a RGB video mode.

	:display_rgb yes | no

	Note that if you set it to `no' a RGB mode can be selected
	anyway if it's required by the game. This option is
	useful to force a RGB mode to enable the other effects.

    display_scanlines
	Used to suggest the use of hardware scanlines when choosing
	the video mode.

	:display_scanlines yes | no

    display_buffer
	Activates the video image buffering.

	:display_buffer yes | no

	Options:
		no - Doesn't use any buffering (default).
		yes - Use the best buffering available.

    display_vsync
	Synchronize the video display with the video beam instead of
	using the CPU timer. This option can be used only if the
	selected video mode has an appropriate refresh rate.
	To ensure this you can use the option `display_adjust' to allow
	a clock correction of the video mode.

	:display_vsync yes | no

	Options:
		no - Use the timer.
		yes - Use the video refresh rate (default).

	You can enable or disable it also on the runtime Video menu.

    display_restore
	Selects wether or not to reset to default text mode at the
	emulator exit.

	:display_restore yes | no

	Options:
		yes - Resets to text mode (default).
		no - Doesn't change the video mode.

    display_frameskip
	Skips frames to speed up the emulation.

	:display_frameskip auto | FACTOR

	Options:
		auto - Auto frame skip (default).
		FACTOR - Float factor for the fraction of frames
			to display. From 0 to 1.

	Use F11 to display the speed your computer is actually
	reaching. If it is below 100%, increase the frameskip value.
	You can press F8/F9 to change frameskip while running the game.
	When set to auto (default), the frameskip setting is
	dynamically adjusted during runtime to display the maximum
	possible frames without dropping below the 100% speed.
	Pressing F10 you can enable and disable the throttle
	syncronization.

	Examples:
		:display_frameskip 0.5

    display_expand
	Enlarge the screen area used by the vertical games on horizontal
	monitors (and horizontal games in vertical monitors).

	:display_expand FACTOR

	Options:
		FACTOR - Expansion float factor from 1.0 to 2.0
			(default 1.0)

	Examples:
		:display_expand 1.2

  Display Effect Configuration Options

    display_resizeeffect
	When a video mode is smaller or bigger than the original arcade
	screen, the `resizeeffect' option controls the type of the
	transformation applied.

	:display_resizeeffect auto | none | max | mean | filter
	:	| filterx | filtery | scale2x

	Options:
		auto - Selects automatically the best effect (default).
			This selection is list based, and may be a lot
			incomplete.
			The `filter' effect is used when the game is
			stretched by a factor greater or equal to 2.
			On the other cases the `mean' or `max' effect
			is selected.
		none - Simply removes or duplicates lines as required.
		max - In vertical reduction merges consecutive lines
			using the lightest pixels versus the darkest.
			In vertical expansion simply duplicates lines.
			Supported only in games with a static palette
			or in RGB modes.
			It works best for the games with black 
			background or without scrolling. Like "Pac-Man".
		mean - In vertical reduction merges lines using the
			mean color of the pixels. In vertical expansion 
			adds lines which are the mean of previous and 
			next lines.
			Supported only in RGB (not palettized) video
			modes. It works best for the games with very
			high resolution. Like "1941".
		filter - In vertical reduction and expansion removes or
			duplicates lines and applies a low pass 
			filter in the x and the y directions. 
			It's a simple FIR filter with two points of 
			equal value.
			Supported only in RGB (not palettized) video
			modes.
		filterx - like `filter' but only in the x direction
		filtery - like `filter' but only in the y direction
		scale2x - It works only in expansion by a factor of 2.
			It tries to add the missing pixels matching the
			original bitmap pattern.

    display_rgbeffect
	This option selects a special effect to simulate the aspect of
	an Arcade Monitor with a PC monitor. The resulting images is
	better when you use a big video mode.
	These effects require a RGB video mode to work.

	:display_rgbeffect none | triad3dot | triad6dot
	:	| triad16dot | triadstrong3dot | triadstrong6dot
	:	| triadstrong16dot | scan2vert | scan3vert
	:	| scan2horz | scan3horz.

	Options:
		none - No effect (default).
		triad3dot - RGB triad of 3 pixels.
		triad6dot - RGB triad of 6 pixels.
		triad16dot - RGB triad of 16 pixels.
		triadstrong3dot - RGB strong triad of 3 pixels.
		triadstrong6dot - RGB strong triad of 6 pixels.
		triadstrong16dot - RGB strong triad of 16 pixels.
		scan2vert - Scanline of 2 vertical lines.
		scan3vert - Scanline of 3 vertical lines.
		scan2horz - Scanline of 2 horizontal lines.
		scan3horz - Scanline of 3 horizontal lines.

    display_interlaceeffect
	This option enables some special operations on interlaced modes.
	On not interlaced modes the effect is always off.

	:display_interlaceeffect none | even | odd

	Options:
		none - No effect (default).
		even - Swap the even rows.
		odd - Swap the odd rows.

    display_brightness
	Select the image brightness factor.

	:display_brightness FACTOR

	Options:
		FACTOR - Brightness float factor (default 1.0).

    display_gamma
	Sets the image gamma correction factor.

	:display_gamma FACTOR

	Options:
		FACTOR - Gamma float factor (default 1.0).

    display_skiplines/skipcolumns
	Select the centering of the visible area.

	:display_skiplines auto | SKIPLINES
	:display_skipcolumns auto | SKIPCOLUMNS

	Options:
		auto - Auto center (default).
		SKIPLINES - Lines to skip.
		SKIPCOLUMNS - Columns to skip.

  Display Artwork Configuration Options

    display_artwork
	Enables or disables the artwork display.

	:display_artwork yes | no

	Options:
		yes - Enables the artwork (default).
		no - Doesn't display the artwork.

    display_artwork_crop
	Crops the artwork at the game size.

	:display_artwork_crop yes | no

	Options:
		yes - Crops the artwork.
		no - Doesn't crop the artwork (default).

  Display Vector Configuration Options

    display_antialias
	Antialiasing for vector games.

	:display_antialias yes | no

    display_beam
	Sets width in pixels of vectors.

	:display_beam SIZE

	Options:
		SIZE - A float in the range of 1.0 through 16.0
			(default 1.0).

    display_flicker
	Makes vectors flicker.

	:display_flicker FACTOR

	Options:
		FACTOR - A float in the range 0.0 - 100.0
			(default 0).

    display_translucency
	Enables or disables vector translucency.

	:display_translucency yes | no

    display_intensity
	Sets the vector intensity.

	:display_intensity FACTOR

	Options:
		FACTOR - A float in the range 0.5 - 3.0
			(default 1.5).

  Display Orientation Configuration Options

    display_rotate
	Select where the rotation is done, at core level or at blit
	level. This solves problems with all the games that don't rotate
	correctly if used with a vertical monitor. For example all
	NeoGeo games.

	:display_rotate none | core | blit

	Options:
		none - Disables any rotation.
		blit - Uses the rotation at blit level (default).
		core - Uses the rotation at core level.
		auto - Selects automatically the best mode (default).

    display_ror/rol/flipx/flipy
	Flip and rotate the game image.

	:display_ror yes | no
	:display_rol yes | no
	:display_flipx yes | no
	:display_flipy yes | no

  Sound Configuration Options

    device_sound
	Specify the soundcard.

	:device_sound auto | none | DEVICE

	Options:
		none - No sound.
		auto - Automatic detection (default).

	Options for the DOS version:
		seal - SEAL automatic detection.
		seal/sb - Sound Blaster.
		seal/pas - Pro Audio Spectrum.
		seal/gusmax - Gravis Ultrasound Max.
		seal/gus - Gravis Ultrasound.
		seal/wss - Windows Sound System.
		seal/ess - Ensoniq Soundscape.
		allegro - Allegro automatic detection.
		allegro/sb10 - Sound Blaster 1.0.
		allegro/sb15 - Sound Blaster 1.5.
		allegro/sb20 - Sound Blaster 2.0.
		allegro/sbpro - Sound Blaster Pro.
		allegro/sb16 - Sound Blaster 16.
		allegro/audio - Ensoniq AudioDrive.
		allegro/wss - Windows Sound System.
		allegro/ess - Ensoniq Soundscape.
		vsync/sb -  Sound Blaster.
		vsync/sbwin - Sound Blaster (Windows).
		vsync/ac97 - AC97.
		vsync/ac97win - AC97 (Windows).
		vsync/gusmax - Gravis Ultrasound Max.
		vsync/gus - Gravis Ultrasound.
		vsync/audio - Ensoniq AudioDrive.
		vsync/wss - Windows Sound System.
		vsync/ess- Ensoniq Soundscape.

	The vsync/ drivers came from th VSyncMAME emulator. More info
	are in the VSyncMAME page :

		http://vsyncmame.mameworld.net

	Options for the Linux version:
		oss - OSS automatic detection.

    sound_samplerate
	Sets the audio sample rate.

	:sound_samplerate RATE

	Options:
		RATE - Sample rate. Common values are 11025, 22050
			and 44100 (default 44100).

    sound_stereo
	Selects stereo or mono output for games supporting stereo sound.

	:sound_stereo yes | no

    sound_volume
	Sets the startup volume.

	:sound_volume VOLUME

	Options:
		VOLUME - The volume is an attenuation in dB (default 0).
			The dB is a negative value from -20 to 0.

	Examples:
		:sound_volume -12

    sound_latency
	Sets the audio latency.

	:sound_latency TIME

	Options:
		TIME - Latency in seconds from 0.01 to 2.0.
			(default 0.1)

	If in the game play you hear some sound ticks you can try to
	increase the latency.

  Input Configuration Options

    device_keyboard
	Enables or disables keyboard support.

	:device_keyboard auto | none

	Options:
		none - No keyboard.
		auto - Automatic detection (default).

    device_mouse
	Enables or disables mouse support.

	:device_mouse auto | none

	Options:
		none - No mouse (default).
		auto - Automatic detection.

	The DOS version uses standard DOS service for the first mouse 
	and the special `optimous' driver for a second mouse.
	The `optimous' driver is available in the `contrib/' directory.
	The Linux version uses `svgalib' mouse support. So you must 
	configure the correct mouse in `svgalib' configuration file.

    device_joystick
	Enables or disables joystick support.

	:device_joystick auto | none | DEVICE

	Options:
		none - No joystick (default).
		auto - Automatic detection.

	The DOS version uses the Allegro library for joystick support.
	The Linux version uses always the Kernel joystick interface with
	the svgalib library

	Options for DOS Allegro library:
		allegro/standard - Standard joystick.
		allegro/dual - Dual joysticks.
		allegro/4button - 4-button joystick.
		allegro/6button - 6-button joystick.
		allegro/8button - 8-button joystick.
		allegro/fspro - CH Flightstick Pro.
		allegro/wingex - Logitech Wingman Extreme.
		allegro/sidewinder - Sidewinder.
		allegro/sidewinderag - Sidewinder Aggressive.
		allegro/gamepadpro - GamePad Pro.
		allegro/grip - GrIP.
		allegro/grip4 - GrIP 4-way.
		allegro/sneslpt1 - SNESpad LPT1.
		allegro/sneslpt2 - SNESpad LPT2.
		allegro/sneslpt3 - SNESpad LPT3.
		allegro/psxlpt1 - PSXpad LPT1.
		allegro/psxlpt2 - PSXpad LPT2.
		allegro/psxlpt3 - PSXpad LPT3.
		allegro/n64lpt1 - N64pad LPT1.
		allegro/n64lpt2 - N64pad LPT2.
		allegro/n64lpt3 - N64pad LPT3.
		allegro/db9lpt1 - DB9 LPT1.
		allegro/db9lpt2 - DB9 LPT2.
		allegro/db9lpt3 - DB9 LPT3.
		allegro/tgxlpt1 - TGX-LPT1.
		allegro/tgxlpt2 - TGX LPT2.
		allegro/tgxlpt3 - TGX LPT3.
		allegro/segaisa - IF-SEGA/ISA.
		allegro/segapci - IF-SEGA2/PCI.
		allegro/segapcifast - IF-SEGA2/PCI (normal).
		allegro/wingwarrior - Wingman Warrior.

    input_steadykey
	Helps recognition of very long key sequences. But slows a bit
	the key recognition.

	:input_steadykey yes | no

	Options:
		no - Standard key recognition (default).
		yes - Wait until the keyboard state is stabilized
			before report any key change.

    input_hotkey
	Enable or disable the recognition of the special OS keyboard
	sequences.

	:input_hotkey yes | no

	Options:
		no - No hot key recognition.
		yes - Hot key recognition (default).

	In DOS the hotkey recognized are :
		CTRL+ALT+DEL - Reset
		CTRL+ALT+END - Quit
		CTRL+BREAK (Pause) - Break

    input_idleexit
	Activates the automatic exit after some time of inactivity.

	:input_idleexit TIME

	Options:
		TIME - Number of seconds to wait, if 0 (default)
			never exits automatically.

    input_map[,x|y|z|pedal]
	Changes the analog control mapping. Map the physical A'n
	joystick, B'n stick, C'n axe on the J'n axe of the I'n player.

	:input_map[I,J] [-]joystick[A,B,C] ...

	Options:
		- - Invert the effect of the movement.
		I - Number of player: 0, 1, 2, 3.
		J - Name of player axe: x, y, z, pedal.
		A - Number of physical joystick: 0, 1, 2, 3...
		B - Number of physical stick of the josytick: 0, 1, 2, 3, ...
		C - Number of physical axe of the stick: 0, 1, 2, 3, ...

	Defaults:
		input_map[0,x] - joystick[0,0,0]
		input_map[0,y] - joystick[0,0,1]
		input_map[0,z] - joystick[0,0,2]
		input_map[0,pedal] - joystick[0,0,3]
		input_map[1,x] - joystick[1,0,0]
		input_map[1,y] - joystick[1,0,1]
		input_map[1,z] - joystick[1,0,2]
		input_map[1,pedal] - joystick[1,0,3]
		input_map[2,x] - joystick[2,0,0]
		input_map[2,y] - joystick[2,0,1]
		input_map[2,z] - joystick[2,0,2]
		input_map[2,pedal] - joystick[2,0,3]
		input_map[3,x] - joystick[3,0,0]
		input_map[3,y] - joystick[3,0,1]
		input_map[3,z] - joystick[3,0,2]
		input_map[3,pedal] - joystick[3,0,3]

	Examples:
		input_map[0,x] - joystick[0,0,0] joystick[0,1,0]
		input_map[0,y] - joystick[0,0,1] -joystick[0,1,1]

    input_map[,trakx|traky]
	Changes the trak control mapping. Map the physical A'n mouse
	on the I'n player trak control.

	:input_map[I,trakx|traky] [-]mouse[M,A] ...

	Options:
		- - Invert the effect of the movement.
		I - Number of player trak control: 0, 1, 2, 3.
		M - Number of physical mouse: 0, 1, 2, 3...
		A - Number of physical mouse axe: 0, 1...

	Defaults:
		input_map[0,trakx] - mouse[0,0]
		input_map[0,traky] - mouse[0,1]
		input_map[1,trakx] - mouse[1,0]
		input_map[1,traky] - mouse[1,1]
		input_map[2,trakx] - mouse[2,0]
		input_map[2,traky] - mouse[2,1]
		input_map[3,trakx] - mouse[3,0]
		input_map[3,traky] - mouse[3,1]

	Examples:
		input_map[0,trakx] - mouse[0,0] -mouse[1,0]
		input_map[0,traky] - mouse[0,1] -mouse[1,1]

  Record Configuration Options
	This section describes the options used for the recoring
	features.

	To start the recording press `left_ctrl+enter'. To end the
	reconding and to save the clip press `enter'. If you press the
	start key more than one time the recording starts from the
	last press.

    record_sound
	Enable or disable the sound recording.

	:record_sound yes | no

	The sound clip is saved in the `dir_snap' directory (like the
	snapshot images) in `.wav' format. Specifically the `WAV PCM
	16 bit' format is used. The sample rate used is the same sample
	rate specified with the `sound_samplerate' option.

	The clip is saved without compression and without any volume
	adjustment. You should use an external utility to adjust the
	volume and compress the resulting file.

    record_video
	Enable or disable the video recording.

	:record_video yes | no

	The video clip is saved in the `dir_snap' directory (like the
	snapshot images) in `.mng' format. The `MNG-LC' (Low Complexity)
	format is used.

	The clip is saved with a light compression, you should use an
	external utility to compress better the resulting file.

	A powerful compression utility is the `advmng' program
	available in the AdvanceSCAN package.

    record_video/sound_time
	This option controls the maximum length in seconds of the
	recording feature.

	:record_sound_time TIME
	:record_video_time TIME

	Options:
		TIME - Time in seconds (default 15).
	
    record_video_interleave
	Select how many frames save with the video recording.

	:record_video_interleave COUNT

	Options:
		COUNT - How many frames displayed a frame must be saved
			(default 2). 1 means save all the frames. 2
			means save 1 every 2. 3 means save 1 every 3,
			and so on.

	Examples:
		:record_video_interleave 1

  Misc Configuration Options
    misc_smp [Linux Only]
	Enables the "Symmetric Multi-Processing" (SMP).
	This option use two concurrent threads. One for MAME and one
	for updating the screen.
	The final blit stage in video memory is completly done by the
	second thread. This behaviour requires a complete bitmap redraw
	by MAME for the games that don't already do it.
	Generally you get a big speed improvement only if you are using
	a strong video effect like `magnify' and `scale2x'.

	:misc_smp yes | no

	Options:
		no - Disabled (default).
		yes - Enabled.

	You can enable or disable it also on the runtime Video menu.

    misc_speed
	Selects the speed factor always active. You can play the game
	in slowdown or in nightmare mode!

	:misc_speed FACTOR

	Options:
		FACTOR - Float speed factor (default 1.0).

	Examples:
		:misc_speed 1.2

    misc_turbospeed
	Selects the speed factor used when the `turbo' button is
	pressed. The default `turbo' button is num pad `*'.

	:misc_turbospeed FACTOR

	Options:
		FACTOR - Float speed factor (default 3.0).

    misc_startuptime
	Selects the time in seconds of the duration of the startup
	speed up.

	:misc_startuptime TIME

	Options:
		TIME - Time in seconds (default 6).

	Use 0 seconds to disable the startup turbo effect.

    misc_quiet
	Doesn't print the copyright text message at the startup :

	:AdvanceMAME - Copyright (C) 1999-200X by Andrea Mazzoleni
	:MAME - Copyright (C) 1997-200X by Nicola Salmoria and the MAME Team

	:misc_quiet yes | no

    misc_timetorun
	Run the emulation only for the given number of seconds whithout
	any throttling and at the exit print the number of real CPU
	seconds used. Useful for benchmarking.

	:misc_timetorun SECONDS

    misc_internaldepth
	Control the size of the internal MAME bitmap.

	:misc_internaldepth auto | 15 | 16 | 32

	Options:
		auto - Automatic (default).
		15 - 15 bit RGB mode
		16 - 16 bit Palette mode
		32 - 32 bit RGB mode

	The use of this option is discouraged. Use the default value.

  Support Files Configuration Options
	The AdvanceMAME emulator needs also some support files:

		cheat.dat - Cheat database.
		safequit.dat - Safequit database.
		history.dat - Game history database.
		hiscore.dat - Highscore database.
		mameinfo.dat - MAME info database.
		sysinfo.dat - MESS info database.
		english.lng - Language database.

	These files should reside in current directory for the
	DOS version or in the $root or $home directories for the
	Linux version.

    misc_cheat
	Enable or disable the cheat system. It may also change the
	game behaviour enabling the cheat dipswitch if available.
	If enabled, it disables the hiscore saving.

	:misc_cheat yes | no

	Options:
		yes - Enable the cheats.
		no - Disable the cheats (default).

    misc_cheatfile
	Select the cheat files. The DOS version uses the
	`;' char as file separator, instead, the Linux version
	uses the `:' char.

	:misc_cheatfile FILE[;FILE]... (Dos)
	:misc_cheatfile FILE[:FILE]... (Linux)

	Options:
		FILE - Cheat file to load (default cheat.dat).

    misc_languagefile
	Select the language file.

	:misc_languagefile FILE

	Options:
		FILE - Language file to load (default english.lng).

    misc_historyfile
	Select the history file.

	:misc_historyfile FILE

	Options:
		FILE - History file to load (default history.dat).

    misc_infofile
	Select the info file.

	:misc_infofile FILE

	Options:
		FILE - Info file to load (default mameinfo.dat).

    misc_safequit
	Activates safe quit mode. If enabled, to stop the
	emulation, you need to confirm on a simple menu.

	:misc_safequit_safeexit yes | no

	If the file `safequit.dat' is found the exit menu is shown only 
	if a coin is inserted or if you are playing.

    misc_safequitdebug
	Activates the debug mode for the safequit feature. On the top
	left of the screen the two internal state of the safequit engine
	are printed. The first value is the coin state, the second value
	is the playing state. If both the values are 1 the exit is permitted
	without prompting.

	:misc_safequitdebug yes | no

    misc_safequitfile
	Selects the safequit file to use.

	:misc_safequitfile FILE

	Options:
		FILE - SafeQuit file to load (default safequit.dat).

Copyright
	This file is Copyright (C) 2002 Andrea Mazzoleni, Filipe Estima.
