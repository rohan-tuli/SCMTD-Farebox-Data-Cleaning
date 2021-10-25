sleepTime := 20

#MaxThreadsPerHotkey, 3
#z:: ;windows + Z key
#MaxThreadsPerHotkey, 1

if KeepLoopRunning {
	KeepLoopRunning := false
	return
}

KeepLoopRunning := true
Loop {
	Send, {tab}
	Sleep sleepTime
	Send, {tab}
	Sleep sleepTime

	if not KeepLoopRunning ; user signaled the loop to stop by pressing Win-Z again
		break ; break out of the loop
}

KeepLoopRunning := false
return