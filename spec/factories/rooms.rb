FactoryGirl.define do
  factory :room, class: Room do
    ref 			"room#1"
    host_ref  "host#1"
    capacity  2
  end

  factory :room2, class: Room  do
    ref 			"room#2"
    host_ref  "host#1"
    capacity  2
  end

 end