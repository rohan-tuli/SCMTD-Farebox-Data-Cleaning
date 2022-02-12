#include <iostream>
#include <fstream>

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




int main() {
	//load the correct block from GTFS trips.txt and put in a vector 
	int block = 1553; //hard coded for now
	//2D array, where each line contains: start time as int, end time as int, (modified)route_id, run, trip, direction

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