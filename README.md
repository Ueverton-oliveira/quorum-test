## Quorum test
 
- Language
  - `Ruby`

- Gem
  - `gem install csv`
  
- run in your terminal 
  - `ruby result.rb`
  
 - checks the answers 
   - `answers/bills.csv`
   - `answers/legislators-support-and-oppose.csv`

1. Discuss your solution's time complexity. What tradeoffs did you make?
   ` Made this application thinking in a better desing patterns and clean code. The code is very easy to read and understand. So I built a CSV_save service to read and write csv data. And also separated all the classes in models to have a better understanding and logic in the code.`

2. How would you change your solution to account for future columns that might be requested, such as 'Bill Voted On Date' or 'Co-Sponsors'?
  `The service layer responsible for the business rule has become very easy to implement features, just add a field to the services     already created or add new services for inclusion and call it throughout the project for execution and if necessary, generate a csv file and just call the service CSV_save and add service object of the execution.`

3. Discuss your solution's time complexity. What tradeoffs did you make?
  - `I spend 2 times implematantion`
