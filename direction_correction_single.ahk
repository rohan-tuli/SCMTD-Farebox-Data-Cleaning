sleepTime := 20

OutboundTrips1 := ["750101", "170101", "350201", "790101", "350102", "710501", "170201", "660101", "710102", "750103", "410102", "350501", "355101", "350601", "355201", "350402", "750201", "690401", "355102", "680101", "710202", "750301", "790103", "100101", "350801", "690302", "350203", "170301", "710302", "750104", "350603", "710402", "400101", "660103", "690103", "750202", "790104", "350205", "350503", "350104", "170103", "680103", "710701", "750303", "350702", "690202", "350304", "710602", "750105", "910102", "790105", "350404", "710104", "170203", "350305", "660105", "710503", "750204", "350803", "690304", "680105", "710204", "750304", "790106", "350605", "710304", "170303", "350505", "710404", "750107", "350207", "350306", "690105", "660107", "350106", "750205", "910104", "790107", "180401", "350704", "690501", "680107", "710703", "750306", "170105", "350406", "690204", "800101", "350307", "350507", "710604", "750108", "790108", "350805", "710106", "660201", "800201", "170401", "660109", "710505", "750207", "350607", "690306", "800102", "680109", "710206", "750307", "910106", "790109", "350209", "350308", "710306", "800202", "350509", "710406", "750110", "170501", "350706", "690107", "800103", "660202", "173101", "350108", "173201", "750208", "173301", "173103", "173203", "173303", "173105", "790110", "173205", "173305", "350408", "173107", "357101"]

OutboundTrips2 := ["173401", "173307", "690503", "173109", "173403", "173309", "170601", "800203", "350309", "680111", "710802", "750309", "357201", "357301", "350807", "690206", "750111", "800104", "350511", "710705", "790111", "910108", "750210", "910201", "350609", "710606", "420101", "170403", "723101", "353401", "800204", "353302", "660301", "710108", "353502", "750310", "353801", "354001", "350211", "353306", "350512", "690308", "353207", "350310", "353608", "800105", "660204", "353107", "710507", "750112", "753117", "354102", "353907", "750211", "350708", "354204", "353708", "710208", "353215", "170701", "353501", "353206", "354101", "800205", "353202", "680113", "553101", "710308", "790113", "553104", "353201", "713501", "353602", "350410", "353204", "690109", "353304", "753111", "353606", "353506", "753115", "354005", "800106", "353510", "354007", "660303", "553106", "710408", "353213", "750311", "750212", "350809", "350513", "353205", "353305", "690505", "753112", "353607", "353507", "420102", "753116", "354201", "353210", "354203", "713101", "800206", "710804", "353101", "790114", "713103", "170603", "713202", "713302", "713402", "723103", "353103", "350611", "713105", "690208", "713204", "713503", "713404", "353702", "800107", "353105", "713107", "680115", "713206", "710707", "713505", "750213", "713406", "353704", "350213", "713109", "713507"]

OutboundTrips3 := ["690310", "353706", "713111", "800207", "713509", "353909", "354206", "710608", "353710", "170405", "350710", "660305", "753101", "800108", "753103", "753105", "710110", "753107", "753204", "753206", "350412", "753208", "680117", "753210", "753212", "180112", "753214", "753216", "753201", "800208", "710509", "723106", "713407", "350811", "693301", "693102", "693402", "710310", "693503", "170801", "693104", "693404", "693505", "660307", "693106", "693307", "353905", "350613", "693208", "693509", "693501", "710806", "693202", "690312", "693303", "353901", "693204", "693305", "350215", "353903", "693206", "693507", "693108", "693309", "710610", "753202", "723104", "723107", "553102", "713408", "350813", "660309", "710312", "803101", "803201", "803102", "350217", "803202", "803103", "803203", "803104", "803204", "710611", "803105", "803205", "803106", "803206", "803107", "660311", "803207", "803108", "803208"]

InboundTrips1 := ["40111", "40113", "40115", "40117", "170102", "170202", "170204", "170302", "170304", "170306", "170308", "170310", "170402", "170404", "170502", "170504", "170506", "170602", "170604", "170702", "173102", "173202", "173204", "173206", "173302", "173304", "173306", "173308", "173402", "173502", "173602", "173702", "173802", "173902", "174002", "350102", "350105", "350107", "350109", "350111", "350113", "350115", "350201", "350203", "350205", "350207", "350301", "350303", "350305", "350307", "350309", "350401", "350403", "350405", "350407", "350502", "350602", "350604", "350606", "350608", "350610", "350612", "350702", "350802", "350804", "350806", "350808", "350809", "350903", "350905", "351002", "351004", "351006", "351008", "351102", "351104", "351201", "351203", "353101", "353103", "353105", "353107", "353202", "353302", "353402", "353404", "353406", "353503", "355102", "355202", "357102", "357302", "410102", "410104", "420105", "420203", "420205", "553103", "553202", "553204", "660102", "660104", "660201", "660205", "663103", "663105", "663108", "663110", "663112", "663114", "663203", "663205", "663207", "663209", "663301", "663303", "663305", "663307", "663309", "663401", "663403", "663405", "680102", "680104", "680106", "680108", "680110", "680111", "680202", "680204", "690101", "690103", "690105", "690107", "690109", "690201", "690204", "690206", "350503", "350504", "690208", "690301", "690303", "690305", "690307", "690401", "690403", "690405", "690407", "690409", "690503", "690505", "693101", "693103", "693105", "693107", "693109", "693201", "693203", "693205", "693302", "693304", "693306", "693308", "693401", "693403", "693405", "693407", "693502"] 

InboundTrips2 := ["353802", "354002", "353307", "353208", "690504", "353609", "353108", "170602", "753118", "710803", "354103", "353908", "660302", "354205", "353709", "350610", "910202", "690207", "750113", "710706", "350212", "353601", "353203", "353603", "753110", "353605", "660205", "353505", "753114", "354004", "710607", "353509", "354006", "553105", "353212", "553107", "353214", "170404", "690309", "753109", "353604", "680114", "353504", "753113", "350709", "354003", "353508", "353209", "354202", "710109", "353211", "750312", "713102", "713201", "713301", "713401", "353301", "350312", "353102", "710209", "713104", "713203", "713502", "350411", "713403", "353701", "353104", "713106", "660304", "713205", "710508", "713504", "713405", "353703", "353106", "713108", "170702", "713506", "350810", "353705", "713110", "713508", "710309", "750214", "353707", "680116", "690506", "350612", "710805", "753102", "753104", "753106", "170604", "753108", "350214", "753205", "753207", "753209", "790115", "753211", "753213", "753215", "753217", "660306", "710708", "690311", "350711", "693201", "710609", "693302", "693103", "693403", "350413", "693504", "693105", "170406", "693405", "693506", "693107", "693308", "353906", "710111", "693101", "693401", "693502", "693203", "180113", "693304", "350812", "353902", "693205", "693306", "660308", "353904", "693207", "693508", "170802", "693109", "710311", "753203", "723105", "723108", "553103", "713409", "690313", "350216", "660310", "350814"]

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

	Sleep sleepTime
	Sleep sleepTime
	Sleep sleepTime
	Send, ^c ; control C
	Sleep sleepTime
	Sleep sleepTime
	Sleep sleepTime
	Sleep sleepTime
	Sleep sleepTime
	Sleep sleepTime
	Sleep sleepTime
	Sleep sleepTime

	;move over another two tabs
	Send, {tab}
	Sleep sleepTime
	Send, {tab}
	Sleep sleepTime

	;change the direction to OB if what's in the clipboard is in the OB array
	if ((HasVal(OutboundTrips1, clipboard) > 0) || (HasVal(OutboundTrips2, clipboard) > 0) || (HasVal(OutboundTrips3, clipboard) > 0)) {
		Sleep sleepTime
		Sleep sleepTime
		Sleep sleepTime
		Sleep sleepTime
		Sleep sleepTime
		Sleep sleepTime
		Sleep sleepTime
		Sleep sleepTime
		Send o
		Sleep sleepTime
	}

	if ((HasVal(InboundTrips1, clipboard) > 0) || (HasVal(InboundTrips2, clipboard) > 0)) {
		Sleep sleepTime
		Sleep sleepTime
		Sleep sleepTime
		Sleep sleepTime
		Sleep sleepTime
		Sleep sleepTime
		Sleep sleepTime
		Sleep sleepTime
		Send i
		Sleep sleepTime
	}
	Sleep sleepTime
	Sleep sleepTime


	clipboard := ; clear the clipboard

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