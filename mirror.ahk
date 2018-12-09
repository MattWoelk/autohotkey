; This is specifically for Kinesis keyboards using the Colemak keyboard layout, to mirror the keyboard so you can type both sides of it using only the left hand.

; A #CommentFlag will need to be included if we can manage to map ;
mirror_1 = 0
mirror_2 = 9
mirror_3 = 8
mirror_4 = 7
mirror_5 = 6
mirror_q = `;
mirror_w = y
mirror_f = u
mirror_p = l
mirror_g = j
mirror_a = o
mirror_r = i
mirror_s = e
mirror_t = n
mirror_d = h
mirror_z = /
mirror_x = .
mirror_c = ,
mirror_v = m
mirror_b = k
mirror_backspace = space
return

; If delete didn't modify anything, send a real delete key
; upon release. oooien
delete::
Send {delete}
return

delete & 1::
delete & 2::
delete & 3::
delete & 4::
delete & 5::
delete & q::
delete & w::
delete & f::
delete & p::
delete & g::
delete & a::
delete & r::
delete & s::
delete & t::
delete & d::
delete & z::
delete & x::
delete & c::
delete & v::
delete & b::
delete & backspace::

; Determine the mirror key, if there is one:
;StringLeft, ThisKey, A_ThisHotkey, 1
;ThisKey := A_ThisHotkey
ThisKey := SubStr(A_ThisHotkey, 10)

;StringTrimRight, MirrorKey, mirror_%ThisKey%, 0  ; Retrieve "array" element.
MirrorKey := mirror_%ThisKey%
;if MirrorKey =  ; No mirror, so do nothing?
;   return

Modifiers =
GetKeyState, state1, LWin
GetKeyState, state2, RWin
state = %state1%%state2%
if state <> UU  ; At least one Windows key is down.
   Modifiers = %Modifiers%#
GetKeyState, state1, Control
if state1 = D
   Modifiers = %Modifiers%^
GetKeyState, state1, Alt
if state1 = D
   Modifiers = %Modifiers%!
GetKeyState, state1, Shift
if state1 = D
   Modifiers = %Modifiers%+
Send %Modifiers%{%MirrorKey%}
return
