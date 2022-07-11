#include <vector>
#include <iostream>
#include <fstream>
#include <sstream> 

std::pair<std::vector<std::vector<std::string>>,std::string> readCSV(std::string file_name){

// Pointer to the file
    std::fstream fin;

    fin.open(file_name, std::ios::in);

    if(!fin.is_open())
    {
        std::cerr << "Could not open the file: " << file_name << std::endl;
        exit(1);
    }
std::vector<std::vector<std::string>> content;

std::string line, word, header;
std::vector<std::string> row;

std::getline(fin,line);
header = line;


while(getline(fin,line))
{

    row.clear();

    std::stringstream s(line);
    
    while(std::getline(s,word,',')){

        row.push_back(word);
}

content.push_back(std::move(row));

}

fin.close();

return make_pair(content,header);

}

void writeCSV(std::string file_name, std::string header, std::vector<std::vector<std::string>> content){


    std::fstream fout;

    fout.open(file_name, std::ios::out );

    fout << header << std::endl;

    for (auto line : content )
    {

        int index = 0;
        for (auto word : line){

          fout << word;
          if (index < line.size()-1)  
          fout << ",";
            index++;
        }

    fout << std::endl;

    }
    fout.close();
}

int main(void){

    // Read the file
    auto result = readCSV("../data.csv");

    auto content = std::get<0>(result);

    for ( auto row : content )
    {
        row[row.size()-1] = (std::stod(row[row.size()-1])-32) * 5 / 9;
    }
    writeCSV("data_celcius.csv",std::get<1>(result),content);

    return EXIT_SUCCESS;

}
