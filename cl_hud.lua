/* By jasonLJ */

--[[---------------------------------------------------------
	Name: Settings
-----------------------------------------------------------]]

-- Container
local Settings = {}

-- Colors
Settings.COLOR_FG = Color( 221, 221, 221, 225 )
Settings.COLOR_BG = Color ( 10, 10, 10, 225 )
Settings.COLOR_BORDER = Color ( 10, 10, 10, 255 )

-- Dimensions
Settings.WIDTH = 700
Settings.HEIGHT = 50

Settings.CORNER_RADIUS = 4

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
Settings.PARTITION_SIZE = Settings.WIDTH / 3
Settings.LEFT_X = Settings.X
Settings.CENTER_X = Settings.LEFT_X + PARTITION_SIZE
Settings.CENTER_Y = Settings.CENTER_X + PARTITION_SIZE

-- HP Bar Position
if ( HP_POSITION == "left" ) then
	Settings.HP_X  = Settings.LEFT_X
elseif ( HP_POSITION == "center" ) then
	Settings.HP_X = Settings.CENTER_X
elseif ( HP_POSITION == "right" ) then
	Settings.HP_X = Settings.RIGHT_X
end

-- Money Information Position
if ( MONEY_POSITION == "left" ) then
	Settings.MONEY_X = Settings.LEFT_X
elseif ( MONEY_POSITION == "center" ) then
	Settings.MONEY_X = Settings.CENTER_X
elseif ( MONEY_POSITION == "right" ) then
	Settings.MONEY_X = Settings.RIGHT_X
end

-- General Information Position
if ( INFO_POSITION == "left" ) then
	Settings.INFO_X = Settings.LEFT_X
elseif ( INFO_POSITION == "center" ) then
	Settings.INFO_X = Settings.CENTER_X
elseif ( INFO_POSITION == "right" ) then
	Settings.INFO_X = Settings.RIGHT_X
end

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

	-- Background drawing
	draw.RoundedBox( Settings.CORNER_RADIUS, Settings.X, Settings.Y, Settings.WIDTH, Settings.HEIGHT, Settings.COLOR_BG )

	-- Border drawing
	draw.RoundedBox( 0, Settings.BORDER_X, Settings.BORDER_Y, Settings.BORDER_WIDTH, Settings.BORDER_HEIGHT, Settings.COLOR_BORDER )

end

--[[---------------------------------------------------------
	Name: HUD Paint
-----------------------------------------------------------]]

local function PaintHUD()

	-- Custom Elements
	PaintBase()

	--GAMEMODE.BaseClass:HUDPaint()

end

hook.Add( "HUDPaint", "PaintHUD", PaintHUD )