#include "outputInfo.h"

void OutputInfo(ostream & os, int exit_code) {
	os << "Usage: " << program_name << " options [filename]" << endl;
	os << " -h --help: Display this usage information." << endl;
	os << " -o --output filename: Write output to file." << endl;
	os << " -v --verbose: Print verbose messages." << endl;
	exit(exit_code);
}
