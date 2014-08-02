#!/Users/petr/.rvm/rubies/ruby-2.0.0-p247/bin/ruby

@companies = ["00007941", "00009327", "00010064", "00023132", "00029325", "00037498", "00045011", "00046254", "00053184", "00055010", "03299237", "03299732", "03299787", "03300414", "03300469", "03300964", "03301107", "03301602", "03301657", "03302845", "02892059", "02892554", "02893247", "02893742", "02893797", "02894435", "02894930", "02894985", "02895128", "02895623"]

def random_company
  @companies[(rand*@companies.length).floor]
end

def random_amount
  (rand * 10_000).round * 1000
end

def random_date(time, diff = 60, power = 1, nilable = false)
  days = ((rand**power)*diff).round
  generated = time + days*3600*24

  nilable && generated > Time.now ? nil : generated
end

def generate_lease
  
  from_date = random_date(Time.now - 600*3600*24, 590, 1)
  due_date = random_date(from_date, 60, 3)
  payment_date = random_date(from_date, 100, 3, true)

  from_date_formatted = from_date ? from_date.strftime('%Y-%m-%d') : 'nil'
  due_date_formatted = due_date ? due_date.strftime('%Y-%m-%d') : 'nil'
  payment_date_formatted = payment_date ? payment_date.strftime('%Y-%m-%d') : 'nil'

  "#{random_company} #{random_company} #{random_amount} #{from_date_formatted} #{due_date_formatted} #{payment_date_formatted}"
end

leases = (0...1000).map do
  generate_lease
end


File.binwrite('data/loans.txt', leases.join("\n"))