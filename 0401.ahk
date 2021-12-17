/* 
0401.ahk
Created by Rohan Tuli on 2021-11-01

Replaces time based trip IDs (e.g. 1625) with block-order based trip IDs (e.g. 040109) on block 0401.

*/
; define delay times (prevents it from missing entries because the keystrokes happend before the UI could change)
sleepTime := 20
doubleSleepTime := 40 ;these are not datatypes - it just worked out like this
longSleepTime := 160 ;I miss datatypes 


#MaxThreadsPerHotkey, 3
F11:: ;F11 key
#MaxThreadsPerHotkey, 1

if KeepLoopRunning {
	KeepLoopRunning := false
	return
}

KeepLoopRunning := true
Loop {
	; two tabs
	Send, {tab}
	Sleep sleepTime
	Send, {tab}
	Sleep sleepTime

	Sleep sleepTime
	Sleep sleepTime
	Sleep sleepTime
	Send, ^c ; control C
	Sleep longSleepTime


	;change the time-basedtrip ID to the order-based trip ID
	;yes, I'm aware that this code is disgusting, but it works. And anyway, AutoHotKey is disgusting
	if (clipboard = "1625") {
		Sleep doubleSleepTime
		Sleep sleepTime
		Send 40109
		Sleep doubleSleepTime
	} else if (clipboard = "1715") {
		Sleep doubleSleepTime
		Sleep sleepTime
		Send 40110
		Sleep doubleSleepTime
	} else if (clipboard = "1810") {
		Sleep doubleSleepTime
		Sleep sleepTime
		Send 40111
		Sleep doubleSleepTime
	} else if (clipboard = "1900") {
		Sleep doubleSleepTime
		Send 40112
		Sleep doubleSleepTime
	} else if (clipboard = "1940") {
		Sleep doubleSleepTime
		Send 40113
		Sleep doubleSleepTime
	} else if (clipboard = "2030") {
		Sleep doubleSleepTime
		Send 40114
		Sleep doubleSleepTime
	} else if (clipboard = "2110") {
		Sleep doubleSleepTime
		Send 40115
		Sleep doubleSleepTime
	} else if (clipboard = "2200") {
		Sleep doubleSleepTime
		Send 40116
		Sleep doubleSleepTime
	} else if (clipboard = "2240") {
		Sleep doubleSleepTime
		Sleep sleepTime
		Send 40117
		Sleep doubleSleepTime
	} else if (clipboard = "2345") {
		Sleep doubleSleepTime
		Send 40118
		Sleep doubleSleepTime
	}

	Sleep doubleSleepTime

	clipboard := ; clear the clipboard

	Sleep sleepTime

	;another four tabs to wrap back around to the next line
	Send, {tab}
	Sleep sleepTime
	Send, {tab}
	Sleep sleepTime
	Send, {tab}
	Sleep sleepTime
	Send, {tab}
	Sleep sleepTime

	if not KeepLoopRunning ; user signaled the loop to stop by pressing Win-Z again
		break ; break out of the loop
}

KeepLoopRunning := false
return