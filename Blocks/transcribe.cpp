#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <cstring>

using namespace std;

//max trips per block
#define MAX_TRIPS_PER_BLOCK 30

//comma counts
#define TRIP_HEADSIGN_COMMAS 3
#define RUN_ID_COMMAS 5
#define TRIP_LABEL_COMMAS 8
#define TRIP_TIME_END_COMMAS 10
#define DIRECTION_ID_COMMAS 16
#define TRIP_TIME_START_COMMAS 17

#define HOUR_INT 60
#define TEN_MIN_INT 10

//trip datastructure
typedef struct TripObj *Trip;
typedef struct TripObj {
	int startTime;
	int endTime;
	char* routeID;
	char* run;
	char* trip;
	int direction;
} TripObj;

//to DO: define a special "9" node to be used when to trip fits


//check if the correct string is from the desired block
bool isCorrectBlock(std::string block, std::string GTFSstring) {
	//check the block from GTFS against the desired block (block is the 6th item)
	std::string blockFromGTFS; //string to put the block in
	//go to the 5th comma
	int stringIndex = 0;
	int commaCount = 0;
	while (commaCount != 5) {
		if (GTFSstring[stringIndex] == ',') {
			commaCount++;
		}
		stringIndex++;
	}
	//transcribe the characters after the comma until the next comma is reached
	while(GTFSstring[stringIndex] != ',') {
		blockFromGTFS.push_back(GTFSstring[stringIndex]);
		stringIndex++;
	}

	//check that it's the correct block
	if (block.compare(blockFromGTFS) == 0) {
		return true;
	} else {
		return false;
	}
}

//convert time to int
int timeToInt(std::string timeString) {
	int timeInt = 0;
		timeInt += timeString[1] - 48;

		timeInt += (timeString[0] - 48) * 10;

		timeInt *= 60;

		timeInt += timeString[4] - 48;
		timeInt += (timeString[3] - 48) * 10;

	return timeInt;
}

//function to create a new trip from a line of the GTFS trips.txt
Trip createTrip(std::string GTFSstring) {
	//cout << GTFSstring << endl;
	//allocate memory
	Trip newTrip = (Trip)malloc(sizeof(TripObj));

	std::string routeID;
	std::string run;
	std::string trip;
	std::string direction;
	std::string startTime;
	std::string endTime;

	int stringIndex = 0;
	int commaCount = 0;


	while (commaCount <= 17) {
		if (GTFSstring[stringIndex] == ',') {
			commaCount++;
		}
		//trip_headsign after 3 commas
		if (commaCount == TRIP_HEADSIGN_COMMAS && GTFSstring[stringIndex] != ',') {
			routeID.push_back(GTFSstring[stringIndex]);
		} else if (commaCount == RUN_ID_COMMAS && GTFSstring[stringIndex] != ',') {
			run.push_back(GTFSstring[stringIndex]);
		} else if (commaCount == TRIP_LABEL_COMMAS && GTFSstring[stringIndex] != ',') {
			trip.push_back(GTFSstring[stringIndex]);
		} else if (commaCount == DIRECTION_ID_COMMAS  && GTFSstring[stringIndex] != ',') {
			direction.push_back(GTFSstring[stringIndex]);
		} else if (commaCount == TRIP_TIME_START_COMMAS  && GTFSstring[stringIndex] != ',') {
			startTime.push_back(GTFSstring[stringIndex]);
		} else if (commaCount == TRIP_TIME_END_COMMAS  && GTFSstring[stringIndex] != ',') {
			endTime.push_back(GTFSstring[stringIndex]);
		}

		stringIndex++;
	}

	/*
	cout << routeID << endl;
	cout << run << endl;
	cout << trip << endl;
	cout << direction << endl;
	cout << startTime << endl;
	cout << endTime << endl;
	cout << timeToInt(startTime) << endl;
	cout << timeToInt(endTime) << endl; */

	//allocate memory for all the char*'s and convert the direction to an int
	newTrip->routeID = (char*)calloc(routeID.length() + 1, sizeof(char));
	strcpy(newTrip->routeID, routeID.c_str());

	newTrip->run = (char*)calloc(run.length() + 1, sizeof(char));
	strcpy(newTrip->run, run.c_str());

	newTrip->trip = (char*)calloc(trip.length() + 1, sizeof(char));
	strcpy(newTrip->trip, trip.c_str());

	newTrip->startTime = timeToInt(startTime);
	newTrip->endTime = timeToInt(endTime);

	if (direction.compare("1") == 0) {
		newTrip->direction = 1;
	} else {
		newTrip->direction = 0;
	}

	return newTrip;
}

//print out the block vector
void printBlock(vector<Trip> tripList) {
	for (int i = 0; i < tripList.size(); i++) {
		cout << tripList.at(i)->startTime << ", "
			 << tripList.at(i)->endTime << ", "
			 << tripList.at(i)->routeID << ", "
			 << tripList.at(i)->run << ", "
			 << tripList.at(i)->trip << ", "
			 << tripList.at(i)->direction << endl;
	}
}

void printTrip(Trip printMe) {
	cout << printMe->startTime << ", "
		 << printMe->endTime << ", "
		 << printMe->routeID << ", "
		 << printMe->run << ", "
		 << printMe->trip << ", "
		 << printMe->direction << endl;
}


//given a farebox export string, search the vector and return trip of the corresponding time
Trip findTrip(Trip blankTrip, vector<Trip> tripList, std::string fareboxString) {
	cout << "findTrip()" << endl;

	cout << "created blank trip" << endl;
	std::string timeString = "";
	//get the time string by going through the farebox string until there's a space
	int i;
	for (i = 0; fareboxString[i] != ' '; i++) {
		//cout << fareboxString[i];
 	}
 	i ++; //increment i until its after the space
 	cout << endl;

 	//add to the timestring until the comma
 	for(i; fareboxString[i] != ','; i++) {
 		timeString.push_back(fareboxString[i]);
 	}

 	//cout << "FB Time StringX" << timeString << endl;

 	//convert the timestring to an int
 	int timeInt = timeToInt(timeString);



 	//// TO DO ////
 	/*
	Change the way it sarches trips to do the following order:
	1) Check if the time is before any of the trips in the block
	2) Check if the time is after any of the trips in the block
	3) Go through the block and check if the time is either within a trip or between trips


 	*/


 	//by default, assume the best match is the empty trip
 	Trip bestMatch = blankTrip;

 	//cout << "Time int: " << timeInt << endl;
 	//check if the time is within an hour of the first trip - up until the start of the second trip
 	if (timeInt < tripList[0]->endTime && timeInt >= (tripList[0]->startTime - HOUR_INT)) {
 		//set it to the first trip
 		bestMatch = tripList[0];
 	}

 	//check if the time is within the last trip or the hour following it
 	else if (timeInt >= tripList.back()->startTime &&
 		   	 timeInt <= (tripList.back()->endTime + HOUR_INT)) {
 		bestMatch = tripList.back();
 	}

 	//if it's between the first and second trips, assign to the second trip
 	else if (timeInt >= tripList[0]->startTime && timeInt < tripList[1]->startTime) {
 		bestMatch = tripList[1];
 	}

 	//if it's between the second to last and last trips, assign to the last trip
 	else if (timeInt >= tripList[tripList.size() - 2]->endTime &&
 			 timeInt < tripList[tripList.size() - 1]->endTime) {
 		bestMatch = tripList[tripList.size() - 1];
 	}

 	/* for everything else, go through the intermediate trips and use the trip if the time is 
 	after the end time of the previous trip and before the end time of this trip
 	*/

 	for (int j = 1; j < tripList.size() - 1; j++) {
 		if (timeInt >= tripList[j - 1]->endTime && timeInt < tripList[j]->endTime) {
 			bestMatch = tripList[j];
 		}
 	}


	cout << fareboxString << endl;
	printTrip(bestMatch);


	return bestMatch;
}

//given a file to output to, create the autohotkey entry for a trip
void createAHKfromTrip(ofstream &outputFile, Trip tripObj) {
	//ofstream outputFile(fileName);

	//if (outputFile.is_open()) {
		//enter route code
		outputFile << "Send " << tripObj->routeID << endl; 
		outputFile << "Sleep sleepTime" << endl;

		//tab over
		outputFile << "Send, {tab}" << endl;

		//enter "run"
		outputFile << "Send " << tripObj->run << endl;
		outputFile << "Sleep sleepTime" << endl;

		//tab over
		outputFile << "Send, {tab}" << endl;

		//enter trip
		outputFile << "Send " << tripObj->trip << endl;
		outputFile << "Sleep sleepTime" << endl;

		//tab over twice to skip driver
		outputFile << "Send, {tab}" << endl;
		outputFile << "Sleep sleepTime" << endl;
		outputFile << "Send, {tab}" << endl;
		outputFile << "Sleep sleepTime" << endl;

		//enter o for outbound or i for inbound
		if (tripObj->direction == 1) {
			outputFile << "Send i" << endl;
		} else {
			outputFile << "Send o" << endl;
		}

		//tab over twice to get to the next line
		outputFile << "Send, {tab}" << endl;
		outputFile << "Sleep sleepTime" << endl;
		outputFile << "Send, {tab}" << endl;
		outputFile << "Sleep sleepTime" << endl;

		outputFile << endl;

		//outputFile.close();
	//}

}

int main() {
	cout << "Please enter a block: ";
	std::string block;
	getline(cin, block);

	//create the file
	ofstream outputFile("autoclean.ahk");

	//start line of the file with sleep time variable and F10 key
	if (outputFile.is_open()) {
		outputFile << "sleepTime := 5" << endl;;
		outputFile << "F10::" << endl;
		//outputFile.close();
	}




	//load the correct block from GTFS trips.txt and put in a vector 
	//std::string block = "1553"; //hard coded for now

	//open the file and read each line
	//add its information to the vector, checking if it's the correct block
	vector<Trip> tripList; //vector of trips
	ifstream GTFSfile("trips.txt"); //create file object
	string lineFromGTFSfile;
	if (GTFSfile.is_open()) {
		//go through by line
		while (getline(GTFSfile, lineFromGTFSfile)) {
			//check if this line contains a trip from the desired block
			if (isCorrectBlock(block, lineFromGTFSfile) == true) {
				//append a comma so it doesn't break
				lineFromGTFSfile.push_back(',');
				//add the trip in this line to the vector
				tripList.push_back(createTrip(lineFromGTFSfile));
			}
		}
	}
	GTFSfile.close(); //close the GTFS file after the last line


	//print the block
	printBlock(tripList);

	//Trip containing all 9s
	Trip blankTrip = createTrip("9,9,9,9,9,0,9,9,9,9,00:00:00,9,,0,9,,0,00:00:00");

	string fileName = "export.csv";
	ifstream fareboxFile(fileName); //create file object
	string line; //line read from file
	if (fareboxFile.is_open()) {
		cout << "Opening export file" << endl;
		//go through by line
		while (getline(fareboxFile, line)) {
			cout << "Getting line" << endl;
			//for each line, compare the times and generate the correct AHK
			createAHKfromTrip(outputFile, findTrip(blankTrip, tripList, line));
		}
		//close the file after the last line
		fareboxFile.close();
	}

	//output a return
	outputFile << "return" << endl;

	//close the output file
	outputFile.close();

}