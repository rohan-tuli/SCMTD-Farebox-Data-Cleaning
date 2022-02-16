#include <iostream>
#include <fstream>
#include <string>
#include <vector>

using namespace std;

//max trips per block
#define MAX_TRIPS_PER_BLOCK 30

//trip array indices
#define START_TIME 0
#define END_TIME 1
#define ROUTE_ID 2
#define RUN 3
#define TRIP 4
#define DIRECTION 5

//trip datastructure
typedef struct TripObj *Trip;
typedef struct TripObj {
	int startTime;
	int endTime;
	std::string routeID;
	std::string run;
	std::string trip;
	int direction;
} TripObj;


//function to create a new trip from a line of the GTFS trips.txt
Trip createTrip(std::string block, std::string GTFSstring) {
	//check the block from GTFS against the desired block

	//allocate memory

	//fill the array
}


int main() {
	//load the correct block from GTFS trips.txt and put in a vector 
	std::string block = "1553"; //hard coded for now

	//open the file and read each line
	//add its information to the vector, checking if it's the correct block
	vector<Trip> tripList; //vector of trips
	ifstream GTFSfile("trips.txt"); //create file object
	string lineFromGTFSfile;
	if (GTFSfile.is_open()) {
		//go through by line
		while (getline(GTFSfile, lineFromGTFSfile)) {
			cout << lineFromGTFSfile << endl;
		}
	}
	GTFSfile.close(); //close the GTFS file after the last line




	string fileName = "export.csv";
	ifstream fareboxFile(fileName); //create file object
	string line; //line read from file
	if (fareboxFile.is_open()) {
		//go through by line
		while (getline(fareboxFile, line)) {
			cout << line << endl;
		}
		//close the file after the last line
		fareboxFile.close();
	}
}