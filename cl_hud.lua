/* By jasonLJ */

--[[---------------------------------------------------------
	Name: Settings
-----------------------------------------------------------]]

-- Container
local Settings = {}

-- Colors
Settings.COLOR_FG = Color( 221, 221, 221, 225 )
Settings.COLOR_BG = Color( 10, 10, 10, 225 )
Settings.COLOR_BG_LOCKDOWN = Color( 85, 4, 4, 225 )
Settings.COLOR_BORDER = Color( 10, 10, 10, 255 )

Settings.HEALTH_COLOR_DARK_DELTA = 40
Settings.HEALTH_COLOR_TEXT = Settings.COLOR_FG
Settings.HEALTH_COLOR_FG = Color( 255, 94, 94, 55 )
Settings.HEALTH_COLOR_BORDER = ColorAlpha( Settings.COLOR_BORDER, 155 )

Settings.INFO_COLOR_DARK_DELTA = Settings.HEALTH_COLOR_DARK_DELTA
Settings.INFO_COLOR_BORDER = Settings.HEALTH_COLOR_BORDER
Settings.INFO_COLOR_TEAM_ALPHA = Settings.HEALTH_COLOR_FG.a
Settings.INFO_COLOR_DIVIDER = Settings.COLOR_FG

Settings.AGENDA_COLOR_HEADER = Settings.COLOR_BORDER

-- Dimensions
Settings.WIDTH = 700
Settings.HEIGHT = 50

Settings.CORNER_RADIUS = 4
Settings.HEALTH_CORNER_RADIUS = 2

Settings.HEIGHT_BORDER = 2
Settings.WIDTH_BORDER = Settings.WIDTH

Settings.MONEY_HEIGHT_DIVIDER = 2 -- Pixels
Settings.MONEY_WIDTH_DIVIDER = 0.7 -- Ratio

Settings.INFO_CORNER_RADIUS = Settings.HEALTH_CORNER_RADIUS

Settings.LICENSE_WIDTH = 32
Settings.LICENSE_HEIGHT = 32
Settings.LICENSE_CORNER_RADIUS = Settings.CORNER_RADIUS

Settings.AGENDA_WIDTH = 450
Settings.AGENDA_HEIGHT = 125
Settings.AGENDA_HEIGHT_HEADER = 25
Settings.AGENDA_CORNER_RADIUS = Settings.CORNER_RADIUS
Settings.AGENDA_CORNER_RADIUS_HEADER = 0

-- Positions
Settings.X_ALIGN = "center" -- center, left, right
Settings.Y_ALIGN = "bottom" -- top, bottom

Settings.X_OFFSET = 0
Settings.Y_OFFSET = 0

Settings.LICENSE_X_OFFSET = 8

Settings.MESSAGE_Y_BUFFER = 30

Settings.AGENDA_X = 10 -- TODO: Make these calculated values
Settings.AGENDA_Y = 0 -- Based on special alignment variables.
Settings.AGENDA_Y_TEXT = 30

-- Relative Positions
Settings.HEALTH_POSITION = "left"
Settings.MONEY_POSITION = "center"
Settings.INFO_POSITION = "right"

-- Paddings
Settings.HEALTH_PADDING = 6
Settings.MONEY_PADDING = Settings.HEALTH_PADDING
Settings.INFO_PADDING = Settings.HEALTH_PADDING

Settings.HEALTH_PADDING_BACKGROUND = 2
Settings.HEALTH_PADDING_FOREGROUND = 4

Settings.INFO_PADDING_BACKGROUND = Settings.HEALTH_PADDING_BACKGROUND
Settings.INFO_PADDING_FOREGROUND = Settings.HEALTH_PADDING_FOREGROUND

Settings.LICENSE_PADDING = 4

Settings.AGENDA_PADDING_TITLE_X = 8
Settings.AGENDA_PADDING_TITLE_Y = Settings.AGENDA_PADDING_TITLE_X / 2

-- Miscellaneous
Settings.FONT = "ChatFont"
Settings.MAX_HEALTH = 100
Settings.LICENSE_MATERIAL = "icon16/page_white_text.png"
Settings.PIXEL_WIDTH = 440

--[[---------------------------------------------------------
	Name: Elements Table
-----------------------------------------------------------]]

local HideElementsTable = {
	
	-- DarkRP
	["DarkRP_HUD"]	= true,
	["DarkRP_EntityDisplay"]	= true,
	["DarkRP_ZombieInfo"]	= true,
	["DarkRP_LocalPlayerHUD"]	= true,
	["DarkRP_Hungermod"]	= true,
	["DarkRP_Agenda"]	= true,

	-- Garry's Mod
	["CHudHealth"]	= true,
	["CHudBattery"]	= true,
	["CHudSuitPower"]	= true,

}

--[[---------------------------------------------------------
	Name: Positions
-----------------------------------------------------------]]

-- X Position
if ( Settings.X_ALIGN == "center" ) then
	Settings.X = ( ( ScrW() / 2 ) - ( Settings.WIDTH / 2 ) ) + Settings.X_OFFSET
elseif ( Settings.X_ALIGN == "left" ) then
	Settings.X = Settings.X_OFFSET
elseif ( Settings.X_ALIGN == "right" ) then
	Settings.X = ScrW() - Settings.WIDTH + Settings.X_OFFSET
end

-- Y Position
if ( Settings.Y_ALIGN == "top" ) then
	Settings.Y = Settings.Y_OFFSET
elseif ( Settings.Y_ALIGN == "bottom" ) then
	Settings.Y = ScrH() - Settings.HEIGHT + Settings.Y_OFFSET
end

-- Relative Position
Settings.PARTITION_WIDTH = Settings.WIDTH / 3
Settings.LEFT_X = Settings.X
Settings.CENTER_X = Settings.LEFT_X + Settings.PARTITION_WIDTH
Settings.RIGHT_X = Settings.CENTER_X + Settings.PARTITION_WIDTH

-- Health Bar Position
Settings.HEALTH_X = -1

if ( Settings.HEALTH_POSITION == "left" ) then
	Settings.HEALTH_X  = Settings.LEFT_X
elseif ( Settings.HEALTH_POSITION == "center" ) then
	Settings.HEALTH_X = Settings.CENTER_X
elseif ( Settings.HEALTH_POSITION == "right" ) then
	Settings.HEALTH_X = Settings.RIGHT_X
end

Settings.HEALTH_X = Settings.HEALTH_X + Settings.HEALTH_PADDING
Settings.HEALTH_Y = Settings.Y + Settings.HEALTH_PADDING

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
Settings.MONEY_Y = Settings.Y + Settings.MONEY_PADDING

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

-- Border Position
Settings.BORDER_X = Settings.X

 if ( Settings.Y_ALIGN == "top" ) then
 	Settings.BORDER_Y = 0
 elseif ( Settings.Y_ALIGN == "bottom" ) then
 	Settings.BORDER_Y = ScrH() - Settings.HEIGHT_BORDER
 end

 -- Agenda Title
Settings.AGENDA_X_TITLE = Settings.AGENDA_X + Settings.AGENDA_PADDING_TITLE_X
surface.SetFont( Settings.FONT )
Settings.AGENDA_Y_TITLE = Settings.AGENDA_PADDING_TITLE_Y


--[[---------------------------------------------------------
	Name: Dimensions
-----------------------------------------------------------]]

-- Health Bar Dimensions
Settings.HEALTH_WIDTH = Settings.PARTITION_WIDTH - ( 2 * Settings.HEALTH_PADDING )
Settings.HEALTH_HEIGHT = Settings.HEIGHT - ( 2 * Settings.HEALTH_PADDING )

-- Money Information Dimensions
Settings.MONEY_WIDTH = Settings.PARTITION_WIDTH - ( 2 * Settings.MONEY_PADDING )
Settings.MONEY_HEIGHT = Settings.HEIGHT - ( 2 * Settings.MONEY_PADDING )

-- General Information Dimensions
Settings.INFO_WIDTH = Settings.PARTITION_WIDTH - ( 2 * Settings.INFO_PADDING )
Settings.INFO_HEIGHT = Settings.HEIGHT - ( 2 * Settings.INFO_PADDING )

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
	Name: FormatNumber
-----------------------------------------------------------]]

function FormatNumber( x )

	x = tonumber( x )

	if not x then return "" end

	if x >= 1e14 then return tostring( x ) end

	x = tostring( x )

	local separator = ","
	local decimalPoint = string.find( x, "%." ) or ( #x + 1 )

	for i = decimalPoint - 4, 1, -3 do

		x = x:sub( 1, i ) .. separator .. x:sub( i+1 )
		
	end

	return x

end

--[[---------------------------------------------------------
	Name: Hide Elements
-----------------------------------------------------------]]

local function HideElements( element )

	if HideElementsTable[ element ] then
		
		--> Stop Draw
		return false

	end

end

hook.Add( "HUDShouldDraw", "HideElements", HideElements )

--[[---------------------------------------------------------
	Name: Base Panel
-----------------------------------------------------------]]

local function PaintBase()

	-- Determining Color
	if ( GetGlobalBool( "DarkRP_LockDown" ) ) then
		currentBackgroundColor = Settings.COLOR_BG_LOCKDOWN
	else
		currentBackgroundColor = Settings.COLOR_BG
	end

	-- Background Drawing
	draw.RoundedBox( Settings.CORNER_RADIUS, Settings.X, Settings.Y, Settings.WIDTH, Settings.HEIGHT, currentBackgroundColor )

	-- Border Drawing
	draw.RoundedBox( 0, Settings.BORDER_X, Settings.BORDER_Y, Settings.WIDTH_BORDER, Settings.HEIGHT_BORDER, Settings.COLOR_BORDER )

end

--[[---------------------------------------------------------
	Name: Health Bar
-----------------------------------------------------------]]

local function PaintHealth()

	-- Common Variables
	local health = LocalPlayer():Health() or 0
	local adjustedHealth = health
	if ( adjustedHealth < 0 ) then adjustedHealth = 0 elseif ( adjustedHealth > Settings.MAX_HEALTH ) then adjustedHealth = Settings.MAX_HEALTH end -- Bind health between 0 and maxHeatlh

	local healthPercentage = adjustedHealth / 100

	-- Health Bar Dimensions
	local healthBarWidth = Settings.HEALTH_WIDTH
	local healthBarHeight = Settings.HEALTH_HEIGHT

	-- Border Drawing
	draw.RoundedBox( Settings.HEALTH_CORNER_RADIUS, Settings.HEALTH_X, Settings.HEALTH_Y, healthBarWidth, healthBarHeight, Settings.HEALTH_COLOR_BORDER )

	-- Stop drawing if we have no health
	if ( health <= 0 ) then return end

	-- Background Position
	local backgroundX = Settings.HEALTH_X + Settings.HEALTH_PADDING_BACKGROUND
	local backgroundY = Settings.HEALTH_Y + Settings.HEALTH_PADDING_BACKGROUND

	-- Background Dimensions
	local backgroundWidth = ( healthBarWidth - ( 2 * ( Settings.HEALTH_PADDING_BACKGROUND ) ) ) * healthPercentage
	local backgroundHeight = healthBarHeight - ( 2 * (Settings.HEALTH_PADDING_BACKGROUND ) )

	-- Background Color
	local delta = Settings.HEALTH_COLOR_DARK_DELTA -- The amount to change each component by in order to make the color darker
	local backgroundRed = Settings.HEALTH_COLOR_FG.r - delta >= 0 and Settings.HEALTH_COLOR_FG.r - delta or 0
	local backgroundGreen = Settings.HEALTH_COLOR_FG.g - delta >= 0 and Settings.HEALTH_COLOR_FG.g - delta or 0
	local backgroundBlue = Settings.HEALTH_COLOR_FG.b - delta >= 0 and Settings.HEALTH_COLOR_FG.b - delta or 0
	local backgroundColor = Color( backgroundRed, backgroundGreen, backgroundBlue, Settings.HEALTH_COLOR_FG.a )

	-- Background Drawing
	draw.RoundedBox( Settings.HEALTH_CORNER_RADIUS, backgroundX, backgroundY, backgroundWidth, backgroundHeight, backgroundColor )

	-- Foreground Position
	local foregroundX = backgroundX + Settings.HEALTH_PADDING_FOREGROUND
	local foregroundY = backgroundY -- Foreground health bar has full parent height

	-- Foreground Dimensions
	local foregroundWidth = backgroundWidth - Settings.HEALTH_PADDING_FOREGROUND -- Only 1 x HEALTH_PADDING_BACKGROUND because foreground health bar expands fully to the right
	local foregroundHeight = backgroundHeight -- Foreground health bar has full parent height

	-- Foreground Drawing
	draw.RoundedBox( Settings.HEALTH_CORNER_RADIUS, foregroundX, foregroundY, foregroundWidth, foregroundHeight, Settings.HEALTH_COLOR_FG )

	-- Text Variables
	local text = health

	surface.SetFont( Settings.FONT )
	local textWidth, textHeight = surface.GetTextSize( text )

	local textX = Settings.HEALTH_X + ( Settings.HEALTH_WIDTH / 2 )
	local textY = Settings.HEALTH_Y + ( Settings.HEALTH_HEIGHT / 2 ) - ( textHeight / 2 )

	-- Text Drawing
	draw.DrawText( text, Settings.FONT, textX, textY, Settings.HEALTH_COLOR_TEXT, 1 )

end

--[[---------------------------------------------------------
	Name: Money Information
-----------------------------------------------------------]]

local function PaintMoneyLine()

	-- Wallet Text
	local walletText = LocalPlayer():getDarkRPVar( "money" ) or ""
	walletText = "$" .. FormatNumber( walletText ) -- Format money number

	-- Wallet Dimensions
	surface.SetFont( Settings.FONT )
	local walletTextWidth, walletTextHeight = surface.GetTextSize( walletText )

	-- Wallet Position
	local walletX = Settings.MONEY_X + ( Settings.PARTITION_WIDTH / 4 )
	local walletY = Settings.MONEY_Y  + ( Settings.MONEY_HEIGHT / 2 ) - walletTextHeight

	-- Wallet Text Drawing
	draw.DrawText( walletText, Settings.FONT, walletX, walletY, Settings.COLOR_FG, TEXT_ALIGN_CENTER )

	-- Salary Text
	local salaryText = LocalPlayer():getDarkRPVar( "salary" ) or ""
	salaryText = "$" .. FormatNumber( salaryText ) -- Format salary number

	-- Salary Dimensions
	local salaryTextWidth, salaryTextHeight = surface.GetTextSize( salaryText )

	-- Salary Position
	local salaryX = Settings.MONEY_X + ( ( 3 / 4 ) * Settings.PARTITION_WIDTH )
	local salaryY = Settings.MONEY_Y + ( Settings.MONEY_HEIGHT / 2 ) - salaryTextHeight

	-- Salary Text Drawing
	draw.DrawText( salaryText, Settings.FONT, salaryX, salaryY, Settings.COLOR_FG, TEXT_ALIGN_CENTER )

end

local function PaintMoneyStack()

	-- General Positions
	local centerX = Settings.MONEY_X + ( Settings.MONEY_WIDTH / 2 )
	local centerY = Settings.MONEY_Y + ( Settings.MONEY_HEIGHT / 2 )

	-- Salary Text
	local salaryText = LocalPlayer():getDarkRPVar( "salary" ) or ""
	salaryText = "$" .. FormatNumber( salaryText ) -- Format salary number

	-- Salary Dimensions
	local salaryTextWidth, salaryTextHeight = surface.GetTextSize( salaryText )

	-- Salary Position
	local salaryY = Settings.MONEY_Y

	-- Salary Text Drawing
	draw.DrawText( salaryText, Settings.FONT, centerX, salaryY, Settings.COLOR_FG, TEXT_ALIGN_CENTER )

	-- Wallet Text
	local walletText = LocalPlayer():getDarkRPVar( "money" ) or ""
	walletText = "$" .. FormatNumber( walletText ) -- Format money number

	-- Wallet Dimensions
	surface.SetFont( Settings.FONT )
	local walletTextWidth, walletTextHeight = surface.GetTextSize( walletText )

	-- Wallet Position
	local walletY = Settings.MONEY_Y + Settings.MONEY_HEIGHT - walletTextHeight

	-- Wallet Text Drawing
	draw.DrawText( walletText, Settings.FONT, centerX, walletY, Settings.COLOR_FG, TEXT_ALIGN_CENTER )

	-- Divider Dimensions
	local dividerWidth = Settings.MONEY_WIDTH * Settings.MONEY_WIDTH_DIVIDER
	local dividerHeight = Settings.MONEY_HEIGHT_DIVIDER

	-- Divider Positions
	local dividerX = centerX - ( dividerWidth / 2 )
	local dividerY = centerY - ( dividerHeight / 2 )
	-- Divider Drawing
	draw.RoundedBox( Settings.INFO_CORNER_RADIUS, dividerX, dividerY, dividerWidth, dividerHeight, Settings.INFO_COLOR_DIVIDER )

end

--[[---------------------------------------------------------
	Name: General Information
-----------------------------------------------------------]]

local function PaintInfo()

	-- Team Color
	local teamColor = ColorAlpha( team.GetColor( LocalPlayer():Team() ), Settings.INFO_COLOR_TEAM_ALPHA )

	-- Team Color Dark
	local delta = Settings.INFO_COLOR_DARK_DELTA -- The amount to change each component by in order to make the color darker
	local teamColorDarkRed = teamColor.r - delta >= 0 and teamColor.r - delta or 0
	local teamColorDarkGreen = teamColor.g - delta >= 0 and teamColor.g - delta or 0
	local teamColorDarkBlue = teamColor.b - delta >= 0 and teamColor.b - delta or 0
	local teamColorDark = Color( teamColorDarkRed, teamColorDarkGreen, teamColorDarkBlue, teamColor.a )

	-- Info Bar Dimensions
	local infoBarWidth = Settings.INFO_WIDTH
	local infoBarHeight = Settings.INFO_HEIGHT

	-- Border Drawing
	draw.RoundedBox( Settings.INFO_CORNER_RADIUS, Settings.INFO_X, Settings.INFO_Y, infoBarWidth, infoBarHeight, Settings.INFO_COLOR_BORDER )

	-- Background Position
	local backgroundX = Settings.INFO_X + Settings.INFO_PADDING_BACKGROUND
	local backgroundY = Settings.INFO_Y + Settings.INFO_PADDING_BACKGROUND

	-- Background Dimensions
	local backgroundWidth = infoBarWidth - ( 2 * ( Settings.INFO_PADDING_BACKGROUND ) ) 
	local backgroundHeight = infoBarHeight - ( 2 * (Settings.INFO_PADDING_BACKGROUND ) )

	-- Background Drawing
	draw.RoundedBox( Settings.INFO_CORNER_RADIUS, backgroundX, backgroundY, backgroundWidth, backgroundHeight, teamColorDark )

	-- Foreground Position
	local foregroundX = backgroundX
	local foregroundY = backgroundY -- Foreground info bar has full parent height

	-- Foreground Dimensions
	local foregroundWidth = backgroundWidth - Settings.INFO_PADDING_FOREGROUND -- Only 1 x INFO_PADDING_BACKGROUND because foreground info bar expands fully to the right
	local foregroundHeight = backgroundHeight -- Foreground info bar has full parent height

	-- Foreground Drawing
	draw.RoundedBox( Settings.INFO_CORNER_RADIUS, foregroundX, foregroundY, foregroundWidth, foregroundHeight, teamColor)

	-- Text Variables
	local jobName = LocalPlayer():getDarkRPVar( "job" ) or ""

	surface.SetFont( Settings.FONT )
	local textWidth, textHeight = surface.GetTextSize( jobName )

	local textX = Settings.INFO_X + ( Settings.INFO_WIDTH / 2 )
	local textY = Settings.INFO_Y + ( Settings.INFO_HEIGHT / 2 ) - ( textHeight / 2 )

	-- Text Drawing
	draw.DrawText( jobName, Settings.FONT, textX, textY, Settings.INFO_COLOR_TEXT, 1 )

end

--[[---------------------------------------------------------
	Name: LockDown
-----------------------------------------------------------]]

local function PaintLockDown()

	local chbxX, chboxY = chat.GetChatBoxPos()

	if GetGlobalBool( "DarkRP_LockDown" ) then
	
		-- Position
		local centerX = Settings.X + ( Settings.WIDTH / 2 )
		local messageX = centerX
		local messageY = Settings.Y - ( Settings.MESSAGE_Y_BUFFER )

		-- Message
		local message = DarkRP.getPhrase( "lockdown_started" )

		-- Drawing Message
		draw.DrawText( message, Settings.FONT, messageX, messageY, Settings.COLOR_FG, TEXT_ALIGN_CENTER )
	end

end

--[[---------------------------------------------------------
	Name: GunLicense
-----------------------------------------------------------]]

local function PaintGunLicense()

	local pageMaterial = Material( Settings.LICENSE_MATERIAL )

	if ( LocalPlayer():getDarkRPVar( "HasGunlicense" ) ) then

		-- Background Position
		local backgroundX = Settings.X + Settings.WIDTH + Settings.LICENSE_X_OFFSET

		local backgroundY = -1 -- Temporary
		if ( Settings.Y_ALIGN == "top" ) then
			backgroundY = 0  -- Very top
		elseif ( Settings.Y_ALIGN == "bottom" ) then
			backgroundY = ScrH() - Settings.LICENSE_HEIGHT
		end

		-- Background Color
		if ( GetGlobalBool( "DarkRP_LockDown" ) ) then
			currentBackgroundColor = Settings.COLOR_BG_LOCKDOWN
		else
			currentBackgroundColor = Settings.COLOR_BG
		end

		-- Background Drawing
 		draw.RoundedBox( Settings.LICENSE_CORNER_RADIUS, backgroundX, backgroundY, Settings.LICENSE_WIDTH, Settings.LICENSE_HEIGHT, currentBackgroundColor )

 		-- Border Drawing
 		draw.RoundedBox( 0, Settings.BORDER_X, Settings.BORDER_Y, Settings.LICENSE_WIDTH, Settings.HEIGHT_BORDER, Settings.COLOR_BORDER )

 		-- Page Position
 		local pageX = backgroundX + Settings.LICENSE_PADDING
 		local pageY = backgroundY + Settings.LICENSE_PADDING

 		-- Page Dimensions
 		local pageWidth = Settings.LICENSE_WIDTH - ( 2 * Settings.LICENSE_PADDING )
 		local pageHeight = Settings.LICENSE_HEIGHT - Settings.LICENSE_PADDING -- Only one - no padding on bottom edge

		-- Surface Drawing Setup
		surface.SetMaterial( pageMaterial )
		surface.SetDrawColor( 255, 255, 255, 255 )

		-- Drawing License Indicator
		surface.DrawTexturedRect( pageX, pageY, pageWidth, pageHeight )

	end
end

--[[---------------------------------------------------------
	Name: Agenda
-----------------------------------------------------------]]

local function PaintAgenda()

	local agenda = LocalPlayer():getAgendaTable()

	if not agenda then return end -- Stop drawing if there is no Agenda

	-- Agenda Text
	local agendaText
	agendaText = agendaText or DarkRP.textWrap( ( LocalPlayer():getDarkRPVar( "agenda" ) or "" ):gsub( "//", "\n" ):gsub( "\\n", "\n" ), Settings.FONT, Settings.PIXEL_WIDTH )

	-- Background Color
	if ( GetGlobalBool( "DarkRP_LockDown" ) ) then
		currentBackgroundColor = Settings.COLOR_BG_LOCKDOWN
	else
		currentBackgroundColor = Settings.COLOR_BG
	end

	-- Background Drawing
	draw.RoundedBox( Settings.AGENDA_CORNER_RADIUS, Settings.AGENDA_X, Settings.AGENDA_Y, Settings.AGENDA_WIDTH, Settings.AGENDA_HEIGHT, currentBackgroundColor )

	-- Header Drawing
	draw.RoundedBox( Settings.AGENDA_CORNER_RADIUS_HEADER, Settings.AGENDA_X, Settings.AGENDA_Y, Settings.AGENDA_WIDTH, Settings.AGENDA_HEIGHT_HEADER, Settings.AGENDA_COLOR_HEADER )

	-- Title Text
	local titleText = agenda.Title

	-- Title Drawing
	draw.DrawNonParsedText( titleText, Settings.FONT, Settings.AGENDA_X_TITLE, Settings.AGENDA_Y_TITLE, Settings.COLOR_FG, TEXT_ALIGN_LEFT )

	-- Agenda Drawing
	draw.DrawNonParsedText( agendaText, Settings.FONT, Settings.AGENDA_X_TITLE, Settings.AGENDA_Y_TEXT, Settings.COLOR_FG, TEXT_ALIGN_LEFT )

	-- draw.DrawNonParsedText( agenda.Title, "DarkRPHUD1", 30, 12, Color(255, 0, 0, 255), 0 )
	 --draw.DrawNonParsedText( agendaText, "DarkRPHUD1", 30, 35, Color(255, 255, 255, 255), 0 )

end

--[[---------------------------------------------------------
	Name: HUD Paint
-----------------------------------------------------------]]

local function PaintHUD()

	-- Custom Elements
	PaintBase()
	PaintHealth()
	PaintMoneyStack()
	PaintInfo()
	PaintLockDown()
	PaintGunLicense()
	PaintAgenda()

	--GAMEMODE.BaseClass:HUDPaint()

end

hook.Add( "HUDPaint", "PaintHUD", PaintHUD )