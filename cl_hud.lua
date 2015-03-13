/* By jasonLJ */

--[[---------------------------------------------------------
	Name: Settings
-----------------------------------------------------------]]

-- Container
local Settings = {}

-- Colors
Settings.COLOR_FG = Color( 221, 221, 221, 225 )
Settings.COLOR_BG = Color ( 10, 10, 10, 225 )
Settings.COLOR_BORDER = Color( 10, 10, 10, 255 )

Settings.HEALTH_COLOR_TEXT = Settings.COLOR_FG
Settings.HEALTH_COLOR_BG = Color( 255, 0, 0, 55 )
Settings.HEALTH_COLOR_FG = Color( 255, 94, 94, 55 )
Settings.HEALTH_COLOR_BORDER = Color( 10, 10, 10, 155)

-- Dimensions
Settings.WIDTH = 700
Settings.HEIGHT = 50

Settings.CORNER_RADIUS = 4
Settings.HEALTH_CORNER_RADIUS = 2

Settings.BORDER_HEIGHT = 2
Settings.BORDER_WIDTH = Settings.WIDTH

-- Positions
Settings.X_ALIGN = "center" -- center, left, right
Settings.Y_ALIGN = "bottom" -- top, bottom

Settings.X_OFFSET = 0
Settings.Y_OFFSET = 0

-- Relative Positions
Settings.HP_POSITION = "left"
Settings.MONEY_POSITION = "center"
Settings.INFO_POSITION = "right"

-- Paddings
Settings.HP_PADDING = 6
Settings.MONEY_PADDING = 0
Settings.INFO_PADDING = 0

Settings.HEALTH_PADDING_BACKGROUND = 2
Settings.HEALTH_PADDING_FOREGROUND = 4

-- Miscellaneous
Settings.MAX_HEALTH = 100

--[[---------------------------------------------------------
	Name: Positions
-----------------------------------------------------------]]

-- X Position
if ( Settings.X_ALIGN == "center" ) then
	Settings.X = ( ( ScrW() / 2 ) - ( Settings.WIDTH / 2 ) ) + Settings.X_OFFSET
elseif ( Settings.X_ALIGN == "left" ) then
	Settings.X = Settings.X_OFFSET
elseif ( Settings.X_ALIGN == "right" ) then
	Settings.X = ScrW() + Settings.X_OFFSET
end

-- Y Position
if ( Settings.Y_ALIGN == "top" ) then
	Settings.Y = Settings.Y_OFFSET
elseif ( Settings.Y_ALIGN == "bottom" ) then
	Settings.Y = ScrH() - Settings.HEIGHT + Settings.Y_OFFSET
end

-- Border Position
Settings.BORDER_X = Settings.X
Settings.BORDER_Y = ScrH() - Settings.BORDER_HEIGHT + Settings.Y_OFFSET

-- Relative Position
Settings.PARTITION_WIDTH = Settings.WIDTH / 3
Settings.LEFT_X = Settings.X
Settings.CENTER_X = Settings.LEFT_X + Settings.PARTITION_WIDTH
Settings.RIGHT_X = Settings.CENTER_X + Settings.PARTITION_WIDTH

-- HP Bar Position
Settings.HP_X = -1

if ( Settings.HP_POSITION == "left" ) then
	Settings.HP_X  = Settings.LEFT_X
elseif ( Settings.HP_POSITION == "center" ) then
	Settings.HP_X = Settings.CENTER_X
elseif ( Settings.HP_POSITION == "right" ) then
	Settings.HP_X = Settings.RIGHT_X
end

Settings.HP_X = Settings.HP_X + Settings.HP_PADDING
Settings.HP_Y = Settings.Y + Settings.HP_PADDING

-- Money Information Position
Settings.MONEY_X = -1

if ( Settings.MONEY_POSITION == "left" ) then
	Settings.MONEY_X = Settings.LEFT_X
elseif ( Settings.MONEY_POSITION == "center" ) then
	Settings.MONEY_X = Settings.CENTER_X
elseif ( Settings.MONEY_POSITION == "right" ) then
	Settings.MONEY_X = Settings.RIGHT_X
end

Settings.MONEY_X = Settings.MONEY_X + Settings.MONEY_PADDING
Settings.MONEY_Y = Settings.Y + Settings.HP_PADDING

-- General Information Position
Settings.INFO_X = -1

if ( Settings.INFO_POSITION == "left" ) then
	Settings.INFO_X = Settings.LEFT_X
elseif ( Settings.INFO_POSITION == "center" ) then
	Settings.INFO_X = Settings.CENTER_X
elseif ( Settings.INFO_POSITION == "right" ) then
	Settings.INFO_X = Settings.RIGHT_X
end

Settings.INFO_X = Settings.INFO_X + Settings.INFO_PADDING
Settings.INFO_Y = Settings.Y + Settings.INFO_PADDING

--[[---------------------------------------------------------
	Name: FormatTextOverflow
-----------------------------------------------------------]]

function FormatTextOverflow( text, font, width )

	surface.setFont( font )

	-- Figure out how big our ellipsis is going to be
	local ellipsis = "..."
	local ellipsisSize = surface.getTextSize( ellipsis )

	-- Keep using a bigger and bigger substring until we get too big
	for length = 1, #text do

		local subString = text:sub( 1, length )
		local subStringSize = surface.getTextSize( subString )

		if ( subStringSize > width - ellipsisSize ) then

			return text:sub( 1, length - 1)

		end

	end

	return text

end

--[[---------------------------------------------------------
	Name: Base Panel
-----------------------------------------------------------]]

local function PaintBase()

	-- Background Drawing
	draw.RoundedBox( Settings.CORNER_RADIUS, Settings.X, Settings.Y, Settings.WIDTH, Settings.HEIGHT, Settings.COLOR_BG )

	-- Border Drawing
	draw.RoundedBox( 0, Settings.BORDER_X, Settings.BORDER_Y, Settings.BORDER_WIDTH, Settings.BORDER_HEIGHT, Settings.COLOR_BORDER )

end

--[[---------------------------------------------------------
	Name: Health Bar
-----------------------------------------------------------]]

local function PaintHealth()

	-- Common Variables
	local health = LocalPlayer():Health() or 0
	if ( health < 0 ) then health = 0 elseif ( health > Settings.MAX_HEALTH ) then health = Settings.MAX_HEALTH end -- Bind health between 0 and maxHeatlh

	local healthPercentage = health / 100

	-- Health Bar Dimensions
	local healthBarWidth = Settings.PARTITION_WIDTH - ( 2 * Settings.HP_PADDING )
	local healthBarHeight = Settings.HEIGHT - ( 2 * Settings.HP_PADDING )

	-- Border Drawing
	draw.RoundedBox( Settings.HEALTH_CORNER_RADIUS, Settings.HP_X, Settings.HP_Y, healthBarWidth, healthBarHeight, Settings.HEALTH_COLOR_BORDER )

	-- Stop drawing if we have no health
	if ( health <= 0 ) then return end

	-- Background Position
	local backgroundX = Settings.HP_X + Settings.HEALTH_PADDING_BACKGROUND
	local backgroundY = Settings.HP_Y + Settings.HEALTH_PADDING_BACKGROUND

	-- Background Dimensions
	local backgroundWidth = ( healthBarWidth - ( 2 * ( Settings.HEALTH_PADDING_BACKGROUND ) ) ) * healthPercentage
	local backgroundHeight = healthBarHeight - ( 2 * (Settings.HEALTH_PADDING_BACKGROUND ) )

	-- Background Drawing
	draw.RoundedBox( Settings.HEALTH_CORNER_RADIUS, backgroundX, backgroundY, backgroundWidth, backgroundHeight, Settings.HEALTH_COLOR_BG )

	-- Foreground Position
	local foregroundX = backgroundX + Settings.HEALTH_PADDING_FOREGROUND
	local foregroundY = backgroundY -- Foreground health bar has full parent height

	-- Foreground Dimensions
	local foregroundWidth = backgroundWidth - Settings.HEALTH_PADDING_FOREGROUND -- Only 1 x HEALTH_PADDING_BACKGROUND because foreground health bar expands fully to the right
	local foregroundHeight = backgroundHeight -- Foreground health bar has full parent height

	-- Foreground Drawing
	draw.RoundedBox( Settings.HEALTH_CORNER_RADIUS, foregroundX, foregroundY, foregroundWidth, foregroundHeight, Settings.HEALTH_COLOR_FG )

end

--[[---------------------------------------------------------
	Name: HUD Paint
-----------------------------------------------------------]]

local function PaintHUD()

	-- Custom Elements
	PaintBase()
	PaintHealth()

	--GAMEMODE.BaseClass:HUDPaint()

end

hook.Add( "HUDPaint", "PaintHUD", PaintHUD )