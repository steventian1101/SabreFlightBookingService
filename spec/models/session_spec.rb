require "rails_helper"

RSpec.describe Session, type: :model do
  
  it "should be able to instantiate a new Session and initialize the required configuration settings" do
    session = Session.new

    expect(session.username     ).to eq ENV["username"     ]
    expect(session.password     ).to eq ENV["password"     ]
    expect(session.ipcc         ).to eq ENV["ipcc"         ]
    expect(session.account_email).to eq ENV["account_email"]
    expect(session.domain       ).to eq ENV["domain"       ]
  end
  
  it "should be able to override the configuration settings by passing a hash to the initializer" do
    username      = Faker::Internet.password
    password      = Faker::Internet.password
    ipcc          = "A1B2" 
    account_email = "accounts@example.com"
    domain        = "example.com" 
    
    session = Session.new(
      username:      username, 
      password:      password, 
      ipcc:          ipcc, 
      account_email: account_email, 
      domain:        domain
    )
    expect(session.username     ).to eq username
    expect(session.password     ).to eq password
    expect(session.ipcc         ).to eq ipcc
    expect(session.account_email).to eq account_email
    expect(session.domain       ).to eq domain
  end
  
  it "should do something" do
    session = Session.new
    
    r = session.build_header
    puts "@DEBUG #{__LINE__}    #{ap r}"
  end
end
