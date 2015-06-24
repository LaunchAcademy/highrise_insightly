contact = HighriseInsightly::Contact.fetch('dan.pickett@launchacademy.com')
email = HighriseInsightly::Highrise::Email.new([
  {"Subject" => "Some subject"}, {"Author"=>"Corinne B."}, {"Written"=>"September 19, 2013 22:03"}, {"About"=>"John Smith"}, {"Body"=>"Inmailed"}
])
contact.save_email(email)
