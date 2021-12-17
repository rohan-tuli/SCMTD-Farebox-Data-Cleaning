
; define delay times (prevents it from missing entries because the keystrokes happend before the UI could change)
sleepTime := 20
doubleSleepTime := 40 ;these are not datatypes - it just worked out like this
longSleepTime := 160 ;I miss datatypes 


numDistinctBuses := 4 ;number of pages in the GFI editor

OutboundTrips1 := ["40101", "40102", "40103", "170303", "713101", "713103", "713105", "713107", "713109", "713111", "40104", "40105", "40106", "40107", "40108", "40109", "40110", "40112", "40114", "40114", "40116", "40118", "100101", "100102", "100103", "100104", "100105", "100106", "100107", "100108", "100109", "100110", "100111", "100112", "100113", "100114", "170101", "170201", "170203", "170301", "170303", "170305", "170307", "170309", "170401", "170403", "170501", "170503", "170505", "170603", "170701", "173101", "173201", "173203", "17305", "173301", "173303", "173305", "173307", "173401", "173501", "173601", "173701", "173801", "173901", "174001", "350101", "350103", "350104", "350106", "350108", "350110", "350112", "350114", "350202", "350204", "350206", "350208", "350302", "350304", "350306", "350308", "350402", "350404", "350406", "350408", "350501", "350503", "350504", "350505", "350601", "350603", "350605", "350607", "350609", "350611", "350701", "350703", "350801", "350803", "350805", "350807", "350810", "350901", "350902", "350904", "351001", "351003", "351005", "351007", "351101", "351103", "351105", "351106", "351202", "353102", "353104", "353106", "353201", "353301", "353401", "353403", "353405", "353407", "353501", "353502", "355101", "355201", "357101", "357201", "357301", "410101", "410103", "420101", "420102", "420103", "420104", "420201", "420202", "420204", "553101", "553102", "553201", "553203", "660101", "660103", "660202", "660203", "660204", "663101", "663102", "663104", "663106", "663107", "663109", "663111", "663113", "663115", "663201", "663202", "663204", "663206", "663208", "663210", "663302", "663304", "663306", "663308", "663402", "663404"]

OutboundTrips2 := ["663406", "680101", "680103", "680105", "680107", "680109", "680112", "680113", "680201", "680203", "680205", "690102", "690104", "690106", "690108", "690110", "690202", "690203", "690205", "690207", "690209", "690302", "690304", "690306", "690308", "690402", "690404", "690406", "690408", "690501", "690502", "690504", "693102", "693104", "693106", "693108", "693202", "693204", "693301", "693303", "693305", "693307", "693309", "693402", "693404", "693406", "693408", "693501", "693503", "693505", "693507", "693509", "693601", "693603", "693605", "693607", "693609", "710102", "710104", "710106", "710108", "710110", "710202", "710204", "710206", "710208", "710210", "710212", "710302", "710304", "710402", "710404", "710406", "710408", "710410", "710502", "710504", "710506", "710601", "710603", "710605", "710607", "710609", "710611", "710701", "710703", "710705", "710707", "710709", "710801", "710803", "710805", "710807", "710901", "710903", "710905", "710907", "710909", "711002", "711004", "713101", "713103", "713105", "713107", "713109", "713111", "713202", "713204", "713206", "713302", "713401", "713403", "713405", "713407", "713502", "713504", "713506", "713601", "713603", "713605", "713607", "713609", "713702", "713704", "713706", "713708", "713710", "723101", "723103", "723104", "723106", "723107", "750101", "750102", "750104", "750105", "750107", "750108", "750110", "750111", "750112", "750113", "750201", "750203", "750204", "750206", "750207", "750209", "750301", "750302", "750304", "750305", "750307", "750308", "750309", "750311", "753101", "753103", "753105", "753107", "753109", "753111", "753113", "753115", "753117", "753201", "753202", "753204", "753206"]

OutboundTrips3 := ["753208", "753210", "753212", "753214", "753216", "790101", "790103", "790104", "790105", "790106", "790107", "790108", "790109", "790110", "790111", "790113", "790115", "800101", "800102", "800103", "800104", "800105", "800106", "800107", "800108", "800201", "800202", "800203", "800204", "800205", "800206", "800207", "800208", "803101", "803102", "803103", "803104", "803105", "803106", "803107", "803108", "803201", "803202", "803203", "803204", "803205", "803206", "803207", "803208", "810101", "810102", "810103", "810104", "810105", "810106", "810107", "810108", "810109", "810110", "810111", "813101", "813102", "813103", "813104", "813105", "813106", "813107", "813108", "813109", "813110", "813111", "813112", "813113", "910102", "910104", "910106", "910108", "910110", "910201", "910203", "910205", "910207", "910209"]

InboundTrips1 := ["40111", "40113", "40115", "40117", "170102", "170202", "170204", "170302", "170304", "170306", "170308", "170310", "170402", "170404", "170502", "170504", "170506", "170602", "170604", "170702", "173102", "173202", "173204", "173206", "173302", "173304", "173306", "173308", "173402", "173502", "173602", "173702", "173802", "173902", "174002", "350102", "350105", "350107", "350109", "350111", "350113", "350115", "350201", "350203", "350205", "350207", "350301", "350303", "350305", "350307", "350309", "350401", "350403", "350405", "350407", "350502", "350602", "350604", "350606", "350608", "350610", "350612", "350702", "350802", "350804", "350806", "350808", "350809", "350903", "350905", "351002", "351004", "351006", "351008", "351102", "351104", "351201", "351203", "353101", "353103", "353105", "353107", "353202", "353302", "353402", "353404", "353406", "353503", "355102", "355202", "357102", "357302", "410102", "410104", "420105", "420203", "420205", "553103", "553202", "553204", "660102", "660104", "660201", "660205", "663103", "663105", "663108", "663110", "663112", "663114", "663203", "663205", "663207", "663209", "663301", "663303", "663305", "663307", "663309", "663401", "663403", "663405", "680102", "680104", "680106", "680108", "680110", "680111", "680202", "680204", "690101", "690103", "690105", "690107", "690109", "690201", "690204", "690206", "350503", "350504", "690208", "690301", "690303", "690305", "690307", "690401", "690403", "690405", "690407", "690409", "690503", "690505", "693101", "693103", "693105", "693107", "693109", "693201", "693203", "693205", "693302", "693304", "693306", "693308", "693401", "693403", "693405", "693407", "693502"] 

InboundTrips2 := ["693504", "693506", "693508", "693602", "693604", "693606", "693608", "710101", "710103", "710105", "710107", "710109", "710111", "710201", "710203", "710205", "710207", "710209", "710211", "710213", "710301", "710303", "710305", "710401", "710403", "710405", "710407", "710409", "710501", "710503", "710505", "710507", "710602", "710604", "710606", "710608", "710610", "710612", "710702", "710704", "710706", "710708", "710802", "710804", "710806", "710808", "710902", "710904", "710906", "710908", "711001", "711003", "713102", "713104", "713106", "713108", "713110", "713201", "713203", "713205", "713301", "713402", "713404", "713406", "713408", "713501", "713503", "713505", "713602", "713604", "713606", "713608", "713701", "713703", "713705", "713707", "713709", "723102", "723105", "723108", "750103", "750106", "750109", "750114", "750202", "750205", "750208", "750303", "750306", "750310", "753102", "753104", "753106", "753108", "753110", "753112", "753114", "753116", "753118", "753203", "753205", "753207", "753209", "753211", "753213", "753215", "753217", "790102", "790112", "790114", "910101", "910103", "910105", "910107", "910109", "910202", "910204", "910206", "910208", "910210"]

;set coordinate mode
CoordMode, Pixel, Screen

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

;declare? pixel color
pixelColor := 

;define line counter (start at line 1)
lineCounter := 1

eventLineCounter := 0

Loop {
	;run loop from the single instance program until the end condition is met
	while(eventLineCounter < 50) { ;end condition = the pixels from the date range dropdown turn blue
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

		;move over another two tabs
		Send, {tab}
		Sleep sleepTime
		Send, {tab}
		Sleep sleepTime

		;PixelGetColor, pixelColor, 680, 125 ;GFI window must be on main 1680x1050 monitor, snapped to the left
		;Sleep, sleepTime

		;change the direction to OB if what's in the clipboard is in the OB array
		if ((HasVal(OutboundTrips1, clipboard) > 0) || (HasVal(OutboundTrips2, clipboard) > 0) || (HasVal(OutboundTrips3, clipboard) > 0)) {
			Sleep longSleepTime
			Send o
			Sleep sleepTime
		}

		if ((HasVal(InboundTrips1, clipboard) > 0) || (HasVal(InboundTrips2, clipboard) > 0)) {
			Sleep longSleepTime
			Send i
			Sleep sleepTime
		}
		Sleep doubleSleepTime


		clipboard := ; clear the clipboard

		Sleep sleepTime

		;another two tabs to wrap back around to the next line
		Send, {tab}
		Sleep sleepTime
		Send, {tab}
		Sleep doubleSleepTime
		Sleep doubleSleepTime


		;PixelGetColor, pixelColor, 680, 125 ;GFI window must be on main 1680x1050 monitor, snapped to the left
		;Sleep, sleepTime

		eventLineCounter++

		if not KeepLoopRunning ; user signaled the loop to stop by pressing F12 again
			break ; break out of the loop
	}
		
	;press F2
	Send {F2}
	Sleep, sleepTime
	Send {Enter}
	Sleep, sleepTime

	;go down the number of lines specified by the line counter
	i := 0
	while (i < lineCounter) {
		Send, {Down}
		Sleep, doubleSleepTime
		i++ ;increment i
	}

	;go back to the data pane 
	Send, {tab}
	Sleep doubleSleepTime

	;increment the line counter
	lineCounter++

	if not KeepLoopRunning ; user signaled the loop to stop by pressing F12 again
		break ; break out of the loop

}

KeepLoopRunning := false
return