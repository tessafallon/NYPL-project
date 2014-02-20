class ClaimExaminer < ActiveRecord::Base

  belongs_to :claim
  belongs_to :examiner

end