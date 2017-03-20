local class = require 'ext.class'
local table = require 'ext.table'

local Card = class()

Card.names = table{'A','2','3','4','5','6','7','8','9','T','J','Q','K'}

local red = '\27[31;1m'
local black = '\27[30;0m'
local grey = '\27[30;1m'
local white = '\27[37;0m'
local redback = '\27[41;1m'
local greyback = '\27[40;1m'
local blackback = '\27[40;0m'
Card.suits = table{
	{name='spades', symbol=greyback..'♠'..blackback},
	{name='hearts', symbol=redback..'♥'..blackback},
	{name='diamonds', symbol=red..'♦'..white},
	{name='clubs', symbol=grey..'♣'..white},
}

Card.facedown = '##'	--facedown-card string.  I might make 'facedown' flag...

function Card:init(args)
	self.value = args.value	-- 1-13
	self.suit = args.suit	-- 1-4
end

function Card:__tostring()
	return self.names[self.value]..self.suits[self.suit].symbol
end
function Card.__concat(a,b) return tostring(a) .. tostring(b) end

function Card.__eq(a,b)
	return a.value == b.value and a.suit == b.suit
end

return Card
