#functions to help answer the main questions
#1. Which companies have good credit history (return money on
#time or no later then 31 days late)? If the payment is due in the future
#and payment wasn't yet made, we don't rule out the companies who still have
#chance to pay no later then 31 days.

#2. Which companies at the moment have more then 15M on account?
#Current balance is simply total amount of all not yet repaid incoming
#payments - total amount of all not yet paid lended money.
#Paid loans don't influence this obviously as at the end both
#companies have zero account difference.

#split out the companyID from the list of companies

filename = '/Users/meads/Programming/Ruby/CompaniesTest/workspace/data/companies.txt'

def removeWhiteSpaces loadedFile #puts each line into an array and removes all whitespaces
    arrayOfLines = []
    File.read(loadedFile).each_line do |f|
        arrayOfLines << f.gsub(/\s+/, "")
    end
    
    
    return arrayOfLines
end

def extractCompanyId
    arrayId = []
    a2 = removeWhiteSpaces '/Users/meads/Programming/Ruby/CompaniesTest/workspace/data/companies.txt'
    
    a2.each do |line|
        arrayId << line.scan(/\d+/).first #[-8,8] look 8 charters from right and return the 8 characters
    end
    
    puts arrayId
    
end


extractCompanyId