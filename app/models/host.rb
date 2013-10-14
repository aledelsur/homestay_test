class Host < ActiveRecord::Base
	has_many :rooms, primary_key: "ref", foreign_key: "host_ref"
end
