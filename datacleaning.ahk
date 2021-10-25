sleepTime := 20

OutboundTrips := ["40101", "40102", "40103", "170303"]
InboundTrips := ["40111", "40113", "40115"]

HasVal(haystack, needle) {
    for index, value in haystack
        if (value = needle)
            return index
    if !(IsObject(haystack))
        throw Exception("Bad haystack!", -1, haystack)
    return 0
}

#MaxThreadsPerHotkey, 3
F12:: ;F12 key
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

	Send, ^c ; control C
	Sleep sleepTime

	;move over another two tabs
	Send, {tab}
	Sleep sleepTime
	Send, {tab}
	Sleep sleepTime

	;change the direction to OB if what's in the clipboard is in the OB array
	if (HasVal(OutboundTrips, clipboard) > 0) {
		Send {Up}
		Send {Up}
		Send {Up}
		Send {Up}
		Send {Up}
		Send {Up}
		Send {Up}
		Send {Up}
		Send {Up}
		Sleep sleepTime
		Send {Up}
		Sleep sleepTime
		Send {Down}
		Sleep sleepTime
	}

	if (HasVal(InboundTrips, clipboard) > 0) {
		Send {Up}
		Send {Up}
		Send {Up}
		Send {Up}
		Send {Up}
		Send {Up}
		Send {Up}
		Send {Up}
		Send {Up}
		Sleep sleepTime
		Send {Up}
		Sleep sleepTime
	}
	Sleep sleepTime

	;another two tabs to wrap back around to the next line
	Send, {tab}
	Sleep sleepTime
	Send, {tab}
	Sleep sleepTime

	if not KeepLoopRunning ; user signaled the loop to stop by pressing Win-Z again
		break ; break out of the loop
}

KeepLoopRunning := false
return