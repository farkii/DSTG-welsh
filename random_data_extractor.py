import csv
import random

def read_csv(input_file, encoding='utf-8', countries=None):
    data = []
    with open(input_file, 'r', newline='', encoding=encoding) as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            if countries is None or row['country'] in countries:
                data.append(row)
    return data

def write_csv(output_file, data, column_names):
    with open(output_file, 'w', newline='') as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=column_names)
        writer.writeheader()
        for row in data:
            writer.writerow(row)

def main():
    input_file = "movies.csv"
    output_file = input("Enter the output CSV file name: ")

    countries_to_include = ['United States', 'United Kingdom', 'Australia']

    data = read_csv(input_file, countries=countries_to_include)
    column_names = data[0].keys()

    x = int(input("Enter the number of random rows to select (x): "))

    random_rows = random.sample(data, min(x, len(data)))

    write_csv(output_file, random_rows, column_names)

    print(f"{x} random rows written to {output_file} successfully.")

if __name__ == "__main__":
    main()