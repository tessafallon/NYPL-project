# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

claims = Claim.create([{}, {}])
claim1 = Claim.find(1)
examiner = Examiner.new
examiner.save
claim1.claim_examiners.create(:examiner_id => examiner.id)
person = Person.new
person.claim_id = 1
person.save

damages = Damage.create([{:description => "hat", :quantity => 2, :unit => nil, :total_cost => 12.0, :overcharge? => true, :claim_id => 1},
                         {:description => "hat", :quantity => 1, :unit => nil, :total_cost => 2.0, :overcharge? => false, :claim_id => 2}])

HocrLayer.create([{:filename => "5057783u_hocr"}, {:filename => "5057784u_hocr"}, {:filename => "5057785u_hocr"}])