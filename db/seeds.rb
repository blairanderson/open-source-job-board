# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

default_settings = [
  {name: "site.title", value: "Open Source Job Board"},
  {name: "site.description", value: "HOW META! Open Source Job Board for Open Source Jobs!"},
  {name: "sidebar.cta_helper", value: "Find Open Source Talent! We'd love to help you find your person!"}
]

default_settings.each do |setting|
  Setting.where(setting.slice(:name)).first_or_create(setting.slice(:value))
end

user = User.first || User.create({
    email: "example@example.com",
    password: "password",
    password_confirmation: "password"
  })


if Post.count == 0
  Post.create([
      {
        "user_id" => user.id,
        "title" => "Sample Elixir Developer",
        "location" => "Seattle",
        "job_type" => "full_time",
        "description" => "this job is super cool can put a ton of text here\r\n\r\nTote bag portland salvia, pork belly four dollar toast hashtag photo booth retro tilde try-hard 8-bit selfies cliche heirloom neutra. Cred mlkshk artisan health goth. Migas pitchfork iPhone, fashion axe pickled squid craft beer plaid. Beard kale chips street art normcore, drinking vinegar seitan readymade pabst vegan keffiyeh gochujang direct trade. Letterpress aesthetic poutine, swag brooklyn franzen sartorial polaroid fap health goth disrupt butcher narwhal. Meditation 90's venmo distillery tacos bushwick. Chartreuse humblebrag venmo, sriracha farm-to-table sartorial dreamcatcher disrupt art party fap knausgaard.\r\n\r\nSwag mustache PBR&B trust fund. Listicle man bun banh mi fixie, raw denim taxidermy twee migas salvia knausgaard mixtape pabst biodiesel. Tumblr migas next level tousled williamsburg. Retro franzen kickstarter post-ironic, aesthetic actually cornhole listicle mustache biodiesel intelligentsia man braid cred. Gastropub fixie 3 wolf moon, mixtape bitters ugh tofu disrupt sriracha. Try-hard ramps medit",
        "company_name" => "WidgetKing",
        "company_url" => "http://www.blairanderson.co",
        "company_logo" => "http://41.media.tumblr.com/tumblr_lrzceqsLeT1qgavi8o1_500.jpg",
        "how_to_apply" => "apply_by_url",
        "how_to_apply_address" => "http://www.blairanderson.co/open-source-job-board/apply.html",
        "contact_email" => "blair81@gmail.com",
        "rate" => "$120 - $160K DOE",
        "status" => "published"},
      {
        "user_id" => user.id,
        "title" => "Demo Rails Developer",
        "location" => "SF",
        "job_type" => "full_time",
        "description" => "this job is super cool can put a ton of text here\r\n\r\nTote bag portland salvia, pork belly four dollar toast hashtag photo booth retro tilde try-hard 8-bit selfies cliche heirloom neutra. Cred mlkshk artisan health goth. Migas pitchfork iPhone, fashion axe pickled squid craft beer plaid. Beard kale chips street art normcore, drinking vinegar seitan readymade pabst vegan keffiyeh gochujang direct trade. Letterpress aesthetic poutine, swag brooklyn franzen sartorial polaroid fap health goth disrupt butcher narwhal. Meditation 90's venmo distillery tacos bushwick. Chartreuse humblebrag venmo, sriracha farm-to-table sartorial dreamcatcher disrupt art party fap knausgaard.\r\n\r\nSwag mustache PBR&B trust fund. Listicle man bun banh mi fixie, raw denim taxidermy twee migas salvia knausgaard mixtape pabst biodiesel. Tumblr migas next level tousled williamsburg. Retro franzen kickstarter post-ironic, aesthetic actually cornhole listicle mustache biodiesel intelligentsia man braid cred. Gastropub fixie 3 wolf moon, mixtape bitters ugh tofu disrupt sriracha. Try-hard ramps medit",
        "company_name" => "SuperBowling",
        "company_url" => "http://www.blairanderson.co",
        "company_logo" => "http://41.media.tumblr.com/tumblr_lrzceqsLeT1qgavi8o1_500.jpg",
        "how_to_apply" => "apply_by_url",
        "how_to_apply_address" => "http://www.blairanderson.co/open-source-job-board/apply.html",
        "contact_email" => "blair81@gmail.com",
        "rate" => "$100 - $120K DOE",
        "status" => "draft"},
      {
        "user_id" => user.id,
        "title" => "GoLang Expert - social network for dogs",
        "location" => "remote,seattle",
        "job_type" => "full_time",
        "description" => "this job is super cool can put a ton of text here\r\n\r\nTote bag portland salvia, pork belly four dollar toast hashtag photo booth retro tilde try-hard 8-bit selfies cliche heirloom neutra. Cred mlkshk artisan health goth. Migas pitchfork iPhone, fashion axe pickled squid craft beer plaid. Beard kale chips street art normcore, drinking vinegar seitan readymade pabst vegan keffiyeh gochujang direct trade. Letterpress aesthetic poutine, swag brooklyn franzen sartorial polaroid fap health goth disrupt butcher narwhal. Meditation 90's venmo distillery tacos bushwick. Chartreuse humblebrag venmo, sriracha farm-to-table sartorial dreamcatcher disrupt art party fap knausgaard.\r\n\r\nSwag mustache PBR&B trust fund. Listicle man bun banh mi fixie, raw denim taxidermy twee migas salvia knausgaard mixtape pabst biodiesel. Tumblr migas next level tousled williamsburg. Retro franzen kickstarter post-ironic, aesthetic actually cornhole listicle mustache biodiesel intelligentsia man braid cred. Gastropub fixie 3 wolf moon, mixtape bitters ugh tofu disrupt sriracha. Try-hard ramps medit",
        "company_name" => "BananaStand",
        "company_url" => "http://www.blairanderson.co",
        "company_logo" => "http://41.media.tumblr.com/tumblr_lrzceqsLeT1qgavi8o1_500.jpg",
        "how_to_apply" => "apply_by_url",
        "how_to_apply_address" => "http://www.blairanderson.co/open-source-job-board/apply.html",
        "contact_email" => "blair81@gmail.com",
        "rate" => "$100 - $120K DOE",
        "status" => "archived"},
    ])
end


puts "users #{User.count}"
puts "posts #{Post.count}"
puts "Settings #{Setting.count}"
