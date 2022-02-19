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
Trip findTrip(vector<Trip> tripList, std::string fareboxString) {
	//Trip containing all 9s
	Trip blankTrip = createTrip("9,9,9,9,9,0,9,9,9,9,00:00:00,9,\"Santa Cruz Metro Center\",0,9,,0,00:00:00");

	std::string timeString = "";
	//get the time string by going through the farebox string until there's a space
	int i;
	for (i = 0; fareboxString[i] != ' '; i++) {
		//cout << fareboxString[i];
 	}
 	i += 2; //increment i until its after the space
 	cout << endl;

 	//add to the timestring until the comma
 	for(i; fareboxString[i] != ','; i++) {
 		timeString.push_back(fareboxString[i]);
 	}

 	//cout << "Timestring: " << timeString << endl;

 	//convert the timestring to an int
 	int timeInt = timeToInt(timeString);



 	//// TO DO ////
 	/*
	Change the way it sarches trips to do the following order:
	1) Check if the time is before any of the trips in the block
	2) Check if the time is after any of the trips in the block
	3) Go through the block and check if the time is either within a trip or between trips

 	*/

 	//iterate through the trip vector to find the correct trip
 	Trip bestMatch;
	for (int j = 0; j < tripList.size(); j++) {
		//if it's within the times of a trip, assign it to that trip
		//if it after a trip but before the next, assign it to the nxet trip
		//if it's after the last trip (within an hour), assign it to the last trip
		//if it's before the first trip (withins an hour), assign it to the first trip
		//else, assign it to 9
		if (timeInt >= tripList[j]->startTime && timeInt <= tripList[j]->endTime) {
			bestMatch = tripList[j]; 
		} else if (j != (tripList.size() - 1) && timeInt > tripList[j]->endTime &&
				   timeInt <= tripList[j + 1]->startTime) {
			cout << "Between trips ";
			bestMatch = tripList[j + 1];
			printTrip(tripList[j+1]);

		} else if (j == (tripList.size() - 1) && timeInt > tripList[j]->endTime &&
				   timeInt < (tripList[j]->endTime + HOUR_INT)) {
			bestMatch = tripList[j];
		} else if (j == 0 && timeInt < tripList[j]->startTime &&
				   timeInt > (tripList[j]->startTime - HOUR_INT)) {
			bestMatch = tripList[j];
		} else {
			//set it to the 9 node
			bestMatch = blankTrip;
		}

	} 	



	cout << fareboxString << endl;
	cout << bestMatch->startTime << "," << bestMatch->endTime << "," << bestMatch->routeID << "," << bestMatch->run << "," << bestMatch->trip << "," << bestMatch->direction << endl;

	return bestMatch;
}

//given a file to output to, create the autohotkey entry for a trip
void createAHKfromTrip(std::string fileName, Trip tripObj) {

}

int main() {
	//load the correct block from GTFS trips.txt and put in a vector 
	std::string block = "1553"; //hard coded for now

	//open the file and read each line
	//add its information to the vector, checking if it's the correct block
	vector<Trip> tripList; //vector of trips
	ifstream GTFSfile("trips.csv"); //create file object
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


	string fileName = "export.csv";
	ifstream fareboxFile(fileName); //create file object
	string line; //line read from file
	if (fareboxFile.is_open()) {
		//go through by line
		while (getline(fareboxFile, line)) {
			//for each line, compare the times and generate the correct AHK
			findTrip(tripList, line);
		}
		//close the file after the last line
		fareboxFile.close();
	}

	cout << "1 hour = " << timeToInt("01:00:00") << endl;
}